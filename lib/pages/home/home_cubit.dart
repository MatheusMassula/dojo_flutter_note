import 'package:dojo_flutter_note/models/note.dart';
import 'package:dojo_flutter_note/data_source/note/note_local_data_source.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final NoteLocalDataSource _noteLocalDataSource;

  HomeCubit(NoteLocalDataSource noteLocalDataSource)
      : _noteLocalDataSource = noteLocalDataSource,
        super(const HomeState()) {
    getAllNotes();
  }

  void getAllNotes() {
    final notes = _noteLocalDataSource.getAll;
    emit(state.copyWith(notes: notes));
  }

  void deleteById(int id) {
    _noteLocalDataSource.deleteById(id);
    getAllNotes();
  }
}
