import 'package:dojo_flutter_note/main.dart';
import 'package:dojo_flutter_note/models/note.dart';

class NoteDao {
  final _noteBox = store.box<Note>();

  List<Note> get getAll => _noteBox.getAll();

  int addNote(Note note) => _noteBox.put(note);

  bool deleteById(int id) => _noteBox.remove(id);
}
