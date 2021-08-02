// flutter packages
import 'package:flutter/material.dart';
import 'package:my_college_app/helpers/notes_database_helper.dart';

// dependencies
import 'package:provider/provider.dart';

// App packages
import 'notes/note_display.dart';
import '/models/notes_entry.dart';
import '../providers/data_provider.dart';
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
  bool _isFolded = true;
  List<Note> _searchedList = [];

  void getData() async {
    // this gives calls the data and updates the data.(listen:true because it calls for data and also updates.).
    await Provider.of<DataProvider>(context).refreshNotes();
    // this updates the list with that data.(listen:false, as this doesn't do the updation instead just gives the data from the notes list of provider class.).
    this._notes = Provider.of<DataProvider>(context, listen: false).notes;
  }

  void search(String text) {
    _searchedList = _notes
        .where((element) =>
            element.title.contains(text) || element.desc.contains(text))
        .toList();
    setState(() {});
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
              body: Column(
                children: [
                  AnimatedContainer(
                    width: _isFolded
                        ? mediaQuerySize.width * 0.17
                        : mediaQuerySize.width * 0.75,
                    height: mediaQuerySize.height * 0.07,
                    duration: const Duration(milliseconds: 400),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: size * 0.02),
                            child: (_isFolded)
                                ? null
                                : TextField(
                                    decoration: InputDecoration(
                                      hintText: 'Search',
                                    ),
                                    onChanged: search,
                                  ),
                          ),
                        ),
                        Container(
                          child: Material(
                            type: MaterialType.transparency,
                            child: InkWell(
                              // borderRadius: BorderRadius.only(
                              //   topRight: Radius.circular(30),
                              //   bottomRight: Radius.circular(30),
                              // ),
                              borderRadius: BorderRadius.circular(30),
                              child: Padding(
                                padding: EdgeInsets.all(size * 0.014),
                                child: _isFolded
                                    ? Icon(
                                        Icons.search,
                                        size: size * 0.025,
                                      )
                                    : Icon(Icons.close),
                              ),
                              onTap: () {
                                setState(() {
                                  _isFolded = !_isFolded;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: OneSideCurveContainer(
                      paddingMultiplier: 0.04,
                      // color: Colors.transparent,
                      // height: mediaQuerySize.height * 0.77,
                      size: size,
                      mediaquery: mediaQuerySize,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 55,
                          left: 35,
                          right: 25,
                        ),
                        child: ListView.builder(
                          itemCount:
                              _isFolded ? _notes.length : _searchedList.length,
                          itemBuilder: (ctx, index) => Dismissible(
                            background: Container(
                              color: Colors.red,
                              child: Icon(
                                Icons.delete,
                                color: Colors.white,
                              ),
                            ),
                            // key: UniqueKey(),
                            key: Key(_notes[index].id.toString()),
                            onDismissed: (DismissDirection direction) {
                              // setState(() {
                              NotesDatabase.instance.delete(_notes[index].id);
                              // });
                              showSnackbar('The note is deleted successfully');
                            },
                            child: displayNote(
                              note: _isFolded
                                  ? _notes[index]
                                  : _searchedList[index],
                              mediaQuerySize: mediaQuerySize,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
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

  void showSnackbar(String title) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '$title',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 6,
      ),
    );
  }
}
