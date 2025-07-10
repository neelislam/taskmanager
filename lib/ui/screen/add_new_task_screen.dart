import 'package:flutter/material.dart';
import 'package:taskmanager/ui/widgets/screen_background.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key});

  static const String name = '/add-new-task';

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  final TextEditingController _titleTEController = TextEditingController();
  final TextEditingController _descriptionTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ScreenBackground(
        child: Padding(
          padding: const EdgeInsets.all(16),
         child:  Form(
           key: _formKey,
           autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              Text(
                'Add new Task',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _titleTEController,
                validator: (String? value){
                  if(value?.trim().isEmpty ?? true){
                    return 'Enter your title';
                  }
                  return null;
                },
                decoration:
                InputDecoration(
                  hintText: 'Title'
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _descriptionTEController,
                maxLines: 5,
                validator: (String? value){
                  if(value?.trim().isEmpty ?? true){
                    return 'Enter your title';
                  }
                  return null;
                },
                decoration:
                InputDecoration(
                    hintText: 'Description'
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _onTapSubmitButton,
                child: Icon(Icons.arrow_circle_right_outlined),
              ),
            ],
          ),
        ),
      ),
    )
    );
  }


  void _onTapSubmitButton(){
    if(_formKey.currentState!.validate()){
    }
    Navigator.pop(context);
  }

  @override
  void dispose(){
    _titleTEController.dispose();
    _descriptionTEController.dispose();
    super.dispose();


  }
}
