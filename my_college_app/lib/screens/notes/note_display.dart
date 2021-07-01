import 'package:flutter/material.dart';

class NoteDisplay extends StatelessWidget {
  const NoteDisplay({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('note display key : $key');
    return Scaffold(
      appBar: AppBar(
        title: Text('Note'),
      ),
      body: Container(),
    );
  }
}
