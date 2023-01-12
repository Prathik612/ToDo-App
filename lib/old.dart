/*import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const ToList(),
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
  final TextEditingController _textFieldController = TextEditingController();
  final List<String> todos = <String>[];
  final List<bool> isPressed = <bool>[];
  bool light = false, editMode = false;
  // bool remove = false;

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
        child: ListView.separated(
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
                          barrierDismissible: false, // user must tap button!
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Delete Item'),
                              content: SingleChildScrollView(
                                child: ListBody(
                                  children: const <Widget>[
                                    Text('Would you like delete this item?'),
                                  ],
                                ),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  child: const Text('Cancel'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                TextButton(
                                  child: const Text('Delete'),
                                  onPressed: () {
                                    // remove = true;
                                    setState(() {
                                      todos.removeAt(index);
                                      isPressed.removeAt(index);
                                      Navigator.of(context).pop();
                                    });
                                  },
                                ),
                              ],
                            );
                          },
                        );
                        /*setState(() {
                          _confirmdel(context);
                          if (remove == true) {
                            todos.removeAt(index);
                            isPressed.removeAt(index);
                            remove = false;
                          }
                        });*/
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
                        _textFieldController.text = todos[index];
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: TextField(
                                  onChanged: (value) {},
                                  controller: _textFieldController,
                                ),
                                actions: <Widget>[
                                  TextButton(
                                      onPressed: () {
                                        setState(() {
                                          String temp = _textFieldController
                                              .text
                                              .toString();
                                          todos[index] = temp;
                                          Navigator.pop(context, 'Done');
                                          _textFieldController.clear();
                                        });
                                      },
                                      child: const Text('Done')),
                                ],
                              );
                            });
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _displayTextInputDialog(context);
          });
        },
        backgroundColor: light ? Colors.black : Colors.white,
        child: Icon(Icons.add, color: light ? Colors.white : Colors.black),
      ),
    );
  }

  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('To-Do'),
            content: TextField(
              onChanged: (value) {},
              controller: _textFieldController,
            ),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    setState(() {
                      String temp = _textFieldController.text.toString();
                      todos.add(temp);
                      isPressed.add(false);
                      Navigator.pop(context, 'Done');
                      _textFieldController.clear();
                    });
                  },
                  child: const Text('Done')),
            ],
          );
        });
  }
}*/