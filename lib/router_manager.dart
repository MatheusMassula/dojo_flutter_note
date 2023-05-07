import 'package:dojo_flutter_note/data_source/note/note_local_data_source.dart';
import 'package:dojo_flutter_note/models/note.dart';
import 'package:dojo_flutter_note/pages/home/home.dart';
import 'package:dojo_flutter_note/pages/note_detail/note_detail.dart';
import 'package:flutter/material.dart';

class RouterManager {
  static Route<dynamic> generateRoute(RouteSettings settings,
      {required NoteLocalDataSource noteLocalDataSource}) {
    final args = settings.arguments;

    switch (settings.name) {
      case PageName.home:
        return MaterialPageRoute(
          builder: (context) => Home(
            noteLocalDataSource: noteLocalDataSource,
            onAddNote: () => Navigator.of(context).pushNamed(
              PageName.noteDetail,
            ),
            onTapNote: (note) => Navigator.of(context).pushNamed(
              PageName.noteDetail,
              arguments: note,
            ),
          ),
        );

      case PageName.noteDetail:
        final note = args as Note?;
        return MaterialPageRoute(
          builder: (context) => NoteDetail(
            noteLocalDataSource: noteLocalDataSource,
            note: note,
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(
              title: const Text('The app got lost'),
            ),
          ),
        );
    }
  }
}

class PageName {
  static const String home = 'home';
  static const String noteDetail = 'note-detail';
}
