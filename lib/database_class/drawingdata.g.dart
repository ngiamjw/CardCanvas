// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drawingdata.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetDrawingDataCollection on Isar {
  IsarCollection<DrawingData> get drawingDatas => this.collection();
}

const DrawingDataSchema = CollectionSchema(
  name: r'DrawingData',
  id: 3065286426004862457,
  properties: {
    r'drawn_flashcard': PropertySchema(
      id: 0,
      name: r'drawn_flashcard',
      type: IsarType.objectList,
      target: r'DrawingPoint',
    )
  },
  estimateSize: _drawingDataEstimateSize,
  serialize: _drawingDataSerialize,
  deserialize: _drawingDataDeserialize,
  deserializeProp: _drawingDataDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {r'DrawingPoint': DrawingPointSchema},
  getId: _drawingDataGetId,
  getLinks: _drawingDataGetLinks,
  attach: _drawingDataAttach,
  version: '3.1.0+1',
);

int _drawingDataEstimateSize(
  DrawingData object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.drawn_flashcard.length * 3;
  {
    final offsets = allOffsets[DrawingPoint]!;
    for (var i = 0; i < object.drawn_flashcard.length; i++) {
      final value = object.drawn_flashcard[i];
      bytesCount += DrawingPointSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  return bytesCount;
}

void _drawingDataSerialize(
  DrawingData object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObjectList<DrawingPoint>(
    offsets[0],
    allOffsets,
    DrawingPointSchema.serialize,
    object.drawn_flashcard,
  );
}

DrawingData _drawingDataDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DrawingData();
  object.drawn_flashcard = reader.readObjectList<DrawingPoint>(
        offsets[0],
        DrawingPointSchema.deserialize,
        allOffsets,
        DrawingPoint(),
      ) ??
      [];
  object.id = id;
  return object;
}

P _drawingDataDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectList<DrawingPoint>(
            offset,
            DrawingPointSchema.deserialize,
            allOffsets,
            DrawingPoint(),
          ) ??
          []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _drawingDataGetId(DrawingData object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _drawingDataGetLinks(DrawingData object) {
  return [];
}

void _drawingDataAttach(
    IsarCollection<dynamic> col, Id id, DrawingData object) {
  object.id = id;
}

extension DrawingDataQueryWhereSort
    on QueryBuilder<DrawingData, DrawingData, QWhere> {
  QueryBuilder<DrawingData, DrawingData, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension DrawingDataQueryWhere
    on QueryBuilder<DrawingData, DrawingData, QWhereClause> {
  QueryBuilder<DrawingData, DrawingData, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<DrawingData, DrawingData, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<DrawingData, DrawingData, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<DrawingData, DrawingData, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<DrawingData, DrawingData, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension DrawingDataQueryFilter
    on QueryBuilder<DrawingData, DrawingData, QFilterCondition> {
  QueryBuilder<DrawingData, DrawingData, QAfterFilterCondition>
      drawn_flashcardLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'drawn_flashcard',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<DrawingData, DrawingData, QAfterFilterCondition>
      drawn_flashcardIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'drawn_flashcard',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<DrawingData, DrawingData, QAfterFilterCondition>
      drawn_flashcardIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'drawn_flashcard',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DrawingData, DrawingData, QAfterFilterCondition>
      drawn_flashcardLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'drawn_flashcard',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<DrawingData, DrawingData, QAfterFilterCondition>
      drawn_flashcardLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'drawn_flashcard',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DrawingData, DrawingData, QAfterFilterCondition>
      drawn_flashcardLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'drawn_flashcard',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<DrawingData, DrawingData, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DrawingData, DrawingData, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DrawingData, DrawingData, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DrawingData, DrawingData, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension DrawingDataQueryObject
    on QueryBuilder<DrawingData, DrawingData, QFilterCondition> {
  QueryBuilder<DrawingData, DrawingData, QAfterFilterCondition>
      drawn_flashcardElement(FilterQuery<DrawingPoint> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'drawn_flashcard');
    });
  }
}

extension DrawingDataQueryLinks
    on QueryBuilder<DrawingData, DrawingData, QFilterCondition> {}

extension DrawingDataQuerySortBy
    on QueryBuilder<DrawingData, DrawingData, QSortBy> {}

extension DrawingDataQuerySortThenBy
    on QueryBuilder<DrawingData, DrawingData, QSortThenBy> {
  QueryBuilder<DrawingData, DrawingData, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<DrawingData, DrawingData, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension DrawingDataQueryWhereDistinct
    on QueryBuilder<DrawingData, DrawingData, QDistinct> {}

extension DrawingDataQueryProperty
    on QueryBuilder<DrawingData, DrawingData, QQueryProperty> {
  QueryBuilder<DrawingData, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<DrawingData, List<DrawingPoint>, QQueryOperations>
      drawn_flashcardProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'drawn_flashcard');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const DrawingPointSchema = Schema(
  name: r'DrawingPoint',
  id: -4643661256797113870,
  properties: {
    r'color': PropertySchema(
      id: 0,
      name: r'color',
      type: IsarType.long,
    ),
    r'width': PropertySchema(
      id: 1,
      name: r'width',
      type: IsarType.double,
    ),
    r'x': PropertySchema(
      id: 2,
      name: r'x',
      type: IsarType.doubleList,
    ),
    r'y': PropertySchema(
      id: 3,
      name: r'y',
      type: IsarType.doubleList,
    )
  },
  estimateSize: _drawingPointEstimateSize,
  serialize: _drawingPointSerialize,
  deserialize: _drawingPointDeserialize,
  deserializeProp: _drawingPointDeserializeProp,
);

int _drawingPointEstimateSize(
  DrawingPoint object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.x.length * 8;
  bytesCount += 3 + object.y.length * 8;
  return bytesCount;
}

void _drawingPointSerialize(
  DrawingPoint object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.color);
  writer.writeDouble(offsets[1], object.width);
  writer.writeDoubleList(offsets[2], object.x);
  writer.writeDoubleList(offsets[3], object.y);
}

DrawingPoint _drawingPointDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DrawingPoint();
  object.color = reader.readLong(offsets[0]);
  object.width = reader.readDouble(offsets[1]);
  object.x = reader.readDoubleList(offsets[2]) ?? [];
  object.y = reader.readDoubleList(offsets[3]) ?? [];
  return object;
}

P _drawingPointDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readDouble(offset)) as P;
    case 2:
      return (reader.readDoubleList(offset) ?? []) as P;
    case 3:
      return (reader.readDoubleList(offset) ?? []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension DrawingPointQueryFilter
    on QueryBuilder<DrawingPoint, DrawingPoint, QFilterCondition> {
  QueryBuilder<DrawingPoint, DrawingPoint, QAfterFilterCondition> colorEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'color',
        value: value,
      ));
    });
  }

  QueryBuilder<DrawingPoint, DrawingPoint, QAfterFilterCondition>
      colorGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'color',
        value: value,
      ));
    });
  }

  QueryBuilder<DrawingPoint, DrawingPoint, QAfterFilterCondition> colorLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'color',
        value: value,
      ));
    });
  }

  QueryBuilder<DrawingPoint, DrawingPoint, QAfterFilterCondition> colorBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'color',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DrawingPoint, DrawingPoint, QAfterFilterCondition> widthEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'width',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DrawingPoint, DrawingPoint, QAfterFilterCondition>
      widthGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'width',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DrawingPoint, DrawingPoint, QAfterFilterCondition> widthLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'width',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DrawingPoint, DrawingPoint, QAfterFilterCondition> widthBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'width',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DrawingPoint, DrawingPoint, QAfterFilterCondition>
      xElementEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'x',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DrawingPoint, DrawingPoint, QAfterFilterCondition>
      xElementGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'x',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DrawingPoint, DrawingPoint, QAfterFilterCondition>
      xElementLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'x',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DrawingPoint, DrawingPoint, QAfterFilterCondition>
      xElementBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'x',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DrawingPoint, DrawingPoint, QAfterFilterCondition>
      xLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'x',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<DrawingPoint, DrawingPoint, QAfterFilterCondition> xIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'x',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<DrawingPoint, DrawingPoint, QAfterFilterCondition>
      xIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'x',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DrawingPoint, DrawingPoint, QAfterFilterCondition>
      xLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'x',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<DrawingPoint, DrawingPoint, QAfterFilterCondition>
      xLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'x',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DrawingPoint, DrawingPoint, QAfterFilterCondition>
      xLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'x',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<DrawingPoint, DrawingPoint, QAfterFilterCondition>
      yElementEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'y',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DrawingPoint, DrawingPoint, QAfterFilterCondition>
      yElementGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'y',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DrawingPoint, DrawingPoint, QAfterFilterCondition>
      yElementLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'y',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DrawingPoint, DrawingPoint, QAfterFilterCondition>
      yElementBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'y',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DrawingPoint, DrawingPoint, QAfterFilterCondition>
      yLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'y',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<DrawingPoint, DrawingPoint, QAfterFilterCondition> yIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'y',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<DrawingPoint, DrawingPoint, QAfterFilterCondition>
      yIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'y',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DrawingPoint, DrawingPoint, QAfterFilterCondition>
      yLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'y',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<DrawingPoint, DrawingPoint, QAfterFilterCondition>
      yLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'y',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DrawingPoint, DrawingPoint, QAfterFilterCondition>
      yLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'y',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension DrawingPointQueryObject
    on QueryBuilder<DrawingPoint, DrawingPoint, QFilterCondition> {}
