// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:io' as _i6;

import 'package:dio/dio.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:isar/isar.dart' as _i7;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i10;

import '../../data/api/auth/auth_retrofit_client.dart' as _i14;
import '../../data/api/dio_provider.dart' as _i34;
import '../../data/api/subjects/subjects_retrofit_client.dart' as _i12;
import '../../data/core/api_execution.dart' as _i3;
import '../../data/datasource/contract/auth_remote_datasource.dart' as _i19;
import '../../data/datasource/contract/subjects_remote_datasource.dart' as _i15;
import '../../data/datasource/impl/auth_remote_datasource_impl.dart' as _i20;
import '../../data/datasource/impl/subjects_remote_datasource_impl.dart'
    as _i16;
import '../../data/local_database/isar_module.dart' as _i35;
import '../../data/local_database/subjects/subjects_local_database.dart'
    as _i11;
import '../../data/repository/auth_repository_impl.dart' as _i22;
import '../../data/repository/subjects_repository_impl.dart' as _i18;
import '../../domain/repository/auth_repository.dart' as _i21;
import '../../domain/repository/subjects_repository.dart' as _i17;
import '../../domain/use_case/forget_password_use_case.dart' as _i23;
import '../../domain/use_case/get_subject_list_use_case.dart' as _i25;
import '../../domain/use_case/login_user_use_case.dart' as _i26;
import '../../domain/use_case/reset_password_use_case.dart' as _i28;
import '../../domain/use_case/signup_user_use_case.dart' as _i30;
import '../../domain/use_case/verify_reset_code_use_case.dart' as _i32;
import '../../presentation/forget_password/forget_password_view_model.dart'
    as _i24;
import '../../presentation/login/login_view_model.dart' as _i27;
import '../../presentation/main_layout/main_view_model.dart' as _i9;
import '../../presentation/otp_verify/otp_verify_view_model.dart' as _i33;
import '../../presentation/reset_password/reset_password_view_model.dart'
    as _i29;
import '../../presentation/signup/signup_view_model.dart' as _i31;
import '../providers/app_config_provider.dart' as _i4;
import '../providers/language_provider.dart' as _i8;
import '../utils/app_initializer.dart' as _i13;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final networkModule = _$NetworkModule();
    final isarModule = _$IsarModule();
    gh.singleton<_i3.ApiExecution>(() => _i3.ApiExecution());
    gh.singleton<_i4.AppConfigProvider>(() => _i4.AppConfigProvider());
    gh.lazySingleton<_i5.Dio>(() => networkModule.provideDio());
    await gh.lazySingletonAsync<_i6.Directory>(
      () => isarModule.providerDirectory,
      preResolve: true,
    );
    await gh.lazySingletonAsync<_i7.Isar>(
      () => isarModule.providerIsra,
      preResolve: true,
    );
    gh.singleton<_i8.LanguageProvider>(() => _i8.LanguageProvider());
    gh.factory<_i9.MainViewModel>(() => _i9.MainViewModel());
    gh.factory<_i10.PrettyDioLogger>(() => networkModule.providerInterceptor());
    gh.singleton<_i11.SubjectsLocalDatabase>(
        () => _i11.SubjectsLocalDatabase(gh<_i7.Isar>()));
    gh.singleton<_i12.SubjectsRetrofitClient>(
        () => _i12.SubjectsRetrofitClient(gh<_i5.Dio>()));
    gh.lazySingleton<_i13.AppInitializer>(() => _i13.AppInitializer(
          gh<_i8.LanguageProvider>(),
          gh<_i4.AppConfigProvider>(),
        ));
    gh.singleton<_i14.AuthRetrofitClient>(
        () => _i14.AuthRetrofitClient(gh<_i5.Dio>()));
    gh.factory<_i15.SubjectsRemoteDatasource>(
        () => _i16.SubjectsRemoteDatasourceImpl(
              gh<_i12.SubjectsRetrofitClient>(),
              gh<_i3.ApiExecution>(),
            ));
    gh.factory<_i17.SubjectsRepository>(
        () => _i18.SubjectsRepositoryImpl(gh<_i15.SubjectsRemoteDatasource>()));
    gh.factory<_i19.AuthRemoteDatasource>(() => _i20.AuthRemoteDatasourceImpl(
          gh<_i14.AuthRetrofitClient>(),
          gh<_i3.ApiExecution>(),
        ));
    gh.factory<_i21.AuthRepository>(
        () => _i22.AuthRepositoryImpl(gh<_i19.AuthRemoteDatasource>()));
    gh.factory<_i23.ForgetPasswordUseCase>(
        () => _i23.ForgetPasswordUseCase(gh<_i21.AuthRepository>()));
    gh.factory<_i24.ForgetPasswordViewModel>(
        () => _i24.ForgetPasswordViewModel(gh<_i23.ForgetPasswordUseCase>()));
    gh.factory<_i25.GetSubjectListUseCase>(
        () => _i25.GetSubjectListUseCase(gh<_i17.SubjectsRepository>()));
    gh.factory<_i26.LoginUserUseCase>(
        () => _i26.LoginUserUseCase(gh<_i21.AuthRepository>()));
    gh.factory<_i27.LoginViewModel>(
        () => _i27.LoginViewModel(gh<_i26.LoginUserUseCase>()));
    gh.factory<_i28.ResetPasswordUseCase>(
        () => _i28.ResetPasswordUseCase(gh<_i21.AuthRepository>()));
    gh.factory<_i29.ResetPasswordViewModel>(
        () => _i29.ResetPasswordViewModel(gh<_i28.ResetPasswordUseCase>()));
    gh.factory<_i30.SignupUserUseCase>(
        () => _i30.SignupUserUseCase(gh<_i21.AuthRepository>()));
    gh.factory<_i31.SignupViewModel>(
        () => _i31.SignupViewModel(gh<_i30.SignupUserUseCase>()));
    gh.factory<_i32.VerifyResetPasswordUseCase>(
        () => _i32.VerifyResetPasswordUseCase(gh<_i21.AuthRepository>()));
    gh.factory<_i33.OtpVerifyViewModel>(() => _i33.OtpVerifyViewModel(
          gh<_i32.VerifyResetPasswordUseCase>(),
          gh<_i23.ForgetPasswordUseCase>(),
        ));
    return this;
  }
}

class _$NetworkModule extends _i34.NetworkModule {}

class _$IsarModule extends _i35.IsarModule {}
