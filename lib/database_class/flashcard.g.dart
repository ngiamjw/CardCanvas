// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flashcard.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetFlashcardCollection on Isar {
  IsarCollection<Flashcard> get flashcards => this.collection();
}

const FlashcardSchema = CollectionSchema(
  name: r'Flashcard',
  id: -5712857134961670327,
  properties: {
    r'answer_id': PropertySchema(
      id: 0,
      name: r'answer_id',
      type: IsarType.long,
    ),
    r'question_id': PropertySchema(
      id: 1,
      name: r'question_id',
      type: IsarType.long,
    )
  },
  estimateSize: _flashcardEstimateSize,
  serialize: _flashcardSerialize,
  deserialize: _flashcardDeserialize,
  deserializeProp: _flashcardDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _flashcardGetId,
  getLinks: _flashcardGetLinks,
  attach: _flashcardAttach,
  version: '3.1.0+1',
);

int _flashcardEstimateSize(
  Flashcard object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _flashcardSerialize(
  Flashcard object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.answer_id);
  writer.writeLong(offsets[1], object.question_id);
}

Flashcard _flashcardDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Flashcard();
  object.answer_id = reader.readLong(offsets[0]);
  object.id = id;
  object.question_id = reader.readLong(offsets[1]);
  return object;
}

P _flashcardDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _flashcardGetId(Flashcard object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _flashcardGetLinks(Flashcard object) {
  return [];
}

void _flashcardAttach(IsarCollection<dynamic> col, Id id, Flashcard object) {
  object.id = id;
}

extension FlashcardQueryWhereSort
    on QueryBuilder<Flashcard, Flashcard, QWhere> {
  QueryBuilder<Flashcard, Flashcard, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension FlashcardQueryWhere
    on QueryBuilder<Flashcard, Flashcard, QWhereClause> {
  QueryBuilder<Flashcard, Flashcard, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Flashcard, Flashcard, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Flashcard, Flashcard, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Flashcard, Flashcard, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Flashcard, Flashcard, QAfterWhereClause> idBetween(
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

extension FlashcardQueryFilter
    on QueryBuilder<Flashcard, Flashcard, QFilterCondition> {
  QueryBuilder<Flashcard, Flashcard, QAfterFilterCondition> answer_idEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'answer_id',
        value: value,
      ));
    });
  }

  QueryBuilder<Flashcard, Flashcard, QAfterFilterCondition>
      answer_idGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'answer_id',
        value: value,
      ));
    });
  }

  QueryBuilder<Flashcard, Flashcard, QAfterFilterCondition> answer_idLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'answer_id',
        value: value,
      ));
    });
  }

  QueryBuilder<Flashcard, Flashcard, QAfterFilterCondition> answer_idBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'answer_id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Flashcard, Flashcard, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Flashcard, Flashcard, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Flashcard, Flashcard, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Flashcard, Flashcard, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Flashcard, Flashcard, QAfterFilterCondition> question_idEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'question_id',
        value: value,
      ));
    });
  }

  QueryBuilder<Flashcard, Flashcard, QAfterFilterCondition>
      question_idGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'question_id',
        value: value,
      ));
    });
  }

  QueryBuilder<Flashcard, Flashcard, QAfterFilterCondition> question_idLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'question_id',
        value: value,
      ));
    });
  }

  QueryBuilder<Flashcard, Flashcard, QAfterFilterCondition> question_idBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'question_id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension FlashcardQueryObject
    on QueryBuilder<Flashcard, Flashcard, QFilterCondition> {}

extension FlashcardQueryLinks
    on QueryBuilder<Flashcard, Flashcard, QFilterCondition> {}

extension FlashcardQuerySortBy on QueryBuilder<Flashcard, Flashcard, QSortBy> {
  QueryBuilder<Flashcard, Flashcard, QAfterSortBy> sortByAnswer_id() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'answer_id', Sort.asc);
    });
  }

  QueryBuilder<Flashcard, Flashcard, QAfterSortBy> sortByAnswer_idDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'answer_id', Sort.desc);
    });
  }

  QueryBuilder<Flashcard, Flashcard, QAfterSortBy> sortByQuestion_id() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'question_id', Sort.asc);
    });
  }

  QueryBuilder<Flashcard, Flashcard, QAfterSortBy> sortByQuestion_idDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'question_id', Sort.desc);
    });
  }
}

extension FlashcardQuerySortThenBy
    on QueryBuilder<Flashcard, Flashcard, QSortThenBy> {
  QueryBuilder<Flashcard, Flashcard, QAfterSortBy> thenByAnswer_id() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'answer_id', Sort.asc);
    });
  }

  QueryBuilder<Flashcard, Flashcard, QAfterSortBy> thenByAnswer_idDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'answer_id', Sort.desc);
    });
  }

  QueryBuilder<Flashcard, Flashcard, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Flashcard, Flashcard, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Flashcard, Flashcard, QAfterSortBy> thenByQuestion_id() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'question_id', Sort.asc);
    });
  }

  QueryBuilder<Flashcard, Flashcard, QAfterSortBy> thenByQuestion_idDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'question_id', Sort.desc);
    });
  }
}

extension FlashcardQueryWhereDistinct
    on QueryBuilder<Flashcard, Flashcard, QDistinct> {
  QueryBuilder<Flashcard, Flashcard, QDistinct> distinctByAnswer_id() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'answer_id');
    });
  }

  QueryBuilder<Flashcard, Flashcard, QDistinct> distinctByQuestion_id() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'question_id');
    });
  }
}

extension FlashcardQueryProperty
    on QueryBuilder<Flashcard, Flashcard, QQueryProperty> {
  QueryBuilder<Flashcard, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Flashcard, int, QQueryOperations> answer_idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'answer_id');
    });
  }

  QueryBuilder<Flashcard, int, QQueryOperations> question_idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'question_id');
    });
  }
}
