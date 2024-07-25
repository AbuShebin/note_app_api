import 'package:flutter/material.dart';
import 'package:note_app_api/add_note.dart';
import 'package:note_app_api/note.dart';

import 'data/data.dart';
import 'data/note_model/note_model.dart';

class HomeScreen extends StatefulWidget {
   HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // NoteDb noteDb =NoteDb();
   final List<NoteModel>noteList=[];

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      try {
        final _notesList = await NoteDb().getAllNote();
        noteList.clear();
        noteList.addAll(_notesList);
        print(noteList);
      } catch (e) {
        print(e.toString());
      }
    });
    
    return Scaffold(
      appBar: AppBar(
        title: Text('note app'),
      ),
      body: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          print(noteList[0].title);
          print("noteList[0].title=====================");
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return AddNoteScreen(type: ActionType.editNote);
              }));
            },
            child: Note(
              content: noteList[index].content??'content',
              id: noteList[index].id??'id',
              title: noteList[index].title??'title',
            ),
          );
        },
        itemCount: noteList.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return AddNoteScreen(
              type: ActionType.addNote,
            );
          }));
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
