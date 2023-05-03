import 'package:contact_diary_app_jcf10/views/components/my_back_button.dart';
import 'package:flutter/material.dart';

class ContactDetailPage extends StatefulWidget {
  const ContactDetailPage({Key? key}) : super(key: key);

  @override
  State<ContactDetailPage> createState() => _ContactDetailPageState();
}

class _ContactDetailPageState extends State<ContactDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const MyBackButton(),
        title: const Text("ContactDetailPage"),
        centerTitle: true,
      ),
    );
  }
}
