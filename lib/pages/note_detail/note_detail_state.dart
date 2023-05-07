part of 'note_detail_cubit.dart';

abstract class NoteDetailState extends Equatable {
  const NoteDetailState();

  @override
  List<Object> get props => [];
}

class NoteDetailInitial extends NoteDetailState {}

class NoteDetailSaved extends NoteDetailState {}
