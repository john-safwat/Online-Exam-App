// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_exam_dto.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetLocalExamDtoCollection on Isar {
  IsarCollection<LocalExamDto> get localExamDtos => this.collection();
}

const LocalExamDtoSchema = CollectionSchema(
  name: r'LocalExamDto',
  id: 6550465297627653007,
  properties: {
    r'active': PropertySchema(
      id: 0,
      name: r'active',
      type: IsarType.bool,
    ),
    r'createdAt': PropertySchema(
      id: 1,
      name: r'createdAt',
      type: IsarType.string,
    ),
    r'duration': PropertySchema(
      id: 2,
      name: r'duration',
      type: IsarType.long,
    ),
    r'id': PropertySchema(
      id: 3,
      name: r'id',
      type: IsarType.string,
    ),
    r'numberOfQuestions': PropertySchema(
      id: 4,
      name: r'numberOfQuestions',
      type: IsarType.long,
    ),
    r'questions': PropertySchema(
      id: 5,
      name: r'questions',
      type: IsarType.objectList,
      target: r'LocalQuestionDto',
    ),
    r'subject': PropertySchema(
      id: 6,
      name: r'subject',
      type: IsarType.string,
    ),
    r'title': PropertySchema(
      id: 7,
      name: r'title',
      type: IsarType.string,
    )
  },
  estimateSize: _localExamDtoEstimateSize,
  serialize: _localExamDtoSerialize,
  deserialize: _localExamDtoDeserialize,
  deserializeProp: _localExamDtoDeserializeProp,
  idName: r'examId',
  indexes: {},
  links: {},
  embeddedSchemas: {
    r'LocalQuestionDto': LocalQuestionDtoSchema,
    r'LocalAnswerDto': LocalAnswerDtoSchema
  },
  getId: _localExamDtoGetId,
  getLinks: _localExamDtoGetLinks,
  attach: _localExamDtoAttach,
  version: '3.1.8',
);

int _localExamDtoEstimateSize(
  LocalExamDto object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.createdAt;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.id;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final list = object.questions;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[LocalQuestionDto]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          if (value != null) {
            bytesCount +=
                LocalQuestionDtoSchema.estimateSize(value, offsets, allOffsets);
          }
        }
      }
    }
  }
  {
    final value = object.subject;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.title;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _localExamDtoSerialize(
  LocalExamDto object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.active);
  writer.writeString(offsets[1], object.createdAt);
  writer.writeLong(offsets[2], object.duration);
  writer.writeString(offsets[3], object.id);
  writer.writeLong(offsets[4], object.numberOfQuestions);
  writer.writeObjectList<LocalQuestionDto>(
    offsets[5],
    allOffsets,
    LocalQuestionDtoSchema.serialize,
    object.questions,
  );
  writer.writeString(offsets[6], object.subject);
  writer.writeString(offsets[7], object.title);
}

LocalExamDto _localExamDtoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = LocalExamDto(
    active: reader.readBoolOrNull(offsets[0]),
    createdAt: reader.readStringOrNull(offsets[1]),
    duration: reader.readLongOrNull(offsets[2]),
    id: reader.readStringOrNull(offsets[3]),
    numberOfQuestions: reader.readLongOrNull(offsets[4]),
    questions: reader.readObjectOrNullList<LocalQuestionDto>(
      offsets[5],
      LocalQuestionDtoSchema.deserialize,
      allOffsets,
    ),
    subject: reader.readStringOrNull(offsets[6]),
    title: reader.readStringOrNull(offsets[7]),
  );
  object.examId = id;
  return object;
}

P _localExamDtoDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBoolOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readObjectOrNullList<LocalQuestionDto>(
        offset,
        LocalQuestionDtoSchema.deserialize,
        allOffsets,
      )) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _localExamDtoGetId(LocalExamDto object) {
  return object.examId ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _localExamDtoGetLinks(LocalExamDto object) {
  return [];
}

void _localExamDtoAttach(
    IsarCollection<dynamic> col, Id id, LocalExamDto object) {
  object.examId = id;
}

extension LocalExamDtoQueryWhereSort
    on QueryBuilder<LocalExamDto, LocalExamDto, QWhere> {
  QueryBuilder<LocalExamDto, LocalExamDto, QAfterWhere> anyExamId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension LocalExamDtoQueryWhere
    on QueryBuilder<LocalExamDto, LocalExamDto, QWhereClause> {
  QueryBuilder<LocalExamDto, LocalExamDto, QAfterWhereClause> examIdEqualTo(
      Id examId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: examId,
        upper: examId,
      ));
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterWhereClause> examIdNotEqualTo(
      Id examId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: examId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: examId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: examId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: examId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterWhereClause> examIdGreaterThan(
      Id examId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: examId, includeLower: include),
      );
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterWhereClause> examIdLessThan(
      Id examId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: examId, includeUpper: include),
      );
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterWhereClause> examIdBetween(
    Id lowerExamId,
    Id upperExamId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerExamId,
        includeLower: includeLower,
        upper: upperExamId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension LocalExamDtoQueryFilter
    on QueryBuilder<LocalExamDto, LocalExamDto, QFilterCondition> {
  QueryBuilder<LocalExamDto, LocalExamDto, QAfterFilterCondition>
      activeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'active',
      ));
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterFilterCondition>
      activeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'active',
      ));
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterFilterCondition> activeEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'active',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterFilterCondition>
      createdAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterFilterCondition>
      createdAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterFilterCondition>
      createdAtEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterFilterCondition>
      createdAtGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterFilterCondition>
      createdAtLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterFilterCondition>
      createdAtBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterFilterCondition>
      createdAtStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'createdAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterFilterCondition>
      createdAtEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'createdAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterFilterCondition>
      createdAtContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'createdAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterFilterCondition>
      createdAtMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'createdAt',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterFilterCondition>
      createdAtIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterFilterCondition>
      createdAtIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'createdAt',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterFilterCondition>
      durationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'duration',
      ));
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterFilterCondition>
      durationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'duration',
      ));
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterFilterCondition>
      durationEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'duration',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterFilterCondition>
      durationGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'duration',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterFilterCondition>
      durationLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'duration',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterFilterCondition>
      durationBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'duration',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterFilterCondition>
      examIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'examId',
      ));
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterFilterCondition>
      examIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'examId',
      ));
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterFilterCondition> examIdEqualTo(
      Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'examId',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterFilterCondition>
      examIdGreaterThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'examId',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterFilterCondition>
      examIdLessThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'examId',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterFilterCondition> examIdBetween(
    Id? lower,
    Id? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'examId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterFilterCondition> idEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterFilterCondition> idGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterFilterCondition> idLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterFilterCondition> idBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterFilterCondition> idStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterFilterCondition> idEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterFilterCondition> idContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterFilterCondition> idMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'id',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterFilterCondition> idIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterFilterCondition>
      idIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterFilterCondition>
      numberOfQuestionsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'numberOfQuestions',
      ));
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterFilterCondition>
      numberOfQuestionsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'numberOfQuestions',
      ));
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterFilterCondition>
      numberOfQuestionsEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'numberOfQuestions',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterFilterCondition>
      numberOfQuestionsGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'numberOfQuestions',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterFilterCondition>
      numberOfQuestionsLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'numberOfQuestions',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterFilterCondition>
      numberOfQuestionsBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'numberOfQuestions',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterFilterCondition>
      questionsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'questions',
      ));
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterFilterCondition>
      questionsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'questions',
      ));
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterFilterCondition>
      questionsElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNull(
        property: r'questions',
      ));
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterFilterCondition>
      questionsElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNotNull(
        property: r'questions',
      ));
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterFilterCondition>
      questionsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'questions',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterFilterCondition>
      questionsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'questions',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterFilterCondition>
      questionsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'questions',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterFilterCondition>
      questionsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'questions',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterFilterCondition>
      questionsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'questions',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterFilterCondition>
      questionsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'questions',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterFilterCondition>
      subjectIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'subject',
      ));
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterFilterCondition>
      subjectIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'subject',
      ));
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterFilterCondition>
      subjectEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'subject',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterFilterCondition>
      subjectGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'subject',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterFilterCondition>
      subjectLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'subject',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterFilterCondition>
      subjectBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'subject',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterFilterCondition>
      subjectStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'subject',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterFilterCondition>
      subjectEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'subject',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterFilterCondition>
      subjectContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'subject',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterFilterCondition>
      subjectMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'subject',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterFilterCondition>
      subjectIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'subject',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterFilterCondition>
      subjectIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'subject',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterFilterCondition>
      titleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'title',
      ));
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterFilterCondition>
      titleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'title',
      ));
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterFilterCondition> titleEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterFilterCondition>
      titleGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterFilterCondition> titleLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterFilterCondition> titleBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'title',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterFilterCondition>
      titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterFilterCondition> titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterFilterCondition> titleContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterFilterCondition> titleMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterFilterCondition>
      titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterFilterCondition>
      titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }
}

extension LocalExamDtoQueryObject
    on QueryBuilder<LocalExamDto, LocalExamDto, QFilterCondition> {
  QueryBuilder<LocalExamDto, LocalExamDto, QAfterFilterCondition>
      questionsElement(FilterQuery<LocalQuestionDto> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'questions');
    });
  }
}

extension LocalExamDtoQueryLinks
    on QueryBuilder<LocalExamDto, LocalExamDto, QFilterCondition> {}

extension LocalExamDtoQuerySortBy
    on QueryBuilder<LocalExamDto, LocalExamDto, QSortBy> {
  QueryBuilder<LocalExamDto, LocalExamDto, QAfterSortBy> sortByActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'active', Sort.asc);
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterSortBy> sortByActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'active', Sort.desc);
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterSortBy> sortByDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'duration', Sort.asc);
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterSortBy> sortByDurationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'duration', Sort.desc);
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterSortBy> sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterSortBy> sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterSortBy>
      sortByNumberOfQuestions() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numberOfQuestions', Sort.asc);
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterSortBy>
      sortByNumberOfQuestionsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numberOfQuestions', Sort.desc);
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterSortBy> sortBySubject() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subject', Sort.asc);
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterSortBy> sortBySubjectDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subject', Sort.desc);
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterSortBy> sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }
}

extension LocalExamDtoQuerySortThenBy
    on QueryBuilder<LocalExamDto, LocalExamDto, QSortThenBy> {
  QueryBuilder<LocalExamDto, LocalExamDto, QAfterSortBy> thenByActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'active', Sort.asc);
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterSortBy> thenByActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'active', Sort.desc);
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterSortBy> thenByDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'duration', Sort.asc);
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterSortBy> thenByDurationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'duration', Sort.desc);
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterSortBy> thenByExamId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'examId', Sort.asc);
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterSortBy> thenByExamIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'examId', Sort.desc);
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterSortBy>
      thenByNumberOfQuestions() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numberOfQuestions', Sort.asc);
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterSortBy>
      thenByNumberOfQuestionsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numberOfQuestions', Sort.desc);
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterSortBy> thenBySubject() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subject', Sort.asc);
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterSortBy> thenBySubjectDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subject', Sort.desc);
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QAfterSortBy> thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }
}

extension LocalExamDtoQueryWhereDistinct
    on QueryBuilder<LocalExamDto, LocalExamDto, QDistinct> {
  QueryBuilder<LocalExamDto, LocalExamDto, QDistinct> distinctByActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'active');
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QDistinct> distinctByCreatedAt(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QDistinct> distinctByDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'duration');
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QDistinct> distinctById(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QDistinct>
      distinctByNumberOfQuestions() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'numberOfQuestions');
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QDistinct> distinctBySubject(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'subject', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalExamDto, LocalExamDto, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }
}

extension LocalExamDtoQueryProperty
    on QueryBuilder<LocalExamDto, LocalExamDto, QQueryProperty> {
  QueryBuilder<LocalExamDto, int, QQueryOperations> examIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'examId');
    });
  }

  QueryBuilder<LocalExamDto, bool?, QQueryOperations> activeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'active');
    });
  }

  QueryBuilder<LocalExamDto, String?, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<LocalExamDto, int?, QQueryOperations> durationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'duration');
    });
  }

  QueryBuilder<LocalExamDto, String?, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<LocalExamDto, int?, QQueryOperations>
      numberOfQuestionsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'numberOfQuestions');
    });
  }

  QueryBuilder<LocalExamDto, List<LocalQuestionDto?>?, QQueryOperations>
      questionsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'questions');
    });
  }

  QueryBuilder<LocalExamDto, String?, QQueryOperations> subjectProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'subject');
    });
  }

  QueryBuilder<LocalExamDto, String?, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }
}
