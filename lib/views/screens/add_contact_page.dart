import 'dart:io';

import 'package:contact_diary_app_jcf10/modals/contact_modal.dart';
import 'package:contact_diary_app_jcf10/utils/globals.dart';
import 'package:contact_diary_app_jcf10/views/components/my_back_button.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddContactPage extends StatefulWidget {
  const AddContactPage({Key? key}) : super(key: key);

  @override
  State<AddContactPage> createState() => _AddContactPageState();
}

class _AddContactPageState extends State<AddContactPage> {
  File? image;
  String? name;
  String? contact;
  String? email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const MyBackButton(),
        title: const Text("AddContactPage"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Globals.allContacts.add(
                Contact(
                  name: name!,
                  contact: contact!,
                  email: email!,
                  image: image!,
                ),
              );
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.done),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      radius: 60,
                      foregroundImage: image != null ? FileImage(image!) : null,
                      child: const Text("Add Image"),
                    ),
                    FloatingActionButton(
                      onPressed: () async {
                        ImagePicker picker = ImagePicker();

                        XFile? file = await picker.pickImage(source: ImageSource.camera);

                        if (file != null) {
                          setState(() {
                            image = File(file.path);
                          });
                        }
                      },
                      mini: true,
                      child: const Icon(Icons.add),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  onChanged: (val) {
                    name = val;
                  },
                  decoration: InputDecoration(
                    hintText: "Enter name",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  onChanged: (val) {
                    email = val;
                  },
                  decoration: InputDecoration(
                    hintText: "Enter email",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  onChanged: (val) {
                    contact = val;
                  },
                  decoration: InputDecoration(
                    hintText: "Enter contact",
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
