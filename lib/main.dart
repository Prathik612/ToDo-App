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
        GetPage(name: '/edit', page: () => const EditList()),
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
      backgroundColor: SetTheme.bodybackground,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                light = !light;
                SetTheme.themeMode(light);
              });
            },
            icon: light
                ? const Icon(Icons.light_mode_outlined)
                : const Icon(Icons.dark_mode_outlined),
            color: SetTheme.topBarForeground,
          ),
        ],
        backgroundColor: SetTheme.topBarBackground,
        foregroundColor: SetTheme.topBarForeground,
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
                  color: SetTheme.bodybackground,
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
                        color: SetTheme.bodyForeground,
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
                                    color: SetTheme.bodyForeground,
                                    fontSize: 23,
                                    decoration: TextDecoration.lineThrough)
                                : TextStyle(
                                    color: SetTheme.bodyForeground,
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
                        color: SetTheme.bodyForeground,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: IconButton(
                        onPressed: () {
                          Get.toNamed('/edit', arguments: [index]);
                        },
                        icon: const Icon(Icons.mode_edit_sharp),
                        color: SetTheme.bodyForeground,
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
        onPressed: () {
          Get.toNamed('/add');
        },
        backgroundColor: SetTheme.topBarBackground,
        child: Icon(Icons.add, color: SetTheme.topBarForeground),
      ),
    );
  }
}
