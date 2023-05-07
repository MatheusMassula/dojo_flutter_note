import 'package:dojo_flutter_note/data_source/note/note_local_data_source.dart';
import 'package:dojo_flutter_note/models/note.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'note_detail_state.dart';

class NoteDetailCubit extends Cubit<NoteDetailState> {
  final NoteLocalDataSource noteLocalDataSource;

  NoteDetailCubit(this.noteLocalDataSource) : super(NoteDetailInitial());

  void upsertNote(Note note) {
    noteLocalDataSource.upsertNote(note);
    emit(NoteDetailSaved());
  }
}
