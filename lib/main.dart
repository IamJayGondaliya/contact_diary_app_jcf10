import 'package:contact_diary_app_jcf10/utils/globals.dart';
import 'package:contact_diary_app_jcf10/utils/image_utils.dart';
import 'package:contact_diary_app_jcf10/utils/route_utils.dart';
import 'package:contact_diary_app_jcf10/views/screens/add_contact_page.dart';
import 'package:contact_diary_app_jcf10/views/screens/contact_detail_page.dart';
import 'package:contact_diary_app_jcf10/views/screens/edit_contact_page.dart';
import 'package:contact_diary_app_jcf10/views/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isGrid = false;
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //Light Theme
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
      ),
      //Dark Theme
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
      initialRoute: MyRoutes.splashScreen,
      routes: {
        MyRoutes.addContactPage: (context) => const AddContactPage(),
        MyRoutes.editContactPage: (context) => const EditContactPage(),
        MyRoutes.contactDetailPage: (context) => const ContactDetailPage(),
        MyRoutes.splashScreen: (context) => const SplashScreenPage(),
        MyRoutes.home: (context) => Builder(
              builder: (context) {
                return Scaffold(
                  appBar: AppBar(
                    title: const Text("HomePage"),
                    centerTitle: true,
                    actions: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isDark = !isDark;
                          });
                        },
                        icon: Icon(isDark ? Icons.light_mode_outlined : Icons.dark_mode_outlined),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isGrid = !isGrid;
                          });
                        },
                        icon: Icon(isGrid ? Icons.list : Icons.grid_on),
                      ),
                    ],
                  ),
                  body: (Globals.allContacts.isNotEmpty)
                      ? Padding(
                          padding: const EdgeInsets.all(18),
                          child: Scrollbar(
                            interactive: true,
                            thickness: 10,
                            radius: const Radius.circular(50),
                            child: isGrid
                                ? GridView.builder(
                                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      childAspectRatio: 2 / 3,
                                      mainAxisSpacing: 5,
                                      crossAxisSpacing: 5,
                                    ),
                                    itemCount: Globals.allContacts.length,
                                    itemBuilder: (context, index) => Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.primaries[index % 18].shade200,
                                      ),
                                      child: Column(
                                        children: [
                                          Expanded(
                                            flex: 3,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: FileImage(Globals.allContacts[index].image!),
                                                  fit: BoxFit.cover,
                                                ),
                                                borderRadius: const BorderRadius.vertical(
                                                  top: Radius.circular(10),
                                                ),
                                                color: Colors.primaries[index % 18].shade100,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                borderRadius: const BorderRadius.vertical(
                                                  bottom: Radius.circular(10),
                                                ),
                                                color: Colors.primaries[index % 18].shade500,
                                              ),
                                              padding: const EdgeInsets.all(10),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    "${Globals.allContacts[index].name}",
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      overflow: TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {},
                                                    child: const Icon(
                                                      Icons.call,
                                                      size: 20,
                                                      color: Colors.green,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                : Column(
                                    children: [
                                      Expanded(
                                        flex: 13,
                                        child: ListView.builder(
                                          itemCount: Globals.allContacts.length,
                                          itemBuilder: (context, index) => Slidable(
                                            closeOnScroll: true,
                                            endActionPane: ActionPane(
                                              motion: const ScrollMotion(),
                                              children: [
                                                SlidableAction(
                                                  onPressed: (val) {},
                                                  icon: Icons.call,
                                                  backgroundColor: Colors.green,
                                                ),
                                                SlidableAction(
                                                  onPressed: (val) async {
                                                    await Navigator.of(context)
                                                        .pushNamed(MyRoutes.editContactPage, arguments: index);
                                                    setState(() {});
                                                  },
                                                  icon: Icons.edit,
                                                  backgroundColor: Colors.blue,
                                                ),
                                              ],
                                            ),
                                            child: ListTile(
                                              onTap: () {
                                                Navigator.of(context).pushNamed(MyRoutes.contactDetailPage, arguments: index);
                                              },
                                              leading: CircleAvatar(
                                                backgroundColor: Colors.primaries[index % 18].shade200,
                                                foregroundImage: FileImage(Globals.allContacts[index].image!),
                                                child: Text("${index + 1}"),
                                              ),
                                              title: Text("${Globals.allContacts[index].name}"),
                                              subtitle: Text("${Globals.allContacts[index].contact}"),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                          ),
                        )
                      : const Center(
                          child: Text("No contacts yet !!"),
                        ),
                  floatingActionButton: FloatingActionButton(
                    onPressed: () async {
                      await Navigator.of(context).pushNamed(MyRoutes.addContactPage);
                      setState(() {});
                    },
                    child: const Icon(Icons.add),
                  ),
                );
              },
            ),
      },
    );
  }
}
