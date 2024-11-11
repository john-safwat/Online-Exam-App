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
import '../../data/api/dio_provider.dart' as _i63;
import '../../data/api/exams/exams_retrofit_client.dart' as _i7;
import '../../data/api/subjects/subjects_retrofit_client.dart' as _i15;
import '../../data/core/datasource_execution.dart' as _i4;
import '../../data/datasource/contract/auth_local_datasource.dart' as _i17;
import '../../data/datasource/contract/auth_remote_datasource.dart' as _i38;
import '../../data/datasource/contract/exams_local_datasouce.dart' as _i21;
import '../../data/datasource/contract/exams_remote_datasource.dart' as _i23;
import '../../data/datasource/contract/subjects_local_datasource.dart' as _i13;
import '../../data/datasource/contract/subjects_remote_datasource.dart' as _i32;
import '../../data/datasource/impl/auth_local_datasource_impl.dart' as _i18;
import '../../data/datasource/impl/auth_remote_datasource_impl.dart' as _i39;
import '../../data/datasource/impl/exams_local_datasource_impl.dart' as _i22;
import '../../data/datasource/impl/exams_remote_datasource_impl.dart' as _i24;
import '../../data/datasource/impl/subjects_local_datasource_impl.dart' as _i14;
import '../../data/datasource/impl/subjects_remote_datasource_impl.dart'
    as _i33;
import '../../data/local_database/exams/exams_local_database.dart' as _i20;
import '../../data/local_database/isar_module.dart' as _i64;
import '../../data/local_database/subjects/subjects_local_database.dart'
    as _i12;
import '../../data/local_database/users/users_local_database.dart' as _i16;
import '../../data/repository/auth_repository_impl.dart' as _i41;
import '../../data/repository/exams_repository_impl.dart' as _i26;
import '../../data/repository/subjects_repository_impl.dart' as _i35;
import '../../domain/repository/auth_repository.dart' as _i40;
import '../../domain/repository/exams_repository.dart' as _i25;
import '../../domain/repository/subjects_repository.dart' as _i34;
import '../../domain/use_case/change_password_use_case.dart' as _i42;
import '../../domain/use_case/delete_token_use_case.dart' as _i44;
import '../../domain/use_case/forget_password_use_case.dart' as _i47;
import '../../domain/use_case/get_exam_questions_use_case.dart' as _i27;
import '../../domain/use_case/get_exams_list_by_subject_use_case.dart' as _i28;
import '../../domain/use_case/get_exams_results_list_use_case.dart' as _i29;
import '../../domain/use_case/get_subject_list_use_case.dart' as _i49;
import '../../domain/use_case/get_user_info_use_case.dart' as _i50;
import '../../domain/use_case/login_user_use_case.dart' as _i51;
import '../../domain/use_case/reset_password_use_case.dart' as _i54;
import '../../domain/use_case/signup_user_use_case.dart' as _i56;
import '../../domain/use_case/submit_exam_use_case.dart' as _i36;
import '../../domain/use_case/update_user_info_use_case.dart' as _i58;
import '../../domain/use_case/verify_reset_code_use_case.dart' as _i59;
import '../../presentation/change_password/change_password_view_model.dart'
    as _i43;
import '../../presentation/exam/exam_view_model.dart' as _i45;
import '../../presentation/exams_list/exams_list_view_model.dart' as _i46;
import '../../presentation/forget_password/forget_password_view_model.dart'
    as _i48;
import '../../presentation/login/login_view_model.dart' as _i52;
import '../../presentation/main_layout/main_view_model.dart' as _i53;
import '../../presentation/main_layout/tabs/explore/explore_view_model.dart'
    as _i60;
import '../../presentation/main_layout/tabs/profile/profile_view_model.dart'
    as _i62;
import '../../presentation/main_layout/tabs/result/result_view_model.dart'
    as _i31;
import '../../presentation/otp_verify/otp_verify_view_model.dart' as _i61;
import '../../presentation/reset_password/reset_password_view_model.dart'
    as _i55;
import '../../presentation/signup/signup_view_model.dart' as _i57;
import '../providers/app_config_provider.dart' as _i3;
import '../providers/language_provider.dart' as _i30;
import '../utils/app_initializer.dart' as _i37;
import '../utils/logger_module.dart' as _i65;
import '../utils/shared_preferences_module.dart' as _i66;

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
    gh.singleton<_i3.AppConfigProvider>(() => _i3.AppConfigProvider());
    gh.singleton<_i4.DataSourceExecution>(() => _i4.DataSourceExecution());
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
              gh<_i4.DataSourceExecution>(),
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
    gh.singleton<_i20.ExamsLocalDatabase>(
        () => _i20.ExamsLocalDatabase(gh<_i8.Isar>()));
    gh.factory<_i21.ExamsLocalDatasource>(() => _i22.ExamsLocalDatasourceImpl(
          gh<_i20.ExamsLocalDatabase>(),
          gh<_i4.DataSourceExecution>(),
        ));
    gh.factory<_i23.ExamsRemoteDatasource>(() => _i24.ExamsRemoteDatasourceImpl(
          gh<_i7.ExamsRetrofitClient>(),
          gh<_i4.DataSourceExecution>(),
        ));
    gh.factory<_i25.ExamsRepository>(() => _i26.ExamsRepositoryImpl(
          gh<_i23.ExamsRemoteDatasource>(),
          gh<_i21.ExamsLocalDatasource>(),
        ));
    gh.factory<_i27.GetExamQuestionsUseCase>(
        () => _i27.GetExamQuestionsUseCase(gh<_i25.ExamsRepository>()));
    gh.factory<_i28.GetExamsListBySubjectUseCase>(
        () => _i28.GetExamsListBySubjectUseCase(gh<_i25.ExamsRepository>()));
    gh.factory<_i29.GetExamsResultsListUseCase>(
        () => _i29.GetExamsResultsListUseCase(gh<_i25.ExamsRepository>()));
    gh.singleton<_i30.LanguageProvider>(
        () => _i30.LanguageProvider(gh<_i11.SharedPreferences>()));
    gh.factory<_i31.ResultViewModel>(
        () => _i31.ResultViewModel(gh<_i29.GetExamsResultsListUseCase>()));
    gh.factory<_i32.SubjectsRemoteDatasource>(
        () => _i33.SubjectsRemoteDatasourceImpl(
              gh<_i15.SubjectsRetrofitClient>(),
              gh<_i4.DataSourceExecution>(),
            ));
    gh.factory<_i34.SubjectsRepository>(() => _i35.SubjectsRepositoryImpl(
          gh<_i32.SubjectsRemoteDatasource>(),
          gh<_i13.SubjectsLocalDatasource>(),
        ));
    gh.factory<_i36.SubmitExamUseCase>(
        () => _i36.SubmitExamUseCase(gh<_i25.ExamsRepository>()));
    gh.lazySingleton<_i37.AppInitializer>(() => _i37.AppInitializer(
          gh<_i30.LanguageProvider>(),
          gh<_i3.AppConfigProvider>(),
          gh<_i11.SharedPreferences>(),
        ));
    gh.factory<_i38.AuthRemoteDatasource>(() => _i39.AuthRemoteDatasourceImpl(
          gh<_i19.AuthRetrofitClient>(),
          gh<_i4.DataSourceExecution>(),
        ));
    gh.factory<_i40.AuthRepository>(() => _i41.AuthRepositoryImpl(
          gh<_i38.AuthRemoteDatasource>(),
          gh<_i17.AuthLocalDatasource>(),
        ));
    gh.factory<_i42.ChangePasswordUseCase>(
        () => _i42.ChangePasswordUseCase(gh<_i40.AuthRepository>()));
    gh.factory<_i43.ChangePasswordViewModel>(
        () => _i43.ChangePasswordViewModel(gh<_i42.ChangePasswordUseCase>()));
    gh.factory<_i44.DeleteTokenUseCase>(
        () => _i44.DeleteTokenUseCase(gh<_i40.AuthRepository>()));
    gh.factory<_i45.ExamViewModel>(() => _i45.ExamViewModel(
          gh<_i27.GetExamQuestionsUseCase>(),
          gh<_i36.SubmitExamUseCase>(),
        ));
    gh.factory<_i46.ExamsListViewModel>(
        () => _i46.ExamsListViewModel(gh<_i28.GetExamsListBySubjectUseCase>()));
    gh.factory<_i47.ForgetPasswordUseCase>(
        () => _i47.ForgetPasswordUseCase(gh<_i40.AuthRepository>()));
    gh.factory<_i48.ForgetPasswordViewModel>(
        () => _i48.ForgetPasswordViewModel(gh<_i47.ForgetPasswordUseCase>()));
    gh.factory<_i49.GetSubjectListUseCase>(
        () => _i49.GetSubjectListUseCase(gh<_i34.SubjectsRepository>()));
    gh.factory<_i50.GetUserInfoUseCase>(
        () => _i50.GetUserInfoUseCase(gh<_i40.AuthRepository>()));
    gh.factory<_i51.LoginUserUseCase>(
        () => _i51.LoginUserUseCase(gh<_i40.AuthRepository>()));
    gh.factory<_i52.LoginViewModel>(
        () => _i52.LoginViewModel(gh<_i51.LoginUserUseCase>()));
    gh.factory<_i53.MainViewModel>(
        () => _i53.MainViewModel(gh<_i44.DeleteTokenUseCase>()));
    gh.factory<_i54.ResetPasswordUseCase>(
        () => _i54.ResetPasswordUseCase(gh<_i40.AuthRepository>()));
    gh.factory<_i55.ResetPasswordViewModel>(
        () => _i55.ResetPasswordViewModel(gh<_i54.ResetPasswordUseCase>()));
    gh.factory<_i56.SignupUserUseCase>(
        () => _i56.SignupUserUseCase(gh<_i40.AuthRepository>()));
    gh.factory<_i57.SignupViewModel>(
        () => _i57.SignupViewModel(gh<_i56.SignupUserUseCase>()));
    gh.factory<_i58.UpdateUserInfoUseCase>(
        () => _i58.UpdateUserInfoUseCase(gh<_i40.AuthRepository>()));
    gh.factory<_i59.VerifyResetPasswordUseCase>(
        () => _i59.VerifyResetPasswordUseCase(gh<_i40.AuthRepository>()));
    gh.factory<_i60.ExploreViewModel>(
        () => _i60.ExploreViewModel(gh<_i49.GetSubjectListUseCase>()));
    gh.factory<_i61.OtpVerifyViewModel>(() => _i61.OtpVerifyViewModel(
          gh<_i59.VerifyResetPasswordUseCase>(),
          gh<_i47.ForgetPasswordUseCase>(),
        ));
    gh.factory<_i62.ProfileViewModel>(() => _i62.ProfileViewModel(
          gh<_i50.GetUserInfoUseCase>(),
          gh<_i58.UpdateUserInfoUseCase>(),
        ));
    return this;
  }
}

class _$NetworkModule extends _i63.NetworkModule {}

class _$IsarModule extends _i64.IsarModule {}

class _$LoggerModule extends _i65.LoggerModule {}

class _$SharedPreferencesModule extends _i66.SharedPreferencesModule {}
