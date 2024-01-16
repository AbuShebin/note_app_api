import 'package:flutter/material.dart';
import 'package:note_app_api/data/data.dart';
import 'package:note_app_api/data/note_model/note_model.dart';

enum ActionType {
  addNote,
  editNote,
}

class AddNoteScreen extends StatelessWidget {
  final ActionType type;
  String? id;
  final _titleController=TextEditingController();
  final _contentController=TextEditingController();

  NoteDb noteDb=NoteDb();

  AddNoteScreen({required this.type, this.id});

  Future saveNote()async{
    final title=_titleController.text;
    final content=_contentController.text;

   final _newNote= NoteModel.create(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
     title: title,
      content: content
    );

    print("${_newNote} from add Note Page");

  noteDb.createNote(_newNote);
  }

  Widget get saveButton => TextButton.icon(
        onPressed: () {
          switch (type) {
            case ActionType.addNote:
              //add note
              saveNote();
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
                controller: _titleController,
                decoration: InputDecoration(
                    hintText: 'title',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                controller: _contentController,
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
