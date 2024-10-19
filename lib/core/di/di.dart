import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/di/di.config.dart'; // Import the generated config file

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
Future<void> configureDependencies() async => await getIt.init();
