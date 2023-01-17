/// Class to edit title and note

import 'package:flutter/material.dart';
import 'package:to_do/utils/utils.dart';
import 'package:get/get.dart';

class EditList extends StatefulWidget {
  const EditList({super.key});

  @override
  State<EditList> createState() => _EditListState();
}

class _EditListState extends State<EditList> {
  final TextEditingController _textFieldController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  dynamic ind = Get.arguments[0];

  @override
  Widget build(BuildContext context) {
    _textFieldController.text = todos[ind];
    _noteController.text = notes[ind];
    return Scaffold(
      backgroundColor: SetTheme.bodybackground,
      appBar: AppBar(
        leading: BackButton(
          color: SetTheme.topBarForeground,
        ),
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
        centerTitle: true,
        title: const Text('New Task'),
        backgroundColor: SetTheme.topBarBackground,
        foregroundColor: SetTheme.topBarForeground,
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
                      color: SetTheme.bodyForeground,
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
                    backgroundColor: SetTheme.topBarBackground,
                    foregroundColor: SetTheme.topBarForeground,
                  ),
                  onPressed: () {
                    String temp = _textFieldController.text.toString();
                    todos[ind] = temp;
                    temp = _noteController.text.toString();
                    notes[ind] = temp;
                    Get.back();
                    // Navigator.pop(context, 'Done');
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
