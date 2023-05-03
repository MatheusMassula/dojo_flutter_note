// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class Tag {
  @Id()
  int id = 0;

  final String name;

  Tag({
    this.id = 0,
    required this.name,
  });

  Tag copyWith({
    int? id,
    String? name,
  }) {
    return Tag(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory Tag.fromMap(Map<String, dynamic> map) {
    return Tag(
      id: map['id'] as int,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Tag.fromJson(String source) =>
      Tag.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Tag(id: $id, name: $name)';

  @override
  bool operator ==(covariant Tag other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}

class TagRelationToManyConverter
    implements JsonConverter<ToMany<Tag>, List<dynamic>?> {
  
  const TagRelationToManyConverter();

  @override
  ToMany<Tag> fromJson(List? json) =>
      ToMany<Tag>(items: json?.map((e) => Tag.fromJson(e)).toList() ?? []);

  @override
  List? toJson(ToMany<Tag> object) => object.map((e) => e.toJson()).toList();
}
