///Class to add new item to list

import 'package:flutter/material.dart';
import 'package:to_do/utils/data.dart';

class AddToList extends StatefulWidget {
  const AddToList({super.key});

  @override
  State<AddToList> createState() => _AddToListState();
}

class _AddToListState extends State<AddToList> {
  final TextEditingController _textFieldController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: light ? Colors.white : Colors.black,
      appBar: AppBar(
        leading: BackButton(
          color: light ? Colors.white : Colors.black,
        ),
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
        centerTitle: true,
        title: const Text('New Task'),
        backgroundColor: light ? Colors.black : Colors.white,
        foregroundColor: light ? Colors.white : Colors.black,
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _textFieldController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Note:',
                    style: TextStyle(
                      color: light ? Colors.black : Colors.white,
                      fontSize: 16.5,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  controller: _noteController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(150, 40),
                    backgroundColor: light ? Colors.black : Colors.white,
                    foregroundColor: light ? Colors.white : Colors.black,
                  ),
                  onPressed: () {
                    String temp = _textFieldController.text.toString();
                    todos.add(temp);
                    temp = _noteController.text.toString();
                    notes.add(temp);
                    isPressed.add(false);
                    Navigator.pop(context, 'Done');
                  },
                  child: const Text(
                    'Done',
                    textScaleFactor: 1.3,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
