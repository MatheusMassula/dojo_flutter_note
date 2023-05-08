// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:objectbox/objectbox.dart';

import 'package:dojo_flutter_note/models/tag.dart';

@Entity()
class Note {
  @Id()
  int id = 0;

  final String title;
  final String description;

  @TagRelationToManyConverter()
  final ToMany<Tag> tags;

  Note({
    this.id = 0,
    required this.title,
    required this.description,
    required this.tags,
  });

  Note copyWith({
    int? id,
    String? title,
    String? description,
    ToMany<Tag>? tags,
  }) {
    return Note(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      tags: tags ?? this.tags,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'tags': const TagRelationToManyConverter().toJson(tags),
    };
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'] as int,
      title: map['title'] as String,
      description: map['description'] as String,
      tags: const TagRelationToManyConverter().fromJson(map['tags'] as List?),
    );
  }

  String toJson() => json.encode(toMap());

  factory Note.fromJson(String source) =>
      Note.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Note(id: $id, title: $title, description: $description)';

  @override
  bool operator ==(covariant Note other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.description == description &&
        other.tags == tags;
  }

  @override
  int get hashCode =>
      id.hashCode ^ title.hashCode ^ description.hashCode ^ tags.hashCode;
}
