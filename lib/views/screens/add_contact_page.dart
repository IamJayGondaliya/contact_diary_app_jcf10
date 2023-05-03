import 'package:contact_diary_app_jcf10/views/components/my_back_button.dart';
import 'package:flutter/material.dart';

class AddContactPage extends StatefulWidget {
  const AddContactPage({Key? key}) : super(key: key);

  @override
  State<AddContactPage> createState() => _AddContactPageState();
}

class _AddContactPageState extends State<AddContactPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const MyBackButton(),
        title: const Text("AddContactPage"),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          "Hello Dart",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
    );
  }
}
