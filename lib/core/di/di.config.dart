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
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i528;

import '../../data/api/Auth/auth_retrofit_client.dart' as _i294;
import '../../data/api/dio_provider.dart' as _i304;
import '../../data/core/api_execution.dart' as _i94;
import '../../data/datasource/contract/auth_remote_datasource.dart' as _i912;
import '../../data/datasource/impl/auth_remote_datasource_impl.dart' as _i939;
import '../../data/repository/auth_repository_impl.dart' as _i581;
import '../../domain/repository/auth_repository.dart' as _i614;
import '../../domain/use_case/forget_password_use_case.dart' as _i742;
import '../../domain/use_case/login_user_use_case.dart' as _i678;
import '../../domain/use_case/signup_user_use_case.dart' as _i205;
import '../../domain/use_case/verify_reset_code_use_case.dart' as _i499;
import '../../presentation/forget_password/forget_password_view_model.dart'
    as _i596;
import '../../presentation/login/login_view_model.dart' as _i867;
import '../../presentation/main_layout/main_view_model.dart' as _i911;
import '../../presentation/otp_verify/otp_verify_view_model.dart' as _i950;
import '../../presentation/signup/signup_view_model.dart' as _i679;
import '../providers/language_provider.dart' as _i822;
import '../utils/app_initializer.dart' as _i348;

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
    gh.factory<_i528.PrettyDioLogger>(
        () => networkModule.providerInterceptor());
    gh.factory<_i911.MainViewModel>(() => _i911.MainViewModel());
    gh.singleton<_i822.LanguageProvider>(() => _i822.LanguageProvider());
    gh.singleton<_i94.ApiExecution>(() => _i94.ApiExecution());
    gh.lazySingleton<_i361.Dio>(() => networkModule.provideDio());
    gh.singleton<_i294.AuthRetrofitClient>(
        () => _i294.AuthRetrofitClient(gh<_i361.Dio>()));
    gh.singleton<_i348.AppInitializer>(
        () => _i348.AppInitializer(gh<_i822.LanguageProvider>()));
    gh.factory<_i912.AuthRemoteDatasource>(() => _i939.AuthRemoteDatasourceImpl(
          gh<_i294.AuthRetrofitClient>(),
          gh<_i94.ApiExecution>(),
        ));
    gh.factory<_i614.AuthRepository>(
        () => _i581.AuthRepositoryImpl(gh<_i912.AuthRemoteDatasource>()));
    gh.factory<_i742.ForgetPasswordUseCase>(
        () => _i742.ForgetPasswordUseCase(gh<_i614.AuthRepository>()));
    gh.factory<_i205.SignupUserUseCase>(
        () => _i205.SignupUserUseCase(gh<_i614.AuthRepository>()));
    gh.factory<_i679.SignupViewModel>(
        () => _i679.SignupViewModel(gh<_i205.SignupUserUseCase>()));
    gh.factory<_i678.LoginUserUseCase>(
        () => _i678.LoginUserUseCase(gh<_i614.AuthRepository>()));
    gh.factory<_i499.VerifyResetPasswordUseCase>(
        () => _i499.VerifyResetPasswordUseCase(gh<_i614.AuthRepository>()));
    gh.factory<_i596.ForgetPasswordViewModel>(
        () => _i596.ForgetPasswordViewModel(gh<_i742.ForgetPasswordUseCase>()));
    gh.factory<_i950.OtpVerifyViewModel>(
        () => _i950.OtpVerifyViewModel(gh<_i499.VerifyResetPasswordUseCase>()));
    gh.factory<_i867.LoginViewModel>(
        () => _i867.LoginViewModel(gh<_i678.LoginUserUseCase>()));
    return this;
  }
}

class _$NetworkModule extends _i304.NetworkModule {}
