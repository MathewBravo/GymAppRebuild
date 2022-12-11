// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ran_workouts.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetRanWorkoutCollection on Isar {
  IsarCollection<RanWorkout> get ranWorkouts => this.collection();
}

const RanWorkoutSchema = CollectionSchema(
  name: r'RanWorkout',
  id: 7606093717582032536,
  properties: {
    r'dateRan': PropertySchema(
      id: 0,
      name: r'dateRan',
      type: IsarType.dateTime,
    ),
    r'includedExercises': PropertySchema(
      id: 1,
      name: r'includedExercises',
      type: IsarType.objectList,
      target: r'IncludedExercises',
    )
  },
  estimateSize: _ranWorkoutEstimateSize,
  serialize: _ranWorkoutSerialize,
  deserialize: _ranWorkoutDeserialize,
  deserializeProp: _ranWorkoutDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {r'IncludedExercises': IncludedExercisesSchema},
  getId: _ranWorkoutGetId,
  getLinks: _ranWorkoutGetLinks,
  attach: _ranWorkoutAttach,
  version: '3.0.5',
);

int _ranWorkoutEstimateSize(
  RanWorkout object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final list = object.includedExercises;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[IncludedExercises]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              IncludedExercisesSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  return bytesCount;
}

void _ranWorkoutSerialize(
  RanWorkout object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.dateRan);
  writer.writeObjectList<IncludedExercises>(
    offsets[1],
    allOffsets,
    IncludedExercisesSchema.serialize,
    object.includedExercises,
  );
}

RanWorkout _ranWorkoutDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = RanWorkout();
  object.dateRan = reader.readDateTimeOrNull(offsets[0]);
  object.id = id;
  object.includedExercises = reader.readObjectList<IncludedExercises>(
    offsets[1],
    IncludedExercisesSchema.deserialize,
    allOffsets,
    IncludedExercises(),
  );
  return object;
}

P _ranWorkoutDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readObjectList<IncludedExercises>(
        offset,
        IncludedExercisesSchema.deserialize,
        allOffsets,
        IncludedExercises(),
      )) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _ranWorkoutGetId(RanWorkout object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _ranWorkoutGetLinks(RanWorkout object) {
  return [];
}

void _ranWorkoutAttach(IsarCollection<dynamic> col, Id id, RanWorkout object) {
  object.id = id;
}

extension RanWorkoutQueryWhereSort
    on QueryBuilder<RanWorkout, RanWorkout, QWhere> {
  QueryBuilder<RanWorkout, RanWorkout, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension RanWorkoutQueryWhere
    on QueryBuilder<RanWorkout, RanWorkout, QWhereClause> {
  QueryBuilder<RanWorkout, RanWorkout, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<RanWorkout, RanWorkout, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<RanWorkout, RanWorkout, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<RanWorkout, RanWorkout, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<RanWorkout, RanWorkout, QAfterWhereClause> idBetween(
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

extension RanWorkoutQueryFilter
    on QueryBuilder<RanWorkout, RanWorkout, QFilterCondition> {
  QueryBuilder<RanWorkout, RanWorkout, QAfterFilterCondition> dateRanIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dateRan',
      ));
    });
  }

  QueryBuilder<RanWorkout, RanWorkout, QAfterFilterCondition>
      dateRanIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dateRan',
      ));
    });
  }

  QueryBuilder<RanWorkout, RanWorkout, QAfterFilterCondition> dateRanEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dateRan',
        value: value,
      ));
    });
  }

  QueryBuilder<RanWorkout, RanWorkout, QAfterFilterCondition>
      dateRanGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dateRan',
        value: value,
      ));
    });
  }

  QueryBuilder<RanWorkout, RanWorkout, QAfterFilterCondition> dateRanLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dateRan',
        value: value,
      ));
    });
  }

  QueryBuilder<RanWorkout, RanWorkout, QAfterFilterCondition> dateRanBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dateRan',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RanWorkout, RanWorkout, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<RanWorkout, RanWorkout, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<RanWorkout, RanWorkout, QAfterFilterCondition> idEqualTo(
      Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<RanWorkout, RanWorkout, QAfterFilterCondition> idGreaterThan(
    Id? value, {
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

  QueryBuilder<RanWorkout, RanWorkout, QAfterFilterCondition> idLessThan(
    Id? value, {
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

  QueryBuilder<RanWorkout, RanWorkout, QAfterFilterCondition> idBetween(
    Id? lower,
    Id? upper, {
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

  QueryBuilder<RanWorkout, RanWorkout, QAfterFilterCondition>
      includedExercisesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'includedExercises',
      ));
    });
  }

  QueryBuilder<RanWorkout, RanWorkout, QAfterFilterCondition>
      includedExercisesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'includedExercises',
      ));
    });
  }

  QueryBuilder<RanWorkout, RanWorkout, QAfterFilterCondition>
      includedExercisesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'includedExercises',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<RanWorkout, RanWorkout, QAfterFilterCondition>
      includedExercisesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'includedExercises',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<RanWorkout, RanWorkout, QAfterFilterCondition>
      includedExercisesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'includedExercises',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<RanWorkout, RanWorkout, QAfterFilterCondition>
      includedExercisesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'includedExercises',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<RanWorkout, RanWorkout, QAfterFilterCondition>
      includedExercisesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'includedExercises',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<RanWorkout, RanWorkout, QAfterFilterCondition>
      includedExercisesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'includedExercises',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension RanWorkoutQueryObject
    on QueryBuilder<RanWorkout, RanWorkout, QFilterCondition> {
  QueryBuilder<RanWorkout, RanWorkout, QAfterFilterCondition>
      includedExercisesElement(FilterQuery<IncludedExercises> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'includedExercises');
    });
  }
}

extension RanWorkoutQueryLinks
    on QueryBuilder<RanWorkout, RanWorkout, QFilterCondition> {}

extension RanWorkoutQuerySortBy
    on QueryBuilder<RanWorkout, RanWorkout, QSortBy> {
  QueryBuilder<RanWorkout, RanWorkout, QAfterSortBy> sortByDateRan() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateRan', Sort.asc);
    });
  }

  QueryBuilder<RanWorkout, RanWorkout, QAfterSortBy> sortByDateRanDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateRan', Sort.desc);
    });
  }
}

extension RanWorkoutQuerySortThenBy
    on QueryBuilder<RanWorkout, RanWorkout, QSortThenBy> {
  QueryBuilder<RanWorkout, RanWorkout, QAfterSortBy> thenByDateRan() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateRan', Sort.asc);
    });
  }

  QueryBuilder<RanWorkout, RanWorkout, QAfterSortBy> thenByDateRanDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateRan', Sort.desc);
    });
  }

  QueryBuilder<RanWorkout, RanWorkout, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<RanWorkout, RanWorkout, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension RanWorkoutQueryWhereDistinct
    on QueryBuilder<RanWorkout, RanWorkout, QDistinct> {
  QueryBuilder<RanWorkout, RanWorkout, QDistinct> distinctByDateRan() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dateRan');
    });
  }
}

extension RanWorkoutQueryProperty
    on QueryBuilder<RanWorkout, RanWorkout, QQueryProperty> {
  QueryBuilder<RanWorkout, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<RanWorkout, DateTime?, QQueryOperations> dateRanProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dateRan');
    });
  }

  QueryBuilder<RanWorkout, List<IncludedExercises>?, QQueryOperations>
      includedExercisesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'includedExercises');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

const IncludedExercisesSchema = Schema(
  name: r'IncludedExercises',
  id: 3988083316308857346,
  properties: {
    r'exerciseName': PropertySchema(
      id: 0,
      name: r'exerciseName',
      type: IsarType.string,
    ),
    r'reps': PropertySchema(
      id: 1,
      name: r'reps',
      type: IsarType.longList,
    ),
    r'setCount': PropertySchema(
      id: 2,
      name: r'setCount',
      type: IsarType.long,
    ),
    r'weight': PropertySchema(
      id: 3,
      name: r'weight',
      type: IsarType.doubleList,
    )
  },
  estimateSize: _includedExercisesEstimateSize,
  serialize: _includedExercisesSerialize,
  deserialize: _includedExercisesDeserialize,
  deserializeProp: _includedExercisesDeserializeProp,
);

int _includedExercisesEstimateSize(
  IncludedExercises object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.exerciseName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.reps;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  {
    final value = object.weight;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  return bytesCount;
}

void _includedExercisesSerialize(
  IncludedExercises object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.exerciseName);
  writer.writeLongList(offsets[1], object.reps);
  writer.writeLong(offsets[2], object.setCount);
  writer.writeDoubleList(offsets[3], object.weight);
}

IncludedExercises _includedExercisesDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IncludedExercises();
  object.exerciseName = reader.readStringOrNull(offsets[0]);
  object.reps = reader.readLongList(offsets[1]);
  object.setCount = reader.readLongOrNull(offsets[2]);
  object.weight = reader.readDoubleList(offsets[3]);
  return object;
}

P _includedExercisesDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readLongList(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readDoubleList(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension IncludedExercisesQueryFilter
    on QueryBuilder<IncludedExercises, IncludedExercises, QFilterCondition> {
  QueryBuilder<IncludedExercises, IncludedExercises, QAfterFilterCondition>
      exerciseNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'exerciseName',
      ));
    });
  }

  QueryBuilder<IncludedExercises, IncludedExercises, QAfterFilterCondition>
      exerciseNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'exerciseName',
      ));
    });
  }

  QueryBuilder<IncludedExercises, IncludedExercises, QAfterFilterCondition>
      exerciseNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'exerciseName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IncludedExercises, IncludedExercises, QAfterFilterCondition>
      exerciseNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'exerciseName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IncludedExercises, IncludedExercises, QAfterFilterCondition>
      exerciseNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'exerciseName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IncludedExercises, IncludedExercises, QAfterFilterCondition>
      exerciseNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'exerciseName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IncludedExercises, IncludedExercises, QAfterFilterCondition>
      exerciseNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'exerciseName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IncludedExercises, IncludedExercises, QAfterFilterCondition>
      exerciseNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'exerciseName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IncludedExercises, IncludedExercises, QAfterFilterCondition>
      exerciseNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'exerciseName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IncludedExercises, IncludedExercises, QAfterFilterCondition>
      exerciseNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'exerciseName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IncludedExercises, IncludedExercises, QAfterFilterCondition>
      exerciseNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'exerciseName',
        value: '',
      ));
    });
  }

  QueryBuilder<IncludedExercises, IncludedExercises, QAfterFilterCondition>
      exerciseNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'exerciseName',
        value: '',
      ));
    });
  }

  QueryBuilder<IncludedExercises, IncludedExercises, QAfterFilterCondition>
      repsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'reps',
      ));
    });
  }

  QueryBuilder<IncludedExercises, IncludedExercises, QAfterFilterCondition>
      repsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'reps',
      ));
    });
  }

  QueryBuilder<IncludedExercises, IncludedExercises, QAfterFilterCondition>
      repsElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reps',
        value: value,
      ));
    });
  }

  QueryBuilder<IncludedExercises, IncludedExercises, QAfterFilterCondition>
      repsElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'reps',
        value: value,
      ));
    });
  }

  QueryBuilder<IncludedExercises, IncludedExercises, QAfterFilterCondition>
      repsElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'reps',
        value: value,
      ));
    });
  }

  QueryBuilder<IncludedExercises, IncludedExercises, QAfterFilterCondition>
      repsElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'reps',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IncludedExercises, IncludedExercises, QAfterFilterCondition>
      repsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'reps',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<IncludedExercises, IncludedExercises, QAfterFilterCondition>
      repsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'reps',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<IncludedExercises, IncludedExercises, QAfterFilterCondition>
      repsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'reps',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<IncludedExercises, IncludedExercises, QAfterFilterCondition>
      repsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'reps',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<IncludedExercises, IncludedExercises, QAfterFilterCondition>
      repsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'reps',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<IncludedExercises, IncludedExercises, QAfterFilterCondition>
      repsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'reps',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<IncludedExercises, IncludedExercises, QAfterFilterCondition>
      setCountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'setCount',
      ));
    });
  }

  QueryBuilder<IncludedExercises, IncludedExercises, QAfterFilterCondition>
      setCountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'setCount',
      ));
    });
  }

  QueryBuilder<IncludedExercises, IncludedExercises, QAfterFilterCondition>
      setCountEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'setCount',
        value: value,
      ));
    });
  }

  QueryBuilder<IncludedExercises, IncludedExercises, QAfterFilterCondition>
      setCountGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'setCount',
        value: value,
      ));
    });
  }

  QueryBuilder<IncludedExercises, IncludedExercises, QAfterFilterCondition>
      setCountLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'setCount',
        value: value,
      ));
    });
  }

  QueryBuilder<IncludedExercises, IncludedExercises, QAfterFilterCondition>
      setCountBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'setCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IncludedExercises, IncludedExercises, QAfterFilterCondition>
      weightIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'weight',
      ));
    });
  }

  QueryBuilder<IncludedExercises, IncludedExercises, QAfterFilterCondition>
      weightIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'weight',
      ));
    });
  }

  QueryBuilder<IncludedExercises, IncludedExercises, QAfterFilterCondition>
      weightElementEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'weight',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<IncludedExercises, IncludedExercises, QAfterFilterCondition>
      weightElementGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'weight',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<IncludedExercises, IncludedExercises, QAfterFilterCondition>
      weightElementLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'weight',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<IncludedExercises, IncludedExercises, QAfterFilterCondition>
      weightElementBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'weight',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<IncludedExercises, IncludedExercises, QAfterFilterCondition>
      weightLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weight',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<IncludedExercises, IncludedExercises, QAfterFilterCondition>
      weightIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weight',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<IncludedExercises, IncludedExercises, QAfterFilterCondition>
      weightIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weight',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<IncludedExercises, IncludedExercises, QAfterFilterCondition>
      weightLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weight',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<IncludedExercises, IncludedExercises, QAfterFilterCondition>
      weightLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weight',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<IncludedExercises, IncludedExercises, QAfterFilterCondition>
      weightLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weight',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension IncludedExercisesQueryObject
    on QueryBuilder<IncludedExercises, IncludedExercises, QFilterCondition> {}
