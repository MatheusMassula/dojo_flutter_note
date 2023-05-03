// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again:
// With a Flutter package, run `flutter pub run build_runner build`.
// With a Dart package, run `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types, depend_on_referenced_packages
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'models/note.dart';
import 'models/tag.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(1, 8669279765157804800),
      name: 'Note',
      lastPropertyId: const IdUid(3, 534677656247463099),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 3655924097646967440),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 220547640088059444),
            name: 'title',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 534677656247463099),
            name: 'description',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[
        ModelRelation(
            id: const IdUid(1, 4451028041528826301),
            name: 'tags',
            targetId: const IdUid(2, 2324486732471459758))
      ],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(2, 2324486732471459758),
      name: 'Tag',
      lastPropertyId: const IdUid(2, 7481645307194146181),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 924200590621699307),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 7481645307194146181),
            name: 'name',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[])
];

/// Open an ObjectBox store with the model declared in this file.
Future<Store> openStore(
        {String? directory,
        int? maxDBSizeInKB,
        int? fileMode,
        int? maxReaders,
        bool queriesCaseSensitiveDefault = true,
        String? macosApplicationGroup}) async =>
    Store(getObjectBoxModel(),
        directory: directory ?? (await defaultStoreDirectory()).path,
        maxDBSizeInKB: maxDBSizeInKB,
        fileMode: fileMode,
        maxReaders: maxReaders,
        queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
        macosApplicationGroup: macosApplicationGroup);

/// ObjectBox model definition, pass it to [Store] - Store(getObjectBoxModel())
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(2, 2324486732471459758),
      lastIndexId: const IdUid(0, 0),
      lastRelationId: const IdUid(1, 4451028041528826301),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    Note: EntityDefinition<Note>(
        model: _entities[0],
        toOneRelations: (Note object) => [],
        toManyRelations: (Note object) =>
            {RelInfo<Note>.toMany(1, object.id): object.tags},
        getId: (Note object) => object.id,
        setId: (Note object, int id) {
          object.id = id;
        },
        objectToFB: (Note object, fb.Builder fbb) {
          final titleOffset = fbb.writeString(object.title);
          final descriptionOffset = fbb.writeString(object.description);
          fbb.startTable(4);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, titleOffset);
          fbb.addOffset(2, descriptionOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = Note(
              id: const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0),
              title: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 6, ''),
              description: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 8, ''));
          InternalToManyAccess.setRelInfo<Note>(
              object.tags, store, RelInfo<Note>.toMany(1, object.id));
          return object;
        }),
    Tag: EntityDefinition<Tag>(
        model: _entities[1],
        toOneRelations: (Tag object) => [],
        toManyRelations: (Tag object) => {},
        getId: (Tag object) => object.id,
        setId: (Tag object, int id) {
          object.id = id;
        },
        objectToFB: (Tag object, fb.Builder fbb) {
          final nameOffset = fbb.writeString(object.name);
          fbb.startTable(3);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, nameOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = Tag(
              id: const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0),
              name: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 6, ''));

          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [Note] entity fields to define ObjectBox queries.
class Note_ {
  /// see [Note.id]
  static final id = QueryIntegerProperty<Note>(_entities[0].properties[0]);

  /// see [Note.title]
  static final title = QueryStringProperty<Note>(_entities[0].properties[1]);

  /// see [Note.description]
  static final description =
      QueryStringProperty<Note>(_entities[0].properties[2]);

  /// see [Note.tags]
  static final tags = QueryRelationToMany<Note, Tag>(_entities[0].relations[0]);
}

/// [Tag] entity fields to define ObjectBox queries.
class Tag_ {
  /// see [Tag.id]
  static final id = QueryIntegerProperty<Tag>(_entities[1].properties[0]);

  /// see [Tag.name]
  static final name = QueryStringProperty<Tag>(_entities[1].properties[1]);
}