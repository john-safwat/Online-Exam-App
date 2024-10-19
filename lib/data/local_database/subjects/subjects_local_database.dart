import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';

@singleton
class SubjectsLocalDatabase {
  Isar isar;

  SubjectsLocalDatabase(this.isar);
}
