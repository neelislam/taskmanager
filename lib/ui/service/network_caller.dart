import 'dart:convert';

import 'package:http/http.dart';



class NetworkResponse{
  final bool isSuccess;
  final int statusCode;
  final Map<String, dynamic> body;
  final dynamic errorMessage;

  NetworkResponse({
    required this.isSuccess,
    required this.statusCode,
    required this.body,
    required this.errorMessage
  });
}

class NetworkCaller{
  static const String _defaultErrorMessage = 'Something went wrong';
  static Future<NetworkResponse> getRequest({required String url}) async {
    try {
      Uri uri = Uri.parse(url);
      Response response = await get(uri);
      if (response.statusCode == 200) {
        final decodedJson = jsonDecode(response.body);
        return NetworkResponse(isSuccess: true,
            statusCode: response.statusCode,
            body: decodedJson,
            errorMessage: null);
      }
      else {
        final decodedJson = jsonDecode(response.body);
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          errorMessage: decodedJson['data'] ?? _defaultErrorMessage,
          body: {},

        );
      }
    }
    catch (e){
      return NetworkResponse(isSuccess: false,
          statusCode: -1,
          errorMessage: e.toString(),
          body: {}
      );
    }
  }
}