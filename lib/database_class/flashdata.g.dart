// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flashdata.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetFlashDataCollection on Isar {
  IsarCollection<FlashData> get flashDatas => this.collection();
}

const FlashDataSchema = CollectionSchema(
  name: r'FlashData',
  id: 8054557579914879405,
  properties: {
    r'drawing_id': PropertySchema(
      id: 0,
      name: r'drawing_id',
      type: IsarType.long,
    ),
    r'str': PropertySchema(
      id: 1,
      name: r'str',
      type: IsarType.string,
    )
  },
  estimateSize: _flashDataEstimateSize,
  serialize: _flashDataSerialize,
  deserialize: _flashDataDeserialize,
  deserializeProp: _flashDataDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _flashDataGetId,
  getLinks: _flashDataGetLinks,
  attach: _flashDataAttach,
  version: '3.1.0+1',
);

int _flashDataEstimateSize(
  FlashData object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.str.length * 3;
  return bytesCount;
}

void _flashDataSerialize(
  FlashData object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.drawing_id);
  writer.writeString(offsets[1], object.str);
}

FlashData _flashDataDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = FlashData();
  object.drawing_id = reader.readLong(offsets[0]);
  object.id = id;
  object.str = reader.readString(offsets[1]);
  return object;
}

P _flashDataDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _flashDataGetId(FlashData object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _flashDataGetLinks(FlashData object) {
  return [];
}

void _flashDataAttach(IsarCollection<dynamic> col, Id id, FlashData object) {
  object.id = id;
}

extension FlashDataQueryWhereSort
    on QueryBuilder<FlashData, FlashData, QWhere> {
  QueryBuilder<FlashData, FlashData, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension FlashDataQueryWhere
    on QueryBuilder<FlashData, FlashData, QWhereClause> {
  QueryBuilder<FlashData, FlashData, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<FlashData, FlashData, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<FlashData, FlashData, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<FlashData, FlashData, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<FlashData, FlashData, QAfterWhereClause> idBetween(
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

extension FlashDataQueryFilter
    on QueryBuilder<FlashData, FlashData, QFilterCondition> {
  QueryBuilder<FlashData, FlashData, QAfterFilterCondition> drawing_idEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'drawing_id',
        value: value,
      ));
    });
  }

  QueryBuilder<FlashData, FlashData, QAfterFilterCondition>
      drawing_idGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'drawing_id',
        value: value,
      ));
    });
  }

  QueryBuilder<FlashData, FlashData, QAfterFilterCondition> drawing_idLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'drawing_id',
        value: value,
      ));
    });
  }

  QueryBuilder<FlashData, FlashData, QAfterFilterCondition> drawing_idBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'drawing_id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FlashData, FlashData, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<FlashData, FlashData, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<FlashData, FlashData, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<FlashData, FlashData, QAfterFilterCondition> idBetween(
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

  QueryBuilder<FlashData, FlashData, QAfterFilterCondition> strEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'str',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FlashData, FlashData, QAfterFilterCondition> strGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'str',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FlashData, FlashData, QAfterFilterCondition> strLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'str',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FlashData, FlashData, QAfterFilterCondition> strBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'str',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FlashData, FlashData, QAfterFilterCondition> strStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'str',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FlashData, FlashData, QAfterFilterCondition> strEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'str',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FlashData, FlashData, QAfterFilterCondition> strContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'str',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FlashData, FlashData, QAfterFilterCondition> strMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'str',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FlashData, FlashData, QAfterFilterCondition> strIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'str',
        value: '',
      ));
    });
  }

  QueryBuilder<FlashData, FlashData, QAfterFilterCondition> strIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'str',
        value: '',
      ));
    });
  }
}

extension FlashDataQueryObject
    on QueryBuilder<FlashData, FlashData, QFilterCondition> {}

extension FlashDataQueryLinks
    on QueryBuilder<FlashData, FlashData, QFilterCondition> {}

extension FlashDataQuerySortBy on QueryBuilder<FlashData, FlashData, QSortBy> {
  QueryBuilder<FlashData, FlashData, QAfterSortBy> sortByDrawing_id() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'drawing_id', Sort.asc);
    });
  }

  QueryBuilder<FlashData, FlashData, QAfterSortBy> sortByDrawing_idDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'drawing_id', Sort.desc);
    });
  }

  QueryBuilder<FlashData, FlashData, QAfterSortBy> sortByStr() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'str', Sort.asc);
    });
  }

  QueryBuilder<FlashData, FlashData, QAfterSortBy> sortByStrDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'str', Sort.desc);
    });
  }
}

extension FlashDataQuerySortThenBy
    on QueryBuilder<FlashData, FlashData, QSortThenBy> {
  QueryBuilder<FlashData, FlashData, QAfterSortBy> thenByDrawing_id() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'drawing_id', Sort.asc);
    });
  }

  QueryBuilder<FlashData, FlashData, QAfterSortBy> thenByDrawing_idDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'drawing_id', Sort.desc);
    });
  }

  QueryBuilder<FlashData, FlashData, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<FlashData, FlashData, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<FlashData, FlashData, QAfterSortBy> thenByStr() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'str', Sort.asc);
    });
  }

  QueryBuilder<FlashData, FlashData, QAfterSortBy> thenByStrDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'str', Sort.desc);
    });
  }
}

extension FlashDataQueryWhereDistinct
    on QueryBuilder<FlashData, FlashData, QDistinct> {
  QueryBuilder<FlashData, FlashData, QDistinct> distinctByDrawing_id() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'drawing_id');
    });
  }

  QueryBuilder<FlashData, FlashData, QDistinct> distinctByStr(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'str', caseSensitive: caseSensitive);
    });
  }
}

extension FlashDataQueryProperty
    on QueryBuilder<FlashData, FlashData, QQueryProperty> {
  QueryBuilder<FlashData, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<FlashData, int, QQueryOperations> drawing_idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'drawing_id');
    });
  }

  QueryBuilder<FlashData, String, QQueryOperations> strProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'str');
    });
  }
}
