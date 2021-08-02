import 'package:flutter/material.dart';

final String tableNotes = 'notes';

class NoteFields {
  static final List<String> values = [
    // Add all the columns/fields
    id, title, desc, dateTime
    // , tag
  ];

  static final String id =
      "_id"; // it is kinda mandatory to add '_' to id in sqlflite
  static final String title = 'title';
  static final String desc = 'desc';
  static final String dateTime = 'dateTime';
  // static final String tag = 'tag';
}

class Note with ChangeNotifier {
  int id;
  String title;
  String desc;
  DateTime dateTime;
  // String tag = 'general';

  Note({
    this.id,
    this.title,
    this.desc,
    this.dateTime,
    // this.tag,
  });

  Map<String, Object> toJson() => {
        NoteFields.id: id,
        NoteFields.title: title,
        NoteFields.desc: desc,
        NoteFields.dateTime: dateTime.toIso8601String(),
        // NoteFields.tag: tag,
      };

  static Note fromJson(Map<String, Object> json) => Note(
        id: json[NoteFields.id] as int,
        title: json[NoteFields.title] as String,
        desc: json[NoteFields.desc] as String,
        dateTime: DateTime.parse(json[NoteFields.dateTime]), // as DateTime,
        // tag: json[NoteFields.tag] as String,
      );

  Note copy({
    int id,
    String title,
    String desc,
    DateTime dateTime,
    // String tag,
  }) =>
      Note(
        id: id ?? this.id,
        title: title ?? this.title,
        desc: desc ?? this.desc,
        dateTime: dateTime ?? this.dateTime,
        // tag: tag ?? this.tag,
      );
}
