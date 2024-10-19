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
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i9;
import 'package:shared_preferences/shared_preferences.dart' as _i10;

import '../../data/api/auth/auth_retrofit_client.dart' as _i15;
import '../../data/api/dio_provider.dart' as _i37;
import '../../data/api/subjects/subjects_retrofit_client.dart' as _i12;
import '../../data/core/api_execution.dart' as _i3;
import '../../data/datasource/contract/auth_local_datasource.dart' as _i13;
import '../../data/datasource/contract/auth_remote_datasource.dart' as _i22;
import '../../data/datasource/contract/subjects_remote_datasource.dart' as _i17;
import '../../data/datasource/impl/auth_local_datasource_impl.dart' as _i14;
import '../../data/datasource/impl/auth_remote_datasource_impl.dart' as _i23;
import '../../data/datasource/impl/subjects_remote_datasource_impl.dart'
    as _i18;
import '../../data/local_database/isar_module.dart' as _i38;
import '../../data/local_database/subjects/subjects_local_database.dart'
    as _i11;
import '../../data/repository/auth_repository_impl.dart' as _i25;
import '../../data/repository/subjects_repository_impl.dart' as _i20;
import '../../domain/repository/auth_repository.dart' as _i24;
import '../../domain/repository/subjects_repository.dart' as _i19;
import '../../domain/use_case/forget_password_use_case.dart' as _i26;
import '../../domain/use_case/get_subject_list_use_case.dart' as _i28;
import '../../domain/use_case/login_user_use_case.dart' as _i29;
import '../../domain/use_case/reset_password_use_case.dart' as _i31;
import '../../domain/use_case/signup_user_use_case.dart' as _i33;
import '../../domain/use_case/verify_reset_code_use_case.dart' as _i35;
import '../../presentation/forget_password/forget_password_view_model.dart'
    as _i27;
import '../../presentation/login/login_view_model.dart' as _i30;
import '../../presentation/main_layout/main_view_model.dart' as _i8;
import '../../presentation/otp_verify/otp_verify_view_model.dart' as _i36;
import '../../presentation/reset_password/reset_password_view_model.dart'
    as _i32;
import '../../presentation/signup/signup_view_model.dart' as _i34;
import '../providers/app_config_provider.dart' as _i4;
import '../providers/language_provider.dart' as _i16;
import '../utils/app_initializer.dart' as _i21;
import '../utils/shared_prefrences_provider.dart' as _i39;

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
    final sharedPreferencesProvider = _$SharedPreferencesProvider();
    gh.singleton<_i3.ApiExecution>(() => _i3.ApiExecution());
    gh.singleton<_i4.AppConfigProvider>(() => _i4.AppConfigProvider());
    gh.lazySingleton<_i5.Dio>(() => networkModule.provideDio());
    await gh.factoryAsync<_i6.Directory>(
      () => isarModule.providerDirectory,
      preResolve: true,
    );
    await gh.factoryAsync<_i7.Isar>(
      () => isarModule.providerIsra,
      preResolve: true,
    );
    gh.factory<_i8.MainViewModel>(() => _i8.MainViewModel());
    gh.factory<_i9.PrettyDioLogger>(() => networkModule.providerInterceptor());
    await gh.factoryAsync<_i10.SharedPreferences>(
      () => sharedPreferencesProvider.prefs,
      preResolve: true,
    );
    gh.singleton<_i11.SubjectsLocalDatabase>(
        () => _i11.SubjectsLocalDatabase(gh<_i7.Isar>()));
    gh.singleton<_i12.SubjectsRetrofitClient>(
        () => _i12.SubjectsRetrofitClient(gh<_i5.Dio>()));
    gh.factory<_i13.AuthLocalDatasource>(
        () => _i14.AuthLocalDatasourceImpl(gh<_i10.SharedPreferences>()));
    gh.singleton<_i15.AuthRetrofitClient>(
        () => _i15.AuthRetrofitClient(gh<_i5.Dio>()));
    gh.singleton<_i16.LanguageProvider>(
        () => _i16.LanguageProvider(gh<_i10.SharedPreferences>()));
    gh.factory<_i17.SubjectsRemoteDatasource>(
        () => _i18.SubjectsRemoteDatasourceImpl(
              gh<_i12.SubjectsRetrofitClient>(),
              gh<_i3.ApiExecution>(),
            ));
    gh.factory<_i19.SubjectsRepository>(
        () => _i20.SubjectsRepositoryImpl(gh<_i17.SubjectsRemoteDatasource>()));
    gh.lazySingleton<_i21.AppInitializer>(() => _i21.AppInitializer(
          gh<_i16.LanguageProvider>(),
          gh<_i4.AppConfigProvider>(),
          gh<_i10.SharedPreferences>(),
        ));
    gh.factory<_i22.AuthRemoteDatasource>(() => _i23.AuthRemoteDatasourceImpl(
          gh<_i15.AuthRetrofitClient>(),
          gh<_i3.ApiExecution>(),
        ));
    gh.factory<_i24.AuthRepository>(() => _i25.AuthRepositoryImpl(
          gh<_i22.AuthRemoteDatasource>(),
          gh<_i13.AuthLocalDatasource>(),
        ));
    gh.factory<_i26.ForgetPasswordUseCase>(
        () => _i26.ForgetPasswordUseCase(gh<_i24.AuthRepository>()));
    gh.factory<_i27.ForgetPasswordViewModel>(
        () => _i27.ForgetPasswordViewModel(gh<_i26.ForgetPasswordUseCase>()));
    gh.factory<_i28.GetSubjectListUseCase>(
        () => _i28.GetSubjectListUseCase(gh<_i19.SubjectsRepository>()));
    gh.factory<_i29.LoginUserUseCase>(
        () => _i29.LoginUserUseCase(gh<_i24.AuthRepository>()));
    gh.factory<_i30.LoginViewModel>(
        () => _i30.LoginViewModel(gh<_i29.LoginUserUseCase>()));
    gh.factory<_i31.ResetPasswordUseCase>(
        () => _i31.ResetPasswordUseCase(gh<_i24.AuthRepository>()));
    gh.factory<_i32.ResetPasswordViewModel>(
        () => _i32.ResetPasswordViewModel(gh<_i31.ResetPasswordUseCase>()));
    gh.factory<_i33.SignupUserUseCase>(
        () => _i33.SignupUserUseCase(gh<_i24.AuthRepository>()));
    gh.factory<_i34.SignupViewModel>(
        () => _i34.SignupViewModel(gh<_i33.SignupUserUseCase>()));
    gh.factory<_i35.VerifyResetPasswordUseCase>(
        () => _i35.VerifyResetPasswordUseCase(gh<_i24.AuthRepository>()));
    gh.factory<_i36.OtpVerifyViewModel>(() => _i36.OtpVerifyViewModel(
          gh<_i35.VerifyResetPasswordUseCase>(),
          gh<_i26.ForgetPasswordUseCase>(),
        ));
    return this;
  }
}

class _$NetworkModule extends _i37.NetworkModule {}

class _$IsarModule extends _i38.IsarModule {}

class _$SharedPreferencesProvider extends _i39.SharedPreferencesProvider {}
