import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:online_exam_app/core/di/di.dart';
import 'package:online_exam_app/data/models/subject/subjects_dto.dart';
import 'package:path_provider/path_provider.dart';

@module
abstract class IsarModule {
  @preResolve
  Future<Isar> get providerIsra async => Isar.open(
        [SubjectsDtoSchema],
        directory: getIt<Directory>().path,
      );

  @preResolve
  Future<Directory> get providerDirectory async =>
      getApplicationDocumentsDirectory();
}
