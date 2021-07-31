import 'package:flutter/material.dart';
import 'package:my_college_app/screens/notes/note_display.dart';

import '/resuable_ui/reusable_container.dart';
import '/helpers/notes_database_helper.dart';
import '/models/notes_entry.dart';

class NotesEditScreen extends StatefulWidget {
  static const routeName = 'notes-edit';
  @override
  _NotesEditScreenState createState() => _NotesEditScreenState();
}

class _NotesEditScreenState extends State<NotesEditScreen> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descController = TextEditingController();
  Note note;
  bool isEditing = false;
  bool isLoading = false;

  void _onSubmit() async {
    var createdNote;
    if (_titleController == null) return;
    setState(() {
      isLoading = true;
    });

    if (isEditing) {
      note.title = _titleController.text;
      note.desc = _descController.text;
      await NotesDatabase.instance.update(note);
      Navigator.of(context).pop();
      // Navigator.of(context).pop();
    } else {
      Note myNote = Note(
        title: _titleController.text,
        desc: _descController.text,
        dateTime: DateTime.now(),
        // tag: 'general',
      );
      createdNote = await NotesDatabase.instance.create(myNote);
      // print('my dummy note : $dummyNote');
    }
    setState(() {
      _titleController.clear();
      _descController.clear();
      isLoading = false;
    });
    Navigator.of(context).pop();
    Navigator.of(context)
        .pushNamed(NoteDisplay.routeName, arguments: createdNote);
  }

  @override
  Widget build(BuildContext context) {
    Map<String, Object> dataArgs =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    if (dataArgs != null) {
      isEditing = dataArgs['isEditing'];
      note = dataArgs['Note'];
    }
    Size size = MediaQuery.of(context).size;
    return ReusableContainerDark(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            '${(isEditing) ? 'Edit' : 'Add'} Note',
          ),
          centerTitle: true,
          // elevation: 0.0,
          actions: [
            if (isLoading)
              Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            if (!isLoading)
              IconButton(
                onPressed: (isLoading) ? null : _onSubmit,
                icon: Icon(Icons.save),
              ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              title(size, note),
              description(size, note),
            ],
          ),
        ),
      ),
    );
  }

  Padding title(Size size, Note note) {
    if (note != null) {
      _titleController.text = note.title;
      print('note.title: ${note.title}');
    }
    return Padding(
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
          child: TextField(
            controller: _titleController,
            maxLength: 80,
            maxLines: 2,
            decoration: InputDecoration(
              hintText: 'Title.....',
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }

  Padding description(Size size, Note note) {
    if (note != null) {
      _descController.text = note.desc;
    }
    return Padding(
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
          child: TextField(
            controller: _descController,
            decoration: InputDecoration(
              hintText: 'Description....',
              border: InputBorder.none,
            ),
            expands: true,
            maxLines: null,
          ),
        ),
      ),
    );
  }
}
