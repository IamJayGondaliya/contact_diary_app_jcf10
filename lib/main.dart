import 'package:contact_diary_app_jcf10/utils/image_utils.dart';
import 'package:contact_diary_app_jcf10/utils/route_utils.dart';
import 'package:contact_diary_app_jcf10/views/screens/add_contact_page.dart';
import 'package:contact_diary_app_jcf10/views/screens/contact_detail_page.dart';
import 'package:contact_diary_app_jcf10/views/screens/edit_contact_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.red,
      systemNavigationBarColor: Colors.red,
    ),
  );

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.landscapeLeft,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int n = 5;

  bool isGrid = false;
  bool isDark = false;

  SliderComponentShape? myThumbShape = SliderComponentShape.noThumb;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //Light Theme
      theme: ThemeData(
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            color: Colors.teal,
            fontWeight: FontWeight.bold,
          ),

          // bodyMedium: TextStyle(
          //   color: Colors.indigo,
          //   fontSize: 26,
          // ),
          // titleLarge: TextStyle(
          //   fontSize: 32,
          //   color: Colors.red,
          // ),
          // bodyLarge: TextStyle(
          //   fontSize: 32,
          // ),
        ),
        // useMaterial3: true,
        colorSchemeSeed: Colors.blue,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.blue.shade600,
          foregroundColor: Colors.white,
          splashColor: Colors.amber,
        ),
      ),
      //Dark Theme
      darkTheme: ThemeData(
        useMaterial3: true,
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            color: Colors.teal,
            fontWeight: FontWeight.bold,
          ),
        ),
        // useMaterial3: true,
        brightness: Brightness.dark,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.teal,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
      routes: {
        MyRoutes.addContactPage: (context) => const AddContactPage(),
        MyRoutes.editContactPage: (context) => const EditContactPage(),
        MyRoutes.contactDetailPage: (context) => const ContactDetailPage(),
        MyRoutes.home: (context) => Builder(
              builder: (context) {
                return Scaffold(
                  appBar: AppBar(
                    // flexibleSpace: Container(
                    //   decoration: const BoxDecoration(
                    //     image: DecorationImage(
                    //       image: NetworkImage(
                    //           "https://cdn.dribbble.com/users/941326/screenshots/8977728/media/d8d87cc990182d7dcafbde71fdf1d02b.gif"),
                    //       fit: BoxFit.cover,
                    //       opacity: 0.2,
                    //     ),
                    //     gradient: LinearGradient(
                    //       colors: [
                    //         Colors.indigo,
                    //         Colors.blue,
                    //         Colors.lightBlueAccent,
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    title: const Text("HomePage"),
                    centerTitle: true,
                    actions: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isDark = !isDark;
                          });
                        },
                        icon: Icon(isDark
                            ? Icons.light_mode_outlined
                            : Icons.dark_mode_outlined),
                      ),
                      Transform.scale(
                        scale: 0.8,
                        child: Switch(
                          value: isDark,
                          activeThumbImage: const AssetImage(
                            "assets/images/ON.jpg",
                          ),
                          activeTrackColor: Colors.green.shade200,
                          inactiveThumbImage: const AssetImage(
                            "assets/images/OFF.jpg",
                          ),
                          inactiveTrackColor: Colors.red.shade200,
                          onChanged: (val) {
                            setState(() {
                              isDark = val;
                            });
                          },
                        ),
                      ),
                      // IconButton(
                      //   onPressed: () {
                      //     setState(() {
                      //       isGrid = !isGrid;
                      //     });
                      //   },
                      //   icon: Icon(isGrid ? Icons.list : Icons.grid_on),
                      // ),
                    ],
                  ),
                  body: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Scrollbar(
                      interactive: true,
                      thickness: 10,
                      radius: const Radius.circular(50),
                      child: isGrid
                          ? GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                childAspectRatio: 2 / 3,
                                mainAxisSpacing: 5,
                                crossAxisSpacing: 5,
                              ),
                              itemCount: n,
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
                                            image: NetworkImage(netDemoImages[
                                                index % netDemoImages.length]),
                                            fit: BoxFit.cover,
                                          ),
                                          borderRadius:
                                              const BorderRadius.vertical(
                                            top: Radius.circular(10),
                                          ),
                                          color: Colors
                                              .primaries[index % 18].shade100,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              const BorderRadius.vertical(
                                            bottom: Radius.circular(10),
                                          ),
                                          color: Colors
                                              .primaries[index % 18].shade500,
                                        ),
                                        padding: const EdgeInsets.all(10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Title: ${index + 1}",
                                              style: const TextStyle(
                                                color: Colors.white,
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
                                SliderTheme(
                                  data: SliderThemeData(
                                    thumbShape: myThumbShape,
                                    overlayShape:
                                        SliderComponentShape.noOverlay,
                                  ),
                                  child: Slider(
                                    min: 0,
                                    max: 100,
                                    onChangeStart: (val) {
                                      setState(() {
                                        myThumbShape = null;
                                      });
                                    },
                                    onChangeEnd: (val) {
                                      setState(() {
                                        myThumbShape =
                                            SliderComponentShape.noThumb;
                                      });
                                    },
                                    value: n.toDouble(),
                                    onChanged: (val) {
                                      setState(() {
                                        n = val.toInt();
                                      });
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: ListView.builder(
                                    itemCount: n,
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
                                            onPressed: (val) {},
                                            icon: Icons.edit,
                                            backgroundColor: Colors.blue,
                                          ),
                                        ],
                                      ),
                                      child: ListTile(
                                        leading: CircleAvatar(
                                          backgroundColor: Colors
                                              .primaries[index % 18].shade200,
                                          foregroundImage: NetworkImage(
                                              netDemoImages[index %
                                                  netDemoImages.length]),
                                          child: Text("${index + 1}"),
                                        ),
                                        title: Text("Title: ${index + 1}"),
                                        subtitle: Text(
                                            "This is subtitle of index $index"),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                    ),
                  ),
                  floatingActionButton: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Theme(
                        data: ThemeData(
                          useMaterial3: true,
                          brightness:
                              isDark ? Brightness.dark : Brightness.light,
                          floatingActionButtonTheme:
                              FloatingActionButtonThemeData(),
                        ),
                        child: FloatingActionButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(MyRoutes.addContactPage);
                          },
                          child: const Icon(Icons.person),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      FloatingActionButton(
                        onPressed: () {
                          setState(() {
                            n++;
                          });
                        },
                        child: const Icon(Icons.add),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      FloatingActionButton(
                        onPressed: () {
                          setState(() {
                            if (n > 0) {
                              n--;
                            }
                          });
                        },
                        child: const Icon(Icons.remove),
                      ),
                    ],
                  ),
                );
              },
            ),
      },
    );
  }
}
