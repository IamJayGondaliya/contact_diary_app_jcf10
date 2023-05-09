import 'package:contact_diary_app_jcf10/utils/globals.dart';
import 'package:contact_diary_app_jcf10/views/components/my_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactDetailPage extends StatefulWidget {
  const ContactDetailPage({Key? key}) : super(key: key);

  @override
  State<ContactDetailPage> createState() => _ContactDetailPageState();
}

class _ContactDetailPageState extends State<ContactDetailPage> {
  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)!.settings.arguments as int;

    return Scaffold(
      appBar: AppBar(
        leading: const MyBackButton(),
        title: const Text("ContactDetailPage"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              foregroundImage: FileImage(Globals.allContacts[index].image!),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(Globals.allContacts[index].name),
            const SizedBox(
              height: 20,
            ),
            Text(Globals.allContacts[index].contact),
            const SizedBox(
              height: 20,
            ),
            Text(Globals.allContacts[index].email),
            const SizedBox(
              height: 20,
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: () async {
                    Uri call = Uri(
                      scheme: 'tel',
                      path: Globals.allContacts[index].contact,
                    );
                    try {
                      await launchUrl(call);
                    } on MissingPluginException {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: const Text("Please restrats the application !!"),
                        ),
                      );
                    } catch (e) {
                      print("=========================");
                      print("EXCEPTION: $e");
                      print("=========================");
                    }
                  },
                  child: const Icon(Icons.call),
                  backgroundColor: Colors.green,
                ),
                FloatingActionButton(
                  onPressed: () {},
                  child: const Icon(Icons.email),
                  backgroundColor: Colors.red,
                ),
                FloatingActionButton(
                  onPressed: () {},
                  child: const Icon(Icons.message),
                  backgroundColor: Colors.blue,
                ),
                FloatingActionButton(
                  onPressed: () {},
                  child: const Icon(Icons.share),
                  backgroundColor: Colors.orange,
                ),
              ],
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
