import 'package:flutter/material.dart';
import 'package:taskmanager/data/service/network_caller.dart';
import 'package:taskmanager/ui/widgets/screen_background.dart';
import 'package:taskmanager/ui/widgets/snack_bar_message.dart';

import '../../data/urls.dart';

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
  bool _addNewTaskInProgress = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ScreenBackground(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40),
                Text(
                  'Add new Task',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _titleTEController,
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter your title';
                    }
                    return null;
                  },
                  decoration: InputDecoration(hintText: 'Title'),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _descriptionTEController,
                  maxLines: 5,
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter your title';
                    }
                    return null;
                  },
                  decoration: InputDecoration(hintText: 'Description'),
                ),
                const SizedBox(height: 16),
                Visibility(
                  visible: _addNewTaskInProgress = false,
                  replacement: Center(child: CircularProgressIndicator()),
                  child: ElevatedButton(
                    onPressed: _onTapSubmitButton,
                    child: Icon(Icons.arrow_circle_right_outlined),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTapSubmitButton() {
    if (_formKey.currentState!.validate()) {}
    // Navigator.pop(context);
  }

  Future<void> _addNewTask() async {
    _addNewTaskInProgress = true;
    setState(() {});

    Map<String, String> requestBody = {
      "title": _titleTEController.text.trim(),
      "description": _descriptionTEController.text.trim(),
      "status": "New",
    };

    NetworkResponse response = await NetworkCaller.postRequest(
      url: Urls.loginUrl,
      body: requestBody,
    );
  _addNewTaskInProgress = true;
  setState(() {});
    if(response.isSuccess){
    _titleTEController.clear();
    _descriptionTEController.clear();
    showSnackBarMessage(context, 'Added new task');
    } else {
      showSnackBarMessage(context, response.errorMessage!);
    }
  }

  @override
  void dispose() {
    _titleTEController.dispose();
    _descriptionTEController.dispose();
    super.dispose();
  }
}
