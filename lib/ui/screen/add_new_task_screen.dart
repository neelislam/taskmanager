import 'package:flutter/material.dart';
import 'package:taskmanager/data/service/network_caller.dart';
import 'package:taskmanager/ui/widgets/screen_background.dart';
import 'package:taskmanager/ui/widgets/snack_bar_message.dart';

import '../../data/urls.dart'; // Assuming Urls.createTask is defined here

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key});

  static const String name = '/add-new-task';

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  final TextEditingController _titleTEController = TextEditingController();
  final TextEditingController _descriptionTEController =
  TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _addNewTaskInProgress = false; // Initial state: not in progress

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Task'), // Added a title to the AppBar
      ),
      body: ScreenBackground(
        child: Padding(
          padding: const EdgeInsets.all(16), // Use const for EdgeInsets
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24), // Adjusted height for better spacing
                Text(
                  'Add new Task',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _titleTEController,
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Please enter a title'; // Improved validation message
                    }
                    return null;
                  },
                  decoration: const InputDecoration(hintText: 'Title'), // Use const
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _descriptionTEController,
                  maxLines: 5,
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Please enter a description'; // Corrected validation message
                    }
                    return null;
                  },
                  decoration: const InputDecoration(hintText: 'Description'), // Use const
                ),
                const SizedBox(height: 16),
                // Corrected Visibility widget logic:
                // Show CircularProgressIndicator when _addNewTaskInProgress is true,
                // otherwise show the ElevatedButton.
                Visibility(
                  visible: !_addNewTaskInProgress, // Show button if not in progress
                  replacement: const Center(child: CircularProgressIndicator()), // Show progress if in progress
                  child: ElevatedButton(
                    onPressed: _onTapSubmitButton,
                    child: const Icon(Icons.arrow_circle_right_outlined), // Use const
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Handles the tap event on the submit button.
  /// Validates the form and calls [_addNewTask] if the form is valid.
  void _onTapSubmitButton() {
    if (_formKey.currentState!.validate()) {
      _addNewTask();
    }
  }

  /// Sends a POST request to add a new task.
  /// Updates the UI to show a loading indicator during the request.
  /// Clears text fields and shows a success message on success, or an error message on failure.
  /// Pops the screen on successful task addition.
  Future<void> _addNewTask() async {
    _addNewTaskInProgress = true;
    setState(() {}); // Update UI to show loading indicator

    Map<String, String> requestBody = {
      "title": _titleTEController.text.trim(),
      "description": _descriptionTEController.text.trim(),
      "status": "New", // Default status for a new task
    };

    // Debug print the URL to verify it's correct
    debugPrint('Attempting to create task at URL: ${Urls.createNewTaskUrl}');

    NetworkResponse response = await NetworkCaller.postRequest(
      url: Urls.createNewTaskUrl, // Assuming Urls.createTask is the correct endpoint for adding tasks
      body: requestBody,
    );

    _addNewTaskInProgress = false;
    setState(() {}); // Update UI to hide loading indicator

    if (response.isSuccess) {
      _titleTEController.clear();
      _descriptionTEController.clear();
      showSnackBarMessage(context, 'New task added successfully!'); // Improved success message
      Navigator.pop(context); // Pop the screen on successful task addition
    } else {
      // Print the exact error message from the network response for debugging
      debugPrint('Failed to add new task. Error: ${response.errorMessage}');
      showSnackBarMessage(context, response.errorMessage ?? 'Failed to add new task. Please try again.'); // Handle null errorMessage gracefully
    }
  }


  @override
  void dispose() {
    _titleTEController.dispose();
    _descriptionTEController.dispose();
    super.dispose();
  }
}
