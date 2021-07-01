import 'package:flutter/material.dart';

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
  bool isEditing = false;
  bool isLoading = false;

  void _onSubmit() async {
    if (_titleController == null) return;
    setState(() {
      isLoading = true;
    });
    Note note = Note(
      title: _titleController.text,
      desc: _descController.text,
      dateTime: DateTime.now(),
      // tag: 'general',
    );

    await NotesDatabase.instance.create(note);
    setState(() {
      _titleController.clear();
      _descController.clear();
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // var sumOfSizes = size.width + size.height;
    return Container(
      color: Colors.blueGrey[200],
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          // backgroundColor: Colors.transparent,
          title: Text('Notes'),
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
              Padding(
                padding: EdgeInsets.all(15),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blueGrey[100],
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: Offset(0, 1),
                        color: Colors.black54,
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
                        border: InputBorder.none,
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
                    color: Colors.blueGrey[100],
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: Offset(0, 1),
                        color: Colors.black54,
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
                        border: InputBorder.none,
                      ),
                      expands: true,
                      maxLines: null,
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
