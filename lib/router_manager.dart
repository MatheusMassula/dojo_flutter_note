import 'package:dojo_flutter_note/data_source/note/note_local_data_source.dart';
import 'package:dojo_flutter_note/pages/home/home.dart';
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
            onAddNote: () {
              // TODO: Navigate to note detail
            },
            onTapNote: () {
              // TODO: Navigate to note detail
            },
          ),
        );

      case PageName.noteDetail:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(
              title: const Text('Note detail'),
            ),
            body: Center(
              child: Text(args.toString()),
            ),
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
