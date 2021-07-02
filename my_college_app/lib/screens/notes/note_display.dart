import 'package:flutter/material.dart';

import 'notes_edit_screen.dart';
import '/models/notes_entry.dart';
import '/helpers/notes_database_helper.dart';
import '/resuable_ui/reusable_container.dart';

class NoteDisplay extends StatefulWidget {
  static const routeName = 'Note-display';

  @override
  _NoteDisplayState createState() => _NoteDisplayState();
}

class _NoteDisplayState extends State<NoteDisplay> {
  @override
  Widget build(BuildContext context) {
    Note note = ModalRoute.of(context).settings.arguments as Note;
    Size size = MediaQuery.of(context).size;
    var sumOfSizes = size.width + size.height;
    return ReusableContainerDark(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text('Note'),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () => Navigator.of(context).pushNamed(
                NotesEditScreen.routeName,
                arguments: {
                  'Note': note,
                  'isEditing': true,
                },
              ),
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                NotesDatabase.instance.delete(note.id);
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(15),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white24,
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 1),
                        color: Colors.white,
                      ),
                    ],
                  ),
                  width: size.width * 1,
                  height: size.height * 0.12,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      note.title,
                      style: TextStyle(
                        fontSize: sumOfSizes * 0.02,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white24,
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 1),
                        color: Colors.white,
                      ),
                    ],
                  ),
                  width: size.width * 1,
                  height: size.height * 0.75,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      note.desc,
                      style: TextStyle(
                        fontSize: sumOfSizes * 0.018,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
