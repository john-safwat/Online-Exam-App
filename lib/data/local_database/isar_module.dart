import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:online_exam_app/core/di/di.dart';
import 'package:online_exam_app/data/local_database/models/subjects/local_subjects_dto.dart';
import 'package:online_exam_app/data/local_database/models/user/local_user_dto.dart';
import 'package:path_provider/path_provider.dart';

@module
abstract class IsarModule {
  @preResolve
  Future<Isar> get providerIsar async => Isar.open(
        [LocalUserDtoSchema, LocalSubjectsDtoSchema],
        directory: getIt<Directory>().path,
      );

  @preResolve
  Future<Directory> get providerDirectory async =>
      getApplicationDocumentsDirectory();
}
