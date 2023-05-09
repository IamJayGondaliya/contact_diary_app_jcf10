import 'dart:io';

import 'package:contact_diary_app_jcf10/modals/contact_modal.dart';
import 'package:contact_diary_app_jcf10/utils/globals.dart';
import 'package:contact_diary_app_jcf10/views/components/my_back_button.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditContactPage extends StatefulWidget {
  const EditContactPage({Key? key}) : super(key: key);

  @override
  State<EditContactPage> createState() => _EditContactPageState();
}

class _EditContactPageState extends State<EditContactPage> {
  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)!.settings.arguments as int;

    return Scaffold(
      appBar: AppBar(
        leading: const MyBackButton(),
        title: const Text("EditContactPage"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
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
                      foregroundImage:
                          Globals.allContacts[index].image != null ? FileImage(Globals.allContacts[index].image!) : null,
                      child: const Text("Add Image"),
                    ),
                    FloatingActionButton(
                      onPressed: () async {
                        ImagePicker picker = ImagePicker();

                        XFile? file = await picker.pickImage(source: ImageSource.camera);

                        if (file != null) {
                          setState(() {
                            Globals.allContacts[index].image = File(file.path);
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
                  initialValue: Globals.allContacts[index].name,
                  onChanged: (val) {
                    Globals.allContacts[index].name = val;
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
                  initialValue: Globals.allContacts[index].email,
                  onChanged: (val) {
                    Globals.allContacts[index].email = val;
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
                  initialValue: Globals.allContacts[index].contact,
                  onChanged: (val) {
                    Globals.allContacts[index].contact = val;
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
