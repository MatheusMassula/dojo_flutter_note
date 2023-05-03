import 'package:dojo_flutter_note/models/tag.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class Note {
  @Id()
  int id = 0;
  
  final String title;
  final String description;

  @TagRelationToManyConverter()
  final ToMany<Tag> tags = ToMany<Tag>(items: null);

  Note({
    this.id = 0,
    required this.title,
    required this.description,
  });
}
