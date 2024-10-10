// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../data/api/Auth/auth_api_manager.dart' as _i775;
import '../../data/api/Auth/auth_retrofit_clint.dart' as _i598;
import '../../data/api/dio_provider.dart' as _i304;
import '../../data/core/api_execution.dart' as _i715;
import '../../data/datasource/contract/auth_remote_datasource.dart' as _i912;
import '../../data/datasource/impl/auth_remote_datasource_impl.dart' as _i939;
import '../../data/repository/auth_repository_impl.dart' as _i581;
import '../../domain/repository/auth_repository.dart' as _i614;
import '../../domain/use_case/signup_user_use_case.dart' as _i205;
import '../../presentation/main_layout/main_view_model.dart' as _i911;
import '../../presentation/signup/signup_view_model.dart' as _i679;
import '../providers/language_provider.dart' as _i822;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final networkModule = _$NetworkModule();
    gh.factory<_i911.MainViewModel>(() => _i911.MainViewModel());
    gh.factory<_i715.ApiExecution>(() => _i715.ApiExecution());
    gh.singleton<_i822.LanguageProvider>(() => _i822.LanguageProvider());
    gh.lazySingleton<_i361.Dio>(() => networkModule.provideDio());
    gh.factory<_i598.AuthRetrofitClint>(
        () => _i598.AuthRetrofitClint(gh<_i361.Dio>()));
    gh.factory<_i775.AuthApiManager>(
        () => _i775.AuthApiManager(gh<_i598.AuthRetrofitClint>()));
    gh.factory<_i912.AuthRemoteDatasource>(() => _i939.AuthRemoteDatasourceImpl(
          gh<_i775.AuthApiManager>(),
          gh<_i715.ApiExecution>(),
        ));
    gh.factory<_i614.AuthRepository>(
        () => _i581.AuthRepositoryImpl(gh<_i912.AuthRemoteDatasource>()));
    gh.factory<_i205.SignupUserUseCase>(
        () => _i205.SignupUserUseCase(gh<_i614.AuthRepository>()));
    gh.factory<_i679.SignupViewModel>(
        () => _i679.SignupViewModel(gh<_i205.SignupUserUseCase>()));
    return this;
  }
}

class _$NetworkModule extends _i304.NetworkModule {}
