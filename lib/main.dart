import 'package:flutter/material.dart';
import 'package:to_do/providers/providers.dart';
import 'package:to_do/utils/utils.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(useMaterial3: true),
      initialRoute: '/',
      // home: const ToList(),
      getPages: [
        GetPage(name: '/', page: () => const ToList()),
        GetPage(name: '/add', page: () => const AddToList()),
      ],
      debugShowCheckedModeBanner: false,
    );
  }
}

class ToList extends StatefulWidget {
  const ToList({super.key});

  @override
  State<ToList> createState() => _ToListState();
}

class _ToListState extends State<ToList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: light ? Colors.white : Colors.black,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                light = !light;
              });
            },
            icon: light
                ? const Icon(Icons.light_mode_outlined)
                : const Icon(Icons.dark_mode_outlined),
            color: light ? Colors.white : Colors.black,
          ),
        ],
        backgroundColor: light ? Colors.black : Colors.white,
        foregroundColor: light ? Colors.white : Colors.black,
        centerTitle: true,
        title: const Text("TO-DO"),
      ),
      body: SafeArea(
        child: Obx(
          () => ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            itemCount: todos.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                width: 100,
                decoration: BoxDecoration(
                  color: light ? Colors.white : Colors.black,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            isPressed[index] = !isPressed[index];
                          });
                        },
                        icon: isPressed[index]
                            ? const Icon(Icons.check_circle_outline)
                            : const Icon(Icons.circle_outlined),
                        color: light ? Colors.black : Colors.white,
                      ),
                    ),
                    Expanded(
                      flex: 18,
                      child: InkWell(
                        onLongPress: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('${todos[index]}'),
                                  content: SingleChildScrollView(
                                    child: Text(notes[index]),
                                  ),
                                );
                              });
                        },
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '${todos[index]}',
                            style: isPressed[index]
                                ? TextStyle(
                                    color: light ? Colors.black : Colors.white,
                                    fontSize: 23,
                                    decoration: TextDecoration.lineThrough)
                                : TextStyle(
                                    color: light ? Colors.black : Colors.white,
                                    fontSize: 23),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            todos.removeAt(index);
                            notes.removeAt(index);
                            isPressed.removeAt(index);
                          });
                        },
                        icon: const Icon(Icons.delete_outline_sharp),
                        color: light ? Colors.black : Colors.white,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: IconButton(
                        onPressed: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: ((context) => EditList(
                                    indexx: index,
                                  )),
                            ),
                          );
                          setState(() {});
                        },
                        icon: const Icon(Icons.mode_edit_sharp),
                        color: light ? Colors.black : Colors.white,
                      ),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () /*async*/ {
          /*await Navigator.push(
            context,
            MaterialPageRoute(
              builder: ((context) => const AddToList()),
            ),
          );*/
          Get.toNamed('/add');
          //setState(() {});
        },
        backgroundColor: light ? Colors.black : Colors.white,
        child: Icon(Icons.add, color: light ? Colors.white : Colors.black),
      ),
    );
  }
}
