import 'package:contact_diary_app_jcf10/utils/globals.dart';
import 'package:contact_diary_app_jcf10/views/components/my_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

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
                  backgroundColor: Colors.green,
                  child: const Icon(Icons.call),
                ),
                FloatingActionButton(
                  onPressed: () async {
                    Uri mail = Uri(
                      scheme: 'mailto',
                      query:
                          "subject=This is demo mail&body=Dear ${Globals.allContacts[index].name},\n\tHere I've sent a demo mail from flutter testing software.",
                      path: Globals.allContacts[index].email,
                    );

                    await launchUrl(mail);
                  },
                  backgroundColor: Colors.red,
                  child: const Icon(Icons.email),
                ),
                FloatingActionButton(
                  onPressed: () async {
                    Uri sms = Uri(
                      scheme: 'sms',
                      query:
                          "body=Dear ${Globals.allContacts[index].name},\n\tHere I've sent a demo mail from flutter testing software.",
                      path: Globals.allContacts[index].contact,
                    );

                    await launchUrl(sms);
                  },
                  backgroundColor: Colors.blue,
                  child: const Icon(Icons.message),
                ),
                FloatingActionButton(
                  onPressed: () {
                    // Share.share(
                    //     "Name: ${Globals.allContacts[index].name}\nContact: ${Globals.allContacts[index].contact}\nEmail: ${Globals.allContacts[index].email}\n\nShared from ContactDiaryApp.");

                    Share.shareXFiles([XFile(Globals.allContacts[index].image!.path)],
                        text:
                            "Name: ${Globals.allContacts[index].name}\nContact: ${Globals.allContacts[index].contact}\nEmail: ${Globals.allContacts[index].email}\n\nShared from ContactDiaryApp.");
                  },
                  backgroundColor: Colors.orange,
                  child: const Icon(Icons.share),
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
