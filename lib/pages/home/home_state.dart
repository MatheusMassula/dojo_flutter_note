part of 'home_cubit.dart';

class HomeState extends Equatable {
  final List<Note> notes;

  const HomeState({this.notes = const []});

  @override
  List<Object> get props => [notes];

  HomeState copyWith({List<Note>? notes}) => HomeState(
        notes: notes ?? this.notes,
      );
}
