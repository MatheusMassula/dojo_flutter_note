import 'package:dojo_flutter_note/main.dart';
import 'package:dojo_flutter_note/models/note.dart';
import 'package:objectbox/objectbox.dart';

class NoteDao {
  final _noteBox = store.box<Note>();

  List<Note> get getAll => []; //TODO 

  int upsertNote(Note note) {
    final isNewNote = note.id == 0;
    if (isNewNote) {
      return _noteBox.put(note);
    }
    int id = -1;
    store.runInTransaction(
      TxMode.write,
      () {
        final oldNote = _noteBox.get(note.id);
        if (oldNote != null) {
          _noteBox.remove(note.id);
          id = _noteBox.put(note);
        }
      },
    );
    return id;
  }

  bool deleteById(int id) => _noteBox.remove(id);
}
