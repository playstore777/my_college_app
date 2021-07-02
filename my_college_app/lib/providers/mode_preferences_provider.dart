import 'package:flutter/foundation.dart';

import '/helpers/notes_database_helper.dart';
import '/models/notes_entry.dart';

import 'package:shared_preferences/shared_preferences.dart';

class ModePreferencesProvider with ChangeNotifier {
  List<Note> _notes = [];

  List<Note> get notes {
    return _notes;
  }

  Future refreshNotes() async {
    this._notes = await NotesDatabase.instance.readAllNotes();
    notifyListeners();
    // print('Notes List: ${_notes}');
  }

  ModePreferencesProvider() {
    _loadFromPrefs();
  }
  bool _modePrefs = false;
  SharedPreferences _prefs;
  String key = '_moderPrefs';

  bool get mode {
    return _modePrefs;
  }

  void changeMode() {
    _modePrefs = !_modePrefs;
    notifyListeners();
    _saveToPrefs();
  }

  // _initPref() is to iniliaze  the _pref variable
  _initPrefs() async {
    if (_prefs == null) _prefs = await SharedPreferences.getInstance();
  }

  _loadFromPrefs() async {
    await _initPrefs();
    _modePrefs = _prefs?.getBool(key) ?? false;
    notifyListeners();
  }

  _saveToPrefs() async {
    await _initPrefs();
    _prefs?.setBool(key, _modePrefs);
  }
}
