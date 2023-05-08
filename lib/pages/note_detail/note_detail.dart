import 'package:dojo_flutter_note/data_source/note/note_local_data_source.dart';
import 'package:dojo_flutter_note/models/note.dart';
import 'package:dojo_flutter_note/models/tag.dart';
import 'package:dojo_flutter_note/pages/note_detail/note_detail_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:objectbox/objectbox.dart';

class NoteDetail extends StatelessWidget {
  final NoteLocalDataSource noteLocalDataSource;
  final Note? note;

  const NoteDetail({
    super.key,
    required this.noteLocalDataSource,
    this.note,
  });

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => NoteDetailCubit(noteLocalDataSource),
        child: _NoteDetailsView(note: note),
      );
}

class _NoteDetailsView extends StatefulWidget {
  final Note? note;

  const _NoteDetailsView({
    super.key,
    required this.note,
  });

  @override
  State<_NoteDetailsView> createState() => _NoteDetailsViewState();
}

class _NoteDetailsViewState extends State<_NoteDetailsView> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final List<Tag> tags = [];

  @override
  void initState() {
    _titleController.text = widget.note?.title ?? '';
    _descriptionController.text = widget.note?.description ?? '';
    tags.addAll(widget.note?.tags ?? []);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<NoteDetailCubit, NoteDetailState>(
      listener: (context, state) {
        if (state is NoteDetailSaved) {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Note Details'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                TextFormField(
                  controller: _titleController,
                  decoration: const InputDecoration(
                    labelText: 'Title',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(
                    labelText: 'Description',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 10,
                ),
                Wrap(
                  children: [
                    for (final tag in tags)
                      Padding(
                        padding: const EdgeInsets.all(4),
                        child: Chip(
                          label: Text(tag.name),
                          onDeleted: () {
                            setState(() {
                              tags.remove(tag);
                            });
                          },
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.all(4),
                      child: ElevatedButton(
                        onPressed: () => _displayTagDialog(null),
                        child: const Text('Add Tag'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('Cancel'),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => context
                            .read<NoteDetailCubit>()
                            .upsertNote(
                              widget.note?.copyWith(
                                    title: _titleController.text,
                                    description: _descriptionController.text,
                                    tags: ToMany(items: tags),
                                  ) ??
                                  Note(
                                    title: _titleController.text,
                                    description: _descriptionController.text,
                                    tags: ToMany(items: tags),
                                  ),
                            ),
                        child: const Text('Save'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _displayTagDialog(String? tag) async {
    final TextEditingController tagController = TextEditingController();
    if (tag != null) {
      tagController.text = tag;
    }

    final newTag = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Tag'),
        content: TextFormField(
          controller: tagController,
          decoration: const InputDecoration(
            labelText: 'Tag',
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(tagController.text),
            child: const Text('Add'),
          ),
        ],
      ),
    );

    if (newTag != null) {
      setState(() {
        if (tag == null) {
          tags.add(Tag(name: newTag));
        } else {
          final oldTag = tags[tags.indexWhere((item) => item.name == tag)];
          tags.remove(oldTag);
          tags.add(oldTag.copyWith(name: newTag));
        }
      });
    }
  }
}
