import 'package:dojo_flutter_note/data_source/note/note_dao.dart';
import 'package:dojo_flutter_note/data_source/note/note_local_data_source.dart';
import 'package:dojo_flutter_note/router_manager.dart';
import 'package:flutter/material.dart';

import 'objectbox.g.dart';

late final Store store;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  store = await openStore();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final noteLocalDataSource = NoteLocalDataSource(noteDao: NoteDao());

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      onGenerateRoute: (settings) => RouterManager.generateRoute(
        settings,
        noteLocalDataSource: noteLocalDataSource,
      ),
      initialRoute: PageName.home,
    );
  }
}
