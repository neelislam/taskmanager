import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:taskmanager/ui/app.dart';
import 'package:taskmanager/ui/controllers/auth_controller.dart';
import 'package:taskmanager/ui/screen/sign_in_screen.dart';

/// Represents the response from a network request.
/// [isSuccess]: True if the request was successful (HTTP 200), false otherwise.
/// [statusCode]: The HTTP status code of the response.
/// [body]: The decoded JSON body of the response, if successful.
/// [errorMessage]: An error message if the request failed or an exception occurred.
class NetworkResponse {
  final bool isSuccess;
  final int statusCode;
  final Map<String, dynamic>? body;
  final String? errorMessage;

  NetworkResponse({
    required this.isSuccess,
    required this.statusCode,
    this.body,
    this.errorMessage,
  });
}

/// A utility class for making HTTP GET and POST requests.
class NetworkCaller {
  static const String _defaultErrorMessage = 'Something went wrong';
  static const String _unAuthorizedMessage = 'Un-Authorized';

  /// Makes an HTTP GET request to the specified [url].
  /// Returns a [NetworkResponse] indicating success or failure,
  /// along with the status code, body, and an error message if applicable.
  static Future<NetworkResponse> getRequest({required String url}) async {
    try {
      Uri uri = Uri.parse(url);
      final Map<String, String> headers = {
        'token': AuthController.accessToken ?? '', // Include authentication token
      };
      // Log the outgoing request details.
      _logRequest(url, null, headers);

      Response response = await get(uri, headers:headers);

      // Log the incoming response details.
      _logResponse(url, response);

      if (response.statusCode == 200) {
        // Attempt to decode the JSON response for successful requests.
        try {
          final decodedJson = jsonDecode(response.body);
          return NetworkResponse(
            isSuccess: true,
            statusCode: response.statusCode,
            body: decodedJson,
            errorMessage: null,
          );
        } on FormatException {
          // Handle cases where the response body is not valid JSON.
          return NetworkResponse(
            isSuccess: false,
            statusCode: response.statusCode,
            errorMessage: 'Invalid JSON format in response body',
          );
        }
      } else {
        // For non-200 status codes, attempt to parse an error message from the body.
        try {
          final decodedJson = jsonDecode(response.body);
          return NetworkResponse(
            isSuccess: false,
            statusCode: response.statusCode,
            errorMessage: decodedJson['data'] ?? _defaultErrorMessage,
          );
        } on FormatException {
          // If JSON parsing fails for error responses, provide a generic error message.
          return NetworkResponse(
            isSuccess: false,
            statusCode: response.statusCode,
            errorMessage: 'Error: ${response.statusCode}. Could not parse error message from response.',
          );
        }
      }
    } catch (e) {
      // Catch any exceptions during the HTTP request itself (e.g., network issues).
      debugPrint('Error in getRequest: $e');
      return NetworkResponse(
        isSuccess: false,
        statusCode: -1, // Custom status code for network errors
        errorMessage: e.toString(),
      );
    }
  }
  /// Makes an HTTP POST request to the specified [url] with an optional [body].
  /// Includes 'content-type': 'application/json' header and 'token' from [AuthController].
  /// Handles 401 Unauthorized responses by clearing user data and navigating to the sign-in screen.
  /// Returns a [NetworkResponse] indicating success or failure.
  static Future<NetworkResponse> postRequest({
    required String url,
    Map<String, String>? body,
    bool isFromLogin = false
  }) async {
    try {
      Uri uri = Uri.parse(url);
      final Map<String, String> headers = {
        'content-type': 'application/json',
        'token': AuthController.accessToken ?? '', // Include authentication token
      };

      // Log the outgoing request details, including headers and encoded body.
      _logRequest(url, body, headers);

      Response response = await post(
        uri,
        headers: headers,
        body: jsonEncode(body), // Encode the request body to JSON
      );

      // Log the incoming response details.
      _logResponse(url, response);

      if (response.statusCode == 200) {
        // Attempt to decode the JSON response for successful requests.
        try {
          final decodedJson = jsonDecode(response.body);
          return NetworkResponse(
            isSuccess: true,
            statusCode: response.statusCode,
            body: decodedJson,
            errorMessage: null,
          );
        } on FormatException {
          // Handle cases where the response body is not valid JSON.
          return NetworkResponse(
            isSuccess: false,
            statusCode: response.statusCode,
            errorMessage: 'Invalid JSON format in response body',
          );
        }
      } else if (response.statusCode == 401) {
        if(isFromLogin == false){
          _onUnAuthorize();
        }
        // If the response is 401 Unauthorized, trigger the un-authorization flow.
        _onUnAuthorize();
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          errorMessage: _unAuthorizedMessage,
        );
      } else {
        // For other non-200 status codes, attempt to parse an error message from the body.
        try {
          final decodedJson = jsonDecode(response.body);
          return NetworkResponse(
            isSuccess: false,
            statusCode: response.statusCode,
            errorMessage: decodedJson['data'] ?? _defaultErrorMessage,
          );
        } on FormatException {
          // If JSON parsing fails for error responses, provide a generic error message.
          return NetworkResponse(
            isSuccess: false,
            statusCode: response.statusCode,
            errorMessage: 'Error: ${response.statusCode}. Could not parse error message from response.',
          );
        }
      }
    } catch (e) {
      // Catch any exceptions during the HTTP request itself (e.g., network issues).
      debugPrint('Error in postRequest: $e');
      return NetworkResponse(
        isSuccess: false,
        statusCode: -1, // Custom status code for network errors
        errorMessage: e.toString(),
      );
    }
  }

  /// Logs the details of an outgoing HTTP request to the debug console.
  static void _logRequest(
      String url,
      Map<String, String>? body,
      Map<String, String>? headers,
      ) {
    debugPrint(
      '======================Request============================\n'
          'URL: $url\n'
          'HEADERS: $headers\n'
          'BODY: ${body != null ? jsonEncode(body) : 'null'}\n' // Encode body for better logging readability
          '==================================================',
    );
  }

  /// Logs the details of an incoming HTTP response to the debug console.
  static void _logResponse(String url, Response response) {
    debugPrint(
      '=====================Response=============================\n'
          'URL: $url\n'
          'STATUS CODE: ${response.statusCode}\n'
          'BODY: ${response.body}\n'
          '==================================================',
    );
  }

  /// Handles un-authorization by clearing user data and navigating to the sign-in screen.
  /// It checks if the navigator context is available before attempting navigation to prevent errors.
  static Future<void> _onUnAuthorize() async {
    await AuthController.clearData(); // Clear any stored authentication data.

    // Ensure the navigator context is available before attempting to push a new route.
    if (TaskManagerApp.navigator.currentContext != null) {
      Navigator.of(
        TaskManagerApp.navigator.currentContext!,
      ).pushNamedAndRemoveUntil(
        SignInScreen.name,
            (predicate) => false, // Remove all previous routes from the stack.
      );
    } else {
      debugPrint('Error: Navigator context not available for un-authorization. Cannot navigate.');
      // In a real application, you might want to add a fallback,
      // like showing a toast message or a dialog, if navigation isn't possible.
    }
  }
}
