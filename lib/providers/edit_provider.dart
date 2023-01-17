/// Class to edit title and note

import 'package:flutter/material.dart';
import 'package:to_do/utils/utils.dart';

class EditList extends StatefulWidget {
  final dynamic indexx;
  const EditList({super.key, required this.indexx});

  @override
  State<EditList> createState() => _EditListState();
}

class _EditListState extends State<EditList> {
  final TextEditingController _textFieldController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _textFieldController.text = todos[widget.indexx];
    _noteController.text = notes[widget.indexx];
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
                    todos[widget.indexx] = temp;
                    temp = _noteController.text.toString();
                    notes[widget.indexx] = temp;
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
