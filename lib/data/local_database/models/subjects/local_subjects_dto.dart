import 'package:isar/isar.dart';
import 'package:online_exam_app/domain/entities/subject/subjects.dart';

part 'local_subjects_dto.g.dart';

@collection
class LocalSubjectsDto {
  Id? id = Isar.autoIncrement;
  final String? subjectId;
  final String? name;
  final String? icon;
  final String? createdAt;

  LocalSubjectsDto({
    this.subjectId,
    this.name,
    this.icon,
    this.createdAt,
  });

  factory LocalSubjectsDto.fromDomain(Subject subject) => LocalSubjectsDto(
        subjectId: subject.id,
        name: subject.name,
        icon: subject.icon,
        createdAt: subject.createdAt,
      );

  Subject toDomain() {
    return Subject(
      id: subjectId,
      name: name,
      icon: icon,
      createdAt: createdAt,
    );
  }
}
