import 'package:dojo_flutter_note/data_source/note/note_local_data_source.dart';
import 'package:dojo_flutter_note/pages/home/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  final NoteLocalDataSource noteLocalDataSource;
  final VoidCallback onAddNote;
  final VoidCallback onTapNote;

  const Home({
    super.key,
    required this.noteLocalDataSource,
    required this.onAddNote,
    required this.onTapNote,
  });

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => HomeCubit(noteLocalDataSource),
        child: const _HomeView(),
      );
}

class _HomeView extends StatelessWidget {
  const _HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<HomeCubit>().addNote(),
        child: const Icon(Icons.add),
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state.notes.isEmpty) {
            return const Center(
              child: Text('No notes'),
            );
          }

          return ListView.builder(
            itemCount: state.notes.length,
            itemBuilder: (context, index) {
              final note = state.notes[index];
              return ListTile(
                title: Text(note.title),
                subtitle: Text(note.description),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () =>
                      context.read<HomeCubit>().deleteById(note.id),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
