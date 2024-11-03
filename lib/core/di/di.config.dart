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
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i8;
import 'package:shared_preferences/shared_preferences.dart' as _i9;

import '../../data/api/auth/auth_retrofit_client.dart' as _i17;
import '../../data/api/dio_provider.dart' as _i47;
import '../../data/api/subjects/subjects_retrofit_client.dart' as _i13;
import '../../data/core/api_execution.dart' as _i3;
import '../../data/datasource/contract/auth_local_datasource.dart' as _i15;
import '../../data/datasource/contract/auth_remote_datasource.dart' as _i24;
import '../../data/datasource/contract/subjects_local_datasource.dart' as _i11;
import '../../data/datasource/contract/subjects_remote_datasource.dart' as _i19;
import '../../data/datasource/impl/auth_local_datasource_impl.dart' as _i16;
import '../../data/datasource/impl/auth_remote_datasource_impl.dart' as _i25;
import '../../data/datasource/impl/subjects_local_datasource_impl.dart' as _i12;
import '../../data/datasource/impl/subjects_remote_datasource_impl.dart'
    as _i20;
import '../../data/local_database/isar_module.dart' as _i48;
import '../../data/local_database/subjects/subjects_local_database.dart'
    as _i10;
import '../../data/local_database/users/users_local_database.dart' as _i14;
import '../../data/repository/auth_repository_impl.dart' as _i27;
import '../../data/repository/subjects_repository_impl.dart' as _i22;
import '../../domain/repository/auth_repository.dart' as _i26;
import '../../domain/repository/subjects_repository.dart' as _i21;
import '../../domain/use_case/change_password_use_case.dart' as _i28;
import '../../domain/use_case/delete_token_use_case.dart' as _i30;
import '../../domain/use_case/forget_password_use_case.dart' as _i31;
import '../../domain/use_case/get_subject_list_use_case.dart' as _i33;
import '../../domain/use_case/get_user_info_use_case.dart' as _i34;
import '../../domain/use_case/login_user_use_case.dart' as _i35;
import '../../domain/use_case/reset_password_use_case.dart' as _i38;
import '../../domain/use_case/signup_user_use_case.dart' as _i40;
import '../../domain/use_case/update_user_info_use_case.dart' as _i42;
import '../../domain/use_case/verify_reset_code_use_case.dart' as _i43;
import '../../presentation/change_password/change_password_view_model.dart'
    as _i29;
import '../../presentation/forget_password/forget_password_view_model.dart'
    as _i32;
import '../../presentation/login/login_view_model.dart' as _i36;
import '../../presentation/main_layout/main_view_model.dart' as _i37;
import '../../presentation/main_layout/tabs/explore/explore_view_model.dart'
    as _i44;
import '../../presentation/main_layout/tabs/profile/profile_view_model.dart'
    as _i46;
import '../../presentation/otp_verify/otp_verify_view_model.dart' as _i45;
import '../../presentation/reset_password/reset_password_view_model.dart'
    as _i39;
import '../../presentation/signup/signup_view_model.dart' as _i41;
import '../providers/app_config_provider.dart' as _i4;
import '../providers/language_provider.dart' as _i18;
import '../utils/app_initializer.dart' as _i23;
import '../utils/shared_prefrences_provider.dart' as _i49;

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
      () => isarModule.providerIsar,
      preResolve: true,
    );
    gh.factory<_i8.PrettyDioLogger>(() => networkModule.providerInterceptor());
    await gh.factoryAsync<_i9.SharedPreferences>(
      () => sharedPreferencesProvider.prefs,
      preResolve: true,
    );
    gh.singleton<_i10.SubjectsLocalDatabase>(
        () => _i10.SubjectsLocalDatabase(gh<_i7.Isar>()));
    gh.factory<_i11.SubjectsLocalDatasource>(
        () => _i12.SubjectsLocalDatasourceImpl(
              gh<_i10.SubjectsLocalDatabase>(),
              gh<_i3.ApiExecution>(),
              gh<_i9.SharedPreferences>(),
            ));
    gh.singleton<_i13.SubjectsRetrofitClient>(
        () => _i13.SubjectsRetrofitClient(gh<_i5.Dio>()));
    gh.singleton<_i14.UsersLocalDatabase>(
        () => _i14.UsersLocalDatabase(gh<_i7.Isar>()));
    gh.factory<_i15.AuthLocalDatasource>(() => _i16.AuthLocalDatasourceImpl(
          gh<_i9.SharedPreferences>(),
          gh<_i14.UsersLocalDatabase>(),
        ));
    gh.singleton<_i17.AuthRetrofitClient>(
        () => _i17.AuthRetrofitClient(gh<_i5.Dio>()));
    gh.singleton<_i18.LanguageProvider>(
        () => _i18.LanguageProvider(gh<_i9.SharedPreferences>()));
    gh.factory<_i19.SubjectsRemoteDatasource>(
        () => _i20.SubjectsRemoteDatasourceImpl(
              gh<_i13.SubjectsRetrofitClient>(),
              gh<_i3.ApiExecution>(),
            ));
    gh.factory<_i21.SubjectsRepository>(() => _i22.SubjectsRepositoryImpl(
          gh<_i19.SubjectsRemoteDatasource>(),
          gh<_i11.SubjectsLocalDatasource>(),
        ));
    gh.lazySingleton<_i23.AppInitializer>(() => _i23.AppInitializer(
          gh<_i18.LanguageProvider>(),
          gh<_i4.AppConfigProvider>(),
          gh<_i9.SharedPreferences>(),
        ));
    gh.factory<_i24.AuthRemoteDatasource>(() => _i25.AuthRemoteDatasourceImpl(
          gh<_i17.AuthRetrofitClient>(),
          gh<_i3.ApiExecution>(),
        ));
    gh.factory<_i26.AuthRepository>(() => _i27.AuthRepositoryImpl(
          gh<_i24.AuthRemoteDatasource>(),
          gh<_i15.AuthLocalDatasource>(),
        ));
    gh.factory<_i28.ChangePasswordUseCase>(
        () => _i28.ChangePasswordUseCase(gh<_i26.AuthRepository>()));
    gh.factory<_i29.ChangePasswordViewModel>(
        () => _i29.ChangePasswordViewModel(gh<_i28.ChangePasswordUseCase>()));
    gh.factory<_i30.DeleteTokenUseCase>(
        () => _i30.DeleteTokenUseCase(gh<_i26.AuthRepository>()));
    gh.factory<_i31.ForgetPasswordUseCase>(
        () => _i31.ForgetPasswordUseCase(gh<_i26.AuthRepository>()));
    gh.factory<_i32.ForgetPasswordViewModel>(
        () => _i32.ForgetPasswordViewModel(gh<_i31.ForgetPasswordUseCase>()));
    gh.factory<_i33.GetSubjectListUseCase>(
        () => _i33.GetSubjectListUseCase(gh<_i21.SubjectsRepository>()));
    gh.factory<_i34.GetUserInfoUseCase>(
        () => _i34.GetUserInfoUseCase(gh<_i26.AuthRepository>()));
    gh.factory<_i35.LoginUserUseCase>(
        () => _i35.LoginUserUseCase(gh<_i26.AuthRepository>()));
    gh.factory<_i36.LoginViewModel>(
        () => _i36.LoginViewModel(gh<_i35.LoginUserUseCase>()));
    gh.singleton<_i37.MainViewModel>(
        () => _i37.MainViewModel(gh<_i30.DeleteTokenUseCase>()));
    gh.factory<_i38.ResetPasswordUseCase>(
        () => _i38.ResetPasswordUseCase(gh<_i26.AuthRepository>()));
    gh.factory<_i39.ResetPasswordViewModel>(
        () => _i39.ResetPasswordViewModel(gh<_i38.ResetPasswordUseCase>()));
    gh.factory<_i40.SignupUserUseCase>(
        () => _i40.SignupUserUseCase(gh<_i26.AuthRepository>()));
    gh.factory<_i41.SignupViewModel>(
        () => _i41.SignupViewModel(gh<_i40.SignupUserUseCase>()));
    gh.factory<_i42.UpdateUserInfoUseCase>(
        () => _i42.UpdateUserInfoUseCase(gh<_i26.AuthRepository>()));
    gh.factory<_i43.VerifyResetPasswordUseCase>(
        () => _i43.VerifyResetPasswordUseCase(gh<_i26.AuthRepository>()));
    gh.factory<_i44.ExploreViewModel>(
        () => _i44.ExploreViewModel(gh<_i33.GetSubjectListUseCase>()));
    gh.factory<_i45.OtpVerifyViewModel>(() => _i45.OtpVerifyViewModel(
          gh<_i43.VerifyResetPasswordUseCase>(),
          gh<_i31.ForgetPasswordUseCase>(),
        ));
    gh.factory<_i46.ProfileViewModel>(() => _i46.ProfileViewModel(
          gh<_i34.GetUserInfoUseCase>(),
          gh<_i42.UpdateUserInfoUseCase>(),
          gh<_i37.MainViewModel>(),
        ));
    return this;
  }
}

class _$NetworkModule extends _i47.NetworkModule {}

class _$IsarModule extends _i48.IsarModule {}

class _$SharedPreferencesProvider extends _i49.SharedPreferencesProvider {}
