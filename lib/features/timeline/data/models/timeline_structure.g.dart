// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timeline_structure.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetTimelineStructureCollection on Isar {
  IsarCollection<TimelineStructure> get timelineStructures => this.collection();
}

const TimelineStructureSchema = CollectionSchema(
  name: r'TimelineStructure',
  id: -2833298666849030966,
  properties: {
    r'activityID': PropertySchema(
      id: 0,
      name: r'activityID',
      type: IsarType.string,
    ),
    r'activityName': PropertySchema(
      id: 1,
      name: r'activityName',
      type: IsarType.string,
    ),
    r'actualFinish': PropertySchema(
      id: 2,
      name: r'actualFinish',
      type: IsarType.string,
    ),
    r'actualStart': PropertySchema(
      id: 3,
      name: r'actualStart',
      type: IsarType.string,
    ),
    r'complete': PropertySchema(
      id: 4,
      name: r'complete',
      type: IsarType.string,
    ),
    r'finish': PropertySchema(
      id: 5,
      name: r'finish',
      type: IsarType.string,
    ),
    r'projectId': PropertySchema(
      id: 6,
      name: r'projectId',
      type: IsarType.string,
    ),
    r'start': PropertySchema(
      id: 7,
      name: r'start',
      type: IsarType.string,
    )
  },
  estimateSize: _timelineStructureEstimateSize,
  serialize: _timelineStructureSerialize,
  deserialize: _timelineStructureDeserialize,
  deserializeProp: _timelineStructureDeserializeProp,
  idName: r'uId',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _timelineStructureGetId,
  getLinks: _timelineStructureGetLinks,
  attach: _timelineStructureAttach,
  version: '3.1.8',
);

int _timelineStructureEstimateSize(
  TimelineStructure object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.activityID;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.activityName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.actualFinish;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.actualStart;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.complete;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.finish;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.projectId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.start;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _timelineStructureSerialize(
  TimelineStructure object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.activityID);
  writer.writeString(offsets[1], object.activityName);
  writer.writeString(offsets[2], object.actualFinish);
  writer.writeString(offsets[3], object.actualStart);
  writer.writeString(offsets[4], object.complete);
  writer.writeString(offsets[5], object.finish);
  writer.writeString(offsets[6], object.projectId);
  writer.writeString(offsets[7], object.start);
}

TimelineStructure _timelineStructureDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = TimelineStructure(
    activityID: reader.readStringOrNull(offsets[0]),
    activityName: reader.readStringOrNull(offsets[1]),
    actualFinish: reader.readStringOrNull(offsets[2]),
    actualStart: reader.readStringOrNull(offsets[3]),
    complete: reader.readStringOrNull(offsets[4]),
    finish: reader.readStringOrNull(offsets[5]),
    projectId: reader.readStringOrNull(offsets[6]),
    start: reader.readStringOrNull(offsets[7]),
  );
  object.uId = id;
  return object;
}

P _timelineStructureDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _timelineStructureGetId(TimelineStructure object) {
  return object.uId;
}

List<IsarLinkBase<dynamic>> _timelineStructureGetLinks(
    TimelineStructure object) {
  return [];
}

void _timelineStructureAttach(
    IsarCollection<dynamic> col, Id id, TimelineStructure object) {
  object.uId = id;
}

extension TimelineStructureQueryWhereSort
    on QueryBuilder<TimelineStructure, TimelineStructure, QWhere> {
  QueryBuilder<TimelineStructure, TimelineStructure, QAfterWhere> anyUId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension TimelineStructureQueryWhere
    on QueryBuilder<TimelineStructure, TimelineStructure, QWhereClause> {
  QueryBuilder<TimelineStructure, TimelineStructure, QAfterWhereClause>
      uIdEqualTo(Id uId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: uId,
        upper: uId,
      ));
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterWhereClause>
      uIdNotEqualTo(Id uId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: uId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: uId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: uId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: uId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterWhereClause>
      uIdGreaterThan(Id uId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: uId, includeLower: include),
      );
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterWhereClause>
      uIdLessThan(Id uId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: uId, includeUpper: include),
      );
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterWhereClause>
      uIdBetween(
    Id lowerUId,
    Id upperUId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerUId,
        includeLower: includeLower,
        upper: upperUId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension TimelineStructureQueryFilter
    on QueryBuilder<TimelineStructure, TimelineStructure, QFilterCondition> {
  QueryBuilder<TimelineStructure, TimelineStructure, QAfterFilterCondition>
      activityIDIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'activityID',
      ));
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterFilterCondition>
      activityIDIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'activityID',
      ));
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterFilterCondition>
      activityIDEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'activityID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterFilterCondition>
      activityIDGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'activityID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterFilterCondition>
      activityIDLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'activityID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterFilterCondition>
      activityIDBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'activityID',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterFilterCondition>
      activityIDStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'activityID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterFilterCondition>
      activityIDEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'activityID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterFilterCondition>
      activityIDContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'activityID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterFilterCondition>
      activityIDMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'activityID',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterFilterCondition>
      activityIDIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'activityID',
        value: '',
      ));
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterFilterCondition>
      activityIDIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'activityID',
        value: '',
      ));
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterFilterCondition>
      activityNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'activityName',
      ));
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterFilterCondition>
      activityNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'activityName',
      ));
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterFilterCondition>
      activityNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'activityName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterFilterCondition>
      activityNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'activityName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterFilterCondition>
      activityNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'activityName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterFilterCondition>
      activityNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'activityName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterFilterCondition>
      activityNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'activityName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterFilterCondition>
      activityNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'activityName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterFilterCondition>
      activityNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'activityName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterFilterCondition>
      activityNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'activityName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterFilterCondition>
      activityNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'activityName',
        value: '',
      ));
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterFilterCondition>
      activityNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'activityName',
        value: '',
      ));
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterFilterCondition>
      actualFinishIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'actualFinish',
      ));
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterFilterCondition>
      actualFinishIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'actualFinish',
      ));
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterFilterCondition>
      actualFinishEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'actualFinish',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterFilterCondition>
      actualFinishGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'actualFinish',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterFilterCondition>
      actualFinishLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'actualFinish',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterFilterCondition>
      actualFinishBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'actualFinish',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterFilterCondition>
      actualFinishStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'actualFinish',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterFilterCondition>
      actualFinishEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'actualFinish',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterFilterCondition>
      actualFinishContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'actualFinish',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterFilterCondition>
      actualFinishMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'actualFinish',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterFilterCondition>
      actualFinishIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'actualFinish',
        value: '',
      ));
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterFilterCondition>
      actualFinishIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'actualFinish',
        value: '',
      ));
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterFilterCondition>
      actualStartIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'actualStart',
      ));
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterFilterCondition>
      actualStartIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'actualStart',
      ));
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterFilterCondition>
      actualStartEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'actualStart',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterFilterCondition>
      actualStartGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'actualStart',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterFilterCondition>
      actualStartLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'actualStart',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterFilterCondition>
      actualStartBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'actualStart',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterFilterCondition>
      actualStartStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'actualStart',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterFilterCondition>
      actualStartEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'actualStart',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterFilterCondition>
      actualStartContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'actualStart',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterFilterCondition>
      actualStartMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'actualStart',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterFilterCondition>
      actualStartIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'actualStart',
        value: '',
      ));
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterFilterCondition>
      actualStartIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'actualStart',
        value: '',
      ));
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterFilterCondition>
      completeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'complete',
      ));
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterFilterCondition>
      completeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'complete',
      ));
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterFilterCondition>
      completeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'complete',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterFilterCondition>
      completeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'complete',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterFilterCondition>
      completeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'complete',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterFilterCondition>
      completeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'complete',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterFilterCondition>
      completeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'complete',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterFilterCondition>
      completeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'complete',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterFilterCondition>
      completeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'complete',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterFilterCondition>
      completeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'complete',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterFilterCondition>
      completeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'complete',
        value: '',
      ));
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterFilterCondition>
      completeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'complete',
        value: '',
      ));
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterFilterCondition>
      finishIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'finish',
      ));
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterFilterCondition>
      finishIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'finish',
      ));
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterFilterCondition>
      finishEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'finish',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterFilterCondition>
      finishGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'finish',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterFilterCondition>
      finishLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'finish',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterFilterCondition>
      finishBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'finish',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterFilterCondition>
      finishStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'finish',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterFilterCondition>
      finishEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'finish',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterFilterCondition>
      finishContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'finish',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterFilterCondition>
      finishMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'finish',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterFilterCondition>
      finishIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'finish',
        value: '',
      ));
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterFilterCondition>
      finishIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'finish',
        value: '',
      ));
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterFilterCondition>
      projectIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'projectId',
      ));
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterFilterCondition>
      projectIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'projectId',
      ));
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterFilterCondition>
      projectIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'projectId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterFilterCondition>
      projectIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'projectId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterFilterCondition>
      projectIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'projectId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterFilterCondition>
      projectIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'projectId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterFilterCondition>
      projectIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'projectId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterFilterCondition>
      projectIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'projectId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterFilterCondition>
      projectIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'projectId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterFilterCondition>
      projectIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'projectId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterFilterCondition>
      projectIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'projectId',
        value: '',
      ));
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterFilterCondition>
      projectIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'projectId',
        value: '',
      ));
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterFilterCondition>
      startIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'start',
      ));
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterFilterCondition>
      startIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'start',
      ));
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterFilterCondition>
      startEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'start',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterFilterCondition>
      startGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'start',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterFilterCondition>
      startLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'start',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterFilterCondition>
      startBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'start',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterFilterCondition>
      startStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'start',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterFilterCondition>
      startEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'start',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterFilterCondition>
      startContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'start',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterFilterCondition>
      startMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'start',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterFilterCondition>
      startIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'start',
        value: '',
      ));
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterFilterCondition>
      startIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'start',
        value: '',
      ));
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterFilterCondition>
      uIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uId',
        value: value,
      ));
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterFilterCondition>
      uIdGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'uId',
        value: value,
      ));
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterFilterCondition>
      uIdLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'uId',
        value: value,
      ));
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterFilterCondition>
      uIdBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'uId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension TimelineStructureQueryObject
    on QueryBuilder<TimelineStructure, TimelineStructure, QFilterCondition> {}

extension TimelineStructureQueryLinks
    on QueryBuilder<TimelineStructure, TimelineStructure, QFilterCondition> {}

extension TimelineStructureQuerySortBy
    on QueryBuilder<TimelineStructure, TimelineStructure, QSortBy> {
  QueryBuilder<TimelineStructure, TimelineStructure, QAfterSortBy>
      sortByActivityID() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activityID', Sort.asc);
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterSortBy>
      sortByActivityIDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activityID', Sort.desc);
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterSortBy>
      sortByActivityName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activityName', Sort.asc);
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterSortBy>
      sortByActivityNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activityName', Sort.desc);
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterSortBy>
      sortByActualFinish() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualFinish', Sort.asc);
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterSortBy>
      sortByActualFinishDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualFinish', Sort.desc);
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterSortBy>
      sortByActualStart() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualStart', Sort.asc);
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterSortBy>
      sortByActualStartDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualStart', Sort.desc);
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterSortBy>
      sortByComplete() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'complete', Sort.asc);
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterSortBy>
      sortByCompleteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'complete', Sort.desc);
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterSortBy>
      sortByFinish() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'finish', Sort.asc);
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterSortBy>
      sortByFinishDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'finish', Sort.desc);
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterSortBy>
      sortByProjectId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'projectId', Sort.asc);
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterSortBy>
      sortByProjectIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'projectId', Sort.desc);
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterSortBy>
      sortByStart() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'start', Sort.asc);
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterSortBy>
      sortByStartDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'start', Sort.desc);
    });
  }
}

extension TimelineStructureQuerySortThenBy
    on QueryBuilder<TimelineStructure, TimelineStructure, QSortThenBy> {
  QueryBuilder<TimelineStructure, TimelineStructure, QAfterSortBy>
      thenByActivityID() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activityID', Sort.asc);
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterSortBy>
      thenByActivityIDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activityID', Sort.desc);
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterSortBy>
      thenByActivityName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activityName', Sort.asc);
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterSortBy>
      thenByActivityNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activityName', Sort.desc);
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterSortBy>
      thenByActualFinish() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualFinish', Sort.asc);
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterSortBy>
      thenByActualFinishDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualFinish', Sort.desc);
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterSortBy>
      thenByActualStart() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualStart', Sort.asc);
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterSortBy>
      thenByActualStartDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualStart', Sort.desc);
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterSortBy>
      thenByComplete() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'complete', Sort.asc);
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterSortBy>
      thenByCompleteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'complete', Sort.desc);
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterSortBy>
      thenByFinish() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'finish', Sort.asc);
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterSortBy>
      thenByFinishDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'finish', Sort.desc);
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterSortBy>
      thenByProjectId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'projectId', Sort.asc);
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterSortBy>
      thenByProjectIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'projectId', Sort.desc);
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterSortBy>
      thenByStart() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'start', Sort.asc);
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterSortBy>
      thenByStartDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'start', Sort.desc);
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterSortBy> thenByUId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uId', Sort.asc);
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QAfterSortBy>
      thenByUIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uId', Sort.desc);
    });
  }
}

extension TimelineStructureQueryWhereDistinct
    on QueryBuilder<TimelineStructure, TimelineStructure, QDistinct> {
  QueryBuilder<TimelineStructure, TimelineStructure, QDistinct>
      distinctByActivityID({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'activityID', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QDistinct>
      distinctByActivityName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'activityName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QDistinct>
      distinctByActualFinish({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'actualFinish', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QDistinct>
      distinctByActualStart({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'actualStart', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QDistinct>
      distinctByComplete({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'complete', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QDistinct>
      distinctByFinish({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'finish', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QDistinct>
      distinctByProjectId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'projectId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TimelineStructure, TimelineStructure, QDistinct> distinctByStart(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'start', caseSensitive: caseSensitive);
    });
  }
}

extension TimelineStructureQueryProperty
    on QueryBuilder<TimelineStructure, TimelineStructure, QQueryProperty> {
  QueryBuilder<TimelineStructure, int, QQueryOperations> uIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uId');
    });
  }

  QueryBuilder<TimelineStructure, String?, QQueryOperations>
      activityIDProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'activityID');
    });
  }

  QueryBuilder<TimelineStructure, String?, QQueryOperations>
      activityNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'activityName');
    });
  }

  QueryBuilder<TimelineStructure, String?, QQueryOperations>
      actualFinishProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'actualFinish');
    });
  }

  QueryBuilder<TimelineStructure, String?, QQueryOperations>
      actualStartProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'actualStart');
    });
  }

  QueryBuilder<TimelineStructure, String?, QQueryOperations>
      completeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'complete');
    });
  }

  QueryBuilder<TimelineStructure, String?, QQueryOperations> finishProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'finish');
    });
  }

  QueryBuilder<TimelineStructure, String?, QQueryOperations>
      projectIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'projectId');
    });
  }

  QueryBuilder<TimelineStructure, String?, QQueryOperations> startProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'start');
    });
  }
}
