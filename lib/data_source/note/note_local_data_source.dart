import 'package:dojo_flutter_note/models/note.dart';
import 'package:dojo_flutter_note/data_source/note/note_dao.dart';

class NoteLocalDataSource {
  final NoteDao _noteDao;

  NoteLocalDataSource({required NoteDao noteDao}) : _noteDao = noteDao;

  List<Note> get getAll => _noteDao.getAll;

  int addNote(Note note) => _noteDao.addNote(note);

  bool deleteById(int id) => _noteDao.deleteById(id);

}