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
import '../../data/api/dio_provider.dart' as _i57;
import '../../data/api/exams/exams_retrofit_client.dart' as _i7;
import '../../data/api/subjects/subjects_retrofit_client.dart' as _i15;
import '../../data/core/api_execution.dart' as _i3;
import '../../data/datasource/contract/auth_local_datasource.dart' as _i17;
import '../../data/datasource/contract/auth_remote_datasource.dart' as _i32;
import '../../data/datasource/contract/exams_remote_datasource.dart' as _i20;
import '../../data/datasource/contract/subjects_local_datasource.dart' as _i13;
import '../../data/datasource/contract/subjects_remote_datasource.dart' as _i27;
import '../../data/datasource/impl/auth_local_datasource_impl.dart' as _i18;
import '../../data/datasource/impl/auth_remote_datasource_impl.dart' as _i33;
import '../../data/datasource/impl/exams_remote_datasource_impl.dart' as _i21;
import '../../data/datasource/impl/subjects_local_datasource_impl.dart' as _i14;
import '../../data/datasource/impl/subjects_remote_datasource_impl.dart'
    as _i28;
import '../../data/local_database/isar_module.dart' as _i58;
import '../../data/local_database/subjects/subjects_local_database.dart'
    as _i12;
import '../../data/local_database/users/users_local_database.dart' as _i16;
import '../../data/repository/auth_repository_impl.dart' as _i35;
import '../../data/repository/exams_repository_impl.dart' as _i23;
import '../../data/repository/subjects_repository_impl.dart' as _i30;
import '../../domain/repository/auth_repository.dart' as _i34;
import '../../domain/repository/exams_repository.dart' as _i22;
import '../../domain/repository/subjects_repository.dart' as _i29;
import '../../domain/use_case/change_password_use_case.dart' as _i36;
import '../../domain/use_case/delete_token_use_case.dart' as _i38;
import '../../domain/use_case/forget_password_use_case.dart' as _i41;
import '../../domain/use_case/get_exam_questions_use_case.dart' as _i24;
import '../../domain/use_case/get_exams_list_by_subject_use_case.dart' as _i25;
import '../../domain/use_case/get_subject_list_use_case.dart' as _i43;
import '../../domain/use_case/get_user_info_use_case.dart' as _i44;
import '../../domain/use_case/login_user_use_case.dart' as _i45;
import '../../domain/use_case/reset_password_use_case.dart' as _i48;
import '../../domain/use_case/signup_user_use_case.dart' as _i50;
import '../../domain/use_case/update_user_info_use_case.dart' as _i52;
import '../../domain/use_case/verify_reset_code_use_case.dart' as _i53;
import '../../presentation/change_password/change_password_view_model.dart'
    as _i37;
import '../../presentation/exam/exam_view_model.dart' as _i39;
import '../../presentation/exams_list/exams_list_view_model.dart' as _i40;
import '../../presentation/forget_password/forget_password_view_model.dart'
    as _i42;
import '../../presentation/login/login_view_model.dart' as _i46;
import '../../presentation/main_layout/main_view_model.dart' as _i47;
import '../../presentation/main_layout/tabs/explore/explore_view_model.dart'
    as _i54;
import '../../presentation/main_layout/tabs/profile/profile_view_model.dart'
    as _i56;
import '../../presentation/otp_verify/otp_verify_view_model.dart' as _i55;
import '../../presentation/reset_password/reset_password_view_model.dart'
    as _i49;
import '../../presentation/signup/signup_view_model.dart' as _i51;
import '../providers/app_config_provider.dart' as _i4;
import '../providers/language_provider.dart' as _i26;
import '../utils/app_initializer.dart' as _i31;
import '../utils/logger_module.dart' as _i59;
import '../utils/shared_preferences_module.dart' as _i60;

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
    gh.factory<_i24.GetExamQuestionsUseCase>(
        () => _i24.GetExamQuestionsUseCase(gh<_i22.ExamsRepository>()));
    gh.factory<_i25.GetExamsListBySubjectUseCase>(
        () => _i25.GetExamsListBySubjectUseCase(gh<_i22.ExamsRepository>()));
    gh.singleton<_i26.LanguageProvider>(
        () => _i26.LanguageProvider(gh<_i11.SharedPreferences>()));
    gh.factory<_i27.SubjectsRemoteDatasource>(
        () => _i28.SubjectsRemoteDatasourceImpl(
              gh<_i15.SubjectsRetrofitClient>(),
              gh<_i3.ApiExecution>(),
            ));
    gh.factory<_i29.SubjectsRepository>(() => _i30.SubjectsRepositoryImpl(
          gh<_i27.SubjectsRemoteDatasource>(),
          gh<_i13.SubjectsLocalDatasource>(),
        ));
    gh.lazySingleton<_i31.AppInitializer>(() => _i31.AppInitializer(
          gh<_i26.LanguageProvider>(),
          gh<_i4.AppConfigProvider>(),
          gh<_i11.SharedPreferences>(),
        ));
    gh.factory<_i32.AuthRemoteDatasource>(() => _i33.AuthRemoteDatasourceImpl(
          gh<_i19.AuthRetrofitClient>(),
          gh<_i3.ApiExecution>(),
        ));
    gh.factory<_i34.AuthRepository>(() => _i35.AuthRepositoryImpl(
          gh<_i32.AuthRemoteDatasource>(),
          gh<_i17.AuthLocalDatasource>(),
        ));
    gh.factory<_i36.ChangePasswordUseCase>(
        () => _i36.ChangePasswordUseCase(gh<_i34.AuthRepository>()));
    gh.factory<_i37.ChangePasswordViewModel>(
        () => _i37.ChangePasswordViewModel(gh<_i36.ChangePasswordUseCase>()));
    gh.factory<_i38.DeleteTokenUseCase>(
        () => _i38.DeleteTokenUseCase(gh<_i34.AuthRepository>()));
    gh.factory<_i39.ExamViewModel>(
        () => _i39.ExamViewModel(gh<_i24.GetExamQuestionsUseCase>()));
    gh.factory<_i40.ExamsListViewModel>(
        () => _i40.ExamsListViewModel(gh<_i25.GetExamsListBySubjectUseCase>()));
    gh.factory<_i41.ForgetPasswordUseCase>(
        () => _i41.ForgetPasswordUseCase(gh<_i34.AuthRepository>()));
    gh.factory<_i42.ForgetPasswordViewModel>(
        () => _i42.ForgetPasswordViewModel(gh<_i41.ForgetPasswordUseCase>()));
    gh.factory<_i43.GetSubjectListUseCase>(
        () => _i43.GetSubjectListUseCase(gh<_i29.SubjectsRepository>()));
    gh.factory<_i44.GetUserInfoUseCase>(
        () => _i44.GetUserInfoUseCase(gh<_i34.AuthRepository>()));
    gh.factory<_i45.LoginUserUseCase>(
        () => _i45.LoginUserUseCase(gh<_i34.AuthRepository>()));
    gh.factory<_i46.LoginViewModel>(
        () => _i46.LoginViewModel(gh<_i45.LoginUserUseCase>()));
    gh.factory<_i47.MainViewModel>(
        () => _i47.MainViewModel(gh<_i38.DeleteTokenUseCase>()));
    gh.factory<_i48.ResetPasswordUseCase>(
        () => _i48.ResetPasswordUseCase(gh<_i34.AuthRepository>()));
    gh.factory<_i49.ResetPasswordViewModel>(
        () => _i49.ResetPasswordViewModel(gh<_i48.ResetPasswordUseCase>()));
    gh.factory<_i50.SignupUserUseCase>(
        () => _i50.SignupUserUseCase(gh<_i34.AuthRepository>()));
    gh.factory<_i51.SignupViewModel>(
        () => _i51.SignupViewModel(gh<_i50.SignupUserUseCase>()));
    gh.factory<_i52.UpdateUserInfoUseCase>(
        () => _i52.UpdateUserInfoUseCase(gh<_i34.AuthRepository>()));
    gh.factory<_i53.VerifyResetPasswordUseCase>(
        () => _i53.VerifyResetPasswordUseCase(gh<_i34.AuthRepository>()));
    gh.factory<_i54.ExploreViewModel>(
        () => _i54.ExploreViewModel(gh<_i43.GetSubjectListUseCase>()));
    gh.factory<_i55.OtpVerifyViewModel>(() => _i55.OtpVerifyViewModel(
          gh<_i53.VerifyResetPasswordUseCase>(),
          gh<_i41.ForgetPasswordUseCase>(),
        ));
    gh.factory<_i56.ProfileViewModel>(() => _i56.ProfileViewModel(
          gh<_i44.GetUserInfoUseCase>(),
          gh<_i52.UpdateUserInfoUseCase>(),
        ));
    return this;
  }
}

class _$NetworkModule extends _i57.NetworkModule {}

class _$IsarModule extends _i58.IsarModule {}

class _$LoggerModule extends _i59.LoggerModule {}

class _$SharedPreferencesModule extends _i60.SharedPreferencesModule {}
