import 'package:flutter/material.dart';
import 'package:my_college_app/screens/notes/note_display.dart';

import 'package:provider/provider.dart';

import '/models/notes_entry.dart';
import '/providers/mode_preferences_provider.dart';
import '../resuable_ui/oneside_curve_container.dart';
import '../resuable_ui/reusable_container.dart';
import '../resuable_ui/landscape_screen.dart';
import '../screens/notes/notes_edit_screen.dart';

class NotesScreen extends StatefulWidget {
  static const routeName = 'notes-screen';

  @override
  _NotesScreenState createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  List<Note> _notes = [];

  void getData() async {
    // this gives calls the data and updates the data.(listen:true because it calls for data and also updates.)
    await Provider.of<ModePreferencesProvider>(context).refreshNotes();
    // this updates the list with that data.(listen:false, as this doesn't do the updation instead just gives the data from the notes list of provider class)
    this._notes =
        Provider.of<ModePreferencesProvider>(context, listen: false).notes;
  }

  @override
  Widget build(BuildContext context) {
    getData();
    // print(_notes);
    Size mediaQuerySize = MediaQuery.of(context).size;
    var size = (mediaQuerySize.width + mediaQuerySize.height);
    return ReusableContainerDark(
      child: MediaQuery.of(context).orientation == Orientation.landscape
          ? LandscapeScreen()
          : Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                elevation: 0.0,
                centerTitle: true,
                backgroundColor: Colors.transparent,
                title: Text(
                  'Notes',
                  style: TextStyle(
                    fontSize: size * 0.025,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              floatingActionButton: FloatingActionButton(
                backgroundColor: Colors.black,
                onPressed: () => Navigator.of(context).pushNamed(
                  NotesEditScreen.routeName,
                ),
                child: Icon(Icons.add),
              ),
              body: Container(
                child: OneSideCurveContainer(
                  // color: Colors.transparent,
                  size: size,
                  mediaquery: mediaQuerySize,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 55,
                      left: 35,
                      right: 25,
                    ),
                    child: ListView.builder(
                      itemCount: _notes.length,
                      itemBuilder: (ctx, index) => displayNote(
                        note: _notes[index],
                        mediaQuerySize: mediaQuerySize,
                      ),
                    ),
                  ),
                ),
              ),
            ),
    );
  }

  Widget displayNote({
    Note note,
    mediaQuerySize,
  }) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(
        NoteDisplay.routeName,
        arguments: note,
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Container(
          height: mediaQuerySize.height * 0.1,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey[300],
          ),
          child: ListTile(
            title: Text(
              note.title,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(
              note.desc,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: Text(note.dateTime.toString().substring(0, 16)),
          ),
        ),
      ),
    );
  }
}
