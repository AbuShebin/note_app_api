import 'package:flutter/material.dart';

enum ActionType {
  addNote,
  editNote,
}

class AddNoteScreen extends StatelessWidget {
  final ActionType type;
  String? id;

  AddNoteScreen({required this.type, this.id});

  Widget get saveButton => TextButton.icon(
        onPressed: () {
          switch (type) {
            case ActionType.addNote:
              //add note
              break;
            case ActionType.editNote:
              //edit note
              break;
          }
        },
        icon: Icon(Icons.save),
        label: Text("sabe"),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add note Page"),
          actions: [
            saveButton,
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: 'title',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                maxLines: 7,
                decoration: InputDecoration(
                    // hintMaxLines: 100,
                    hintText: 'content',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
            ),
          ],
        ));
  }
}
