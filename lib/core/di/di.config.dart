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
import 'package:isar/isar.dart' as _i8;
import 'package:logger/logger.dart' as _i9;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i10;
import 'package:shared_preferences/shared_preferences.dart' as _i11;

import '../../data/api/auth/auth_retrofit_client.dart' as _i19;
import '../../data/api/dio_provider.dart' as _i55;
import '../../data/api/exams/exams_retrofit_client.dart' as _i7;
import '../../data/api/subjects/subjects_retrofit_client.dart' as _i15;
import '../../data/core/api_execution.dart' as _i3;
import '../../data/datasource/contract/auth_local_datasource.dart' as _i17;
import '../../data/datasource/contract/auth_remote_datasource.dart' as _i31;
import '../../data/datasource/contract/exams_remote_datasource.dart' as _i20;
import '../../data/datasource/contract/subjects_local_datasource.dart' as _i13;
import '../../data/datasource/contract/subjects_remote_datasource.dart' as _i26;
import '../../data/datasource/impl/auth_local_datasource_impl.dart' as _i18;
import '../../data/datasource/impl/auth_remote_datasource_impl.dart' as _i32;
import '../../data/datasource/impl/exams_remote_datasource_impl.dart' as _i21;
import '../../data/datasource/impl/subjects_local_datasource_impl.dart' as _i14;
import '../../data/datasource/impl/subjects_remote_datasource_impl.dart'
    as _i27;
import '../../data/local_database/isar_module.dart' as _i56;
import '../../data/local_database/subjects/subjects_local_database.dart'
    as _i12;
import '../../data/local_database/users/users_local_database.dart' as _i16;
import '../../data/repository/auth_repository_impl.dart' as _i34;
import '../../data/repository/exams_repository_impl.dart' as _i23;
import '../../data/repository/subjects_repository_impl.dart' as _i29;
import '../../domain/repository/auth_repository.dart' as _i33;
import '../../domain/repository/exams_repository.dart' as _i22;
import '../../domain/repository/subjects_repository.dart' as _i28;
import '../../domain/use_case/change_password_use_case.dart' as _i35;
import '../../domain/use_case/delete_token_use_case.dart' as _i37;
import '../../domain/use_case/forget_password_use_case.dart' as _i39;
import '../../domain/use_case/get_exams_list_by_subject_use_case.dart' as _i24;
import '../../domain/use_case/get_subject_list_use_case.dart' as _i41;
import '../../domain/use_case/get_user_info_use_case.dart' as _i42;
import '../../domain/use_case/login_user_use_case.dart' as _i43;
import '../../domain/use_case/reset_password_use_case.dart' as _i46;
import '../../domain/use_case/signup_user_use_case.dart' as _i48;
import '../../domain/use_case/update_user_info_use_case.dart' as _i50;
import '../../domain/use_case/verify_reset_code_use_case.dart' as _i51;
import '../../presentation/change_password/change_password_view_model.dart'
    as _i36;
import '../../presentation/exams_list/exams_list_view_model.dart' as _i38;
import '../../presentation/forget_password/forget_password_view_model.dart'
    as _i40;
import '../../presentation/login/login_view_model.dart' as _i44;
import '../../presentation/main_layout/main_view_model.dart' as _i45;
import '../../presentation/main_layout/tabs/explore/explore_view_model.dart'
    as _i52;
import '../../presentation/main_layout/tabs/profile/profile_view_model.dart'
    as _i54;
import '../../presentation/otp_verify/otp_verify_view_model.dart' as _i53;
import '../../presentation/reset_password/reset_password_view_model.dart'
    as _i47;
import '../../presentation/signup/signup_view_model.dart' as _i49;
import '../providers/app_config_provider.dart' as _i4;
import '../providers/language_provider.dart' as _i25;
import '../utils/app_initializer.dart' as _i30;
import '../utils/logger_module.dart' as _i57;
import '../utils/shared_preferences_module.dart' as _i58;

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
    final loggerModule = _$LoggerModule();
    final sharedPreferencesModule = _$SharedPreferencesModule();
    gh.singleton<_i3.ApiExecution>(() => _i3.ApiExecution());
    gh.singleton<_i4.AppConfigProvider>(() => _i4.AppConfigProvider());
    gh.lazySingleton<_i5.Dio>(() => networkModule.provideDio());
    await gh.factoryAsync<_i6.Directory>(
      () => isarModule.providerDirectory,
      preResolve: true,
    );
    gh.singleton<_i7.ExamsRetrofitClient>(
        () => _i7.ExamsRetrofitClient(gh<_i5.Dio>()));
    await gh.factoryAsync<_i8.Isar>(
      () => isarModule.providerIsar,
      preResolve: true,
    );
    gh.lazySingleton<_i9.Logger>(() => loggerModule.loggerProvider);
    gh.lazySingleton<_i10.PrettyDioLogger>(
        () => networkModule.providerInterceptor());
    gh.lazySingleton<_i9.PrettyPrinter>(() => loggerModule.prettyPrinter);
    await gh.factoryAsync<_i11.SharedPreferences>(
      () => sharedPreferencesModule.prefs,
      preResolve: true,
    );
    gh.singleton<_i12.SubjectsLocalDatabase>(
        () => _i12.SubjectsLocalDatabase(gh<_i8.Isar>()));
    gh.factory<_i13.SubjectsLocalDatasource>(
        () => _i14.SubjectsLocalDatasourceImpl(
              gh<_i12.SubjectsLocalDatabase>(),
              gh<_i3.ApiExecution>(),
              gh<_i11.SharedPreferences>(),
            ));
    gh.singleton<_i15.SubjectsRetrofitClient>(
        () => _i15.SubjectsRetrofitClient(gh<_i5.Dio>()));
    gh.singleton<_i16.UsersLocalDatabase>(
        () => _i16.UsersLocalDatabase(gh<_i8.Isar>()));
    gh.factory<_i17.AuthLocalDatasource>(() => _i18.AuthLocalDatasourceImpl(
          gh<_i11.SharedPreferences>(),
          gh<_i16.UsersLocalDatabase>(),
        ));
    gh.singleton<_i19.AuthRetrofitClient>(
        () => _i19.AuthRetrofitClient(gh<_i5.Dio>()));
    gh.factory<_i20.ExamsRemoteDatasource>(() => _i21.ExamsRemoteDatasourceImpl(
          gh<_i7.ExamsRetrofitClient>(),
          gh<_i3.ApiExecution>(),
        ));
    gh.factory<_i22.ExamsRepository>(
        () => _i23.ExamsRepositoryImpl(gh<_i20.ExamsRemoteDatasource>()));
    gh.factory<_i24.GetExamsListBySubjectUseCase>(
        () => _i24.GetExamsListBySubjectUseCase(gh<_i22.ExamsRepository>()));
    gh.singleton<_i25.LanguageProvider>(
        () => _i25.LanguageProvider(gh<_i11.SharedPreferences>()));
    gh.factory<_i26.SubjectsRemoteDatasource>(
        () => _i27.SubjectsRemoteDatasourceImpl(
              gh<_i15.SubjectsRetrofitClient>(),
              gh<_i3.ApiExecution>(),
            ));
    gh.factory<_i28.SubjectsRepository>(() => _i29.SubjectsRepositoryImpl(
          gh<_i26.SubjectsRemoteDatasource>(),
          gh<_i13.SubjectsLocalDatasource>(),
        ));
    gh.lazySingleton<_i30.AppInitializer>(() => _i30.AppInitializer(
          gh<_i25.LanguageProvider>(),
          gh<_i4.AppConfigProvider>(),
          gh<_i11.SharedPreferences>(),
        ));
    gh.factory<_i31.AuthRemoteDatasource>(() => _i32.AuthRemoteDatasourceImpl(
          gh<_i19.AuthRetrofitClient>(),
          gh<_i3.ApiExecution>(),
        ));
    gh.factory<_i33.AuthRepository>(() => _i34.AuthRepositoryImpl(
          gh<_i31.AuthRemoteDatasource>(),
          gh<_i17.AuthLocalDatasource>(),
        ));
    gh.factory<_i35.ChangePasswordUseCase>(
        () => _i35.ChangePasswordUseCase(gh<_i33.AuthRepository>()));
    gh.factory<_i36.ChangePasswordViewModel>(
        () => _i36.ChangePasswordViewModel(gh<_i35.ChangePasswordUseCase>()));
    gh.factory<_i37.DeleteTokenUseCase>(
        () => _i37.DeleteTokenUseCase(gh<_i33.AuthRepository>()));
    gh.factory<_i38.ExamsListViewModel>(
        () => _i38.ExamsListViewModel(gh<_i24.GetExamsListBySubjectUseCase>()));
    gh.factory<_i39.ForgetPasswordUseCase>(
        () => _i39.ForgetPasswordUseCase(gh<_i33.AuthRepository>()));
    gh.factory<_i40.ForgetPasswordViewModel>(
        () => _i40.ForgetPasswordViewModel(gh<_i39.ForgetPasswordUseCase>()));
    gh.factory<_i41.GetSubjectListUseCase>(
        () => _i41.GetSubjectListUseCase(gh<_i28.SubjectsRepository>()));
    gh.factory<_i42.GetUserInfoUseCase>(
        () => _i42.GetUserInfoUseCase(gh<_i33.AuthRepository>()));
    gh.factory<_i43.LoginUserUseCase>(
        () => _i43.LoginUserUseCase(gh<_i33.AuthRepository>()));
    gh.factory<_i44.LoginViewModel>(
        () => _i44.LoginViewModel(gh<_i43.LoginUserUseCase>()));
    gh.factory<_i45.MainViewModel>(
        () => _i45.MainViewModel(gh<_i37.DeleteTokenUseCase>()));
    gh.factory<_i46.ResetPasswordUseCase>(
        () => _i46.ResetPasswordUseCase(gh<_i33.AuthRepository>()));
    gh.factory<_i47.ResetPasswordViewModel>(
        () => _i47.ResetPasswordViewModel(gh<_i46.ResetPasswordUseCase>()));
    gh.factory<_i48.SignupUserUseCase>(
        () => _i48.SignupUserUseCase(gh<_i33.AuthRepository>()));
    gh.factory<_i49.SignupViewModel>(
        () => _i49.SignupViewModel(gh<_i48.SignupUserUseCase>()));
    gh.factory<_i50.UpdateUserInfoUseCase>(
        () => _i50.UpdateUserInfoUseCase(gh<_i33.AuthRepository>()));
    gh.factory<_i51.VerifyResetPasswordUseCase>(
        () => _i51.VerifyResetPasswordUseCase(gh<_i33.AuthRepository>()));
    gh.factory<_i52.ExploreViewModel>(
        () => _i52.ExploreViewModel(gh<_i41.GetSubjectListUseCase>()));
    gh.factory<_i53.OtpVerifyViewModel>(() => _i53.OtpVerifyViewModel(
          gh<_i51.VerifyResetPasswordUseCase>(),
          gh<_i39.ForgetPasswordUseCase>(),
        ));
    gh.factory<_i54.ProfileViewModel>(() => _i54.ProfileViewModel(
          gh<_i42.GetUserInfoUseCase>(),
          gh<_i50.UpdateUserInfoUseCase>(),
        ));
    return this;
  }
}

class _$NetworkModule extends _i55.NetworkModule {}

class _$IsarModule extends _i56.IsarModule {}

class _$LoggerModule extends _i57.LoggerModule {}

class _$SharedPreferencesModule extends _i58.SharedPreferencesModule {}
