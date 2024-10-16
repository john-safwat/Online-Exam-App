import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:online_exam_app/core/providers/language_provider.dart';
import 'package:online_exam_app/core/utils/app_initializer.dart';
import 'package:online_exam_app/presentation/forget_password/forget_password_view.dart';
import 'package:online_exam_app/presentation/login/login_view.dart';
import 'package:online_exam_app/presentation/main_layout/main_view.dart';
import 'package:online_exam_app/presentation/otp_verify/otp_verify_view.dart';
import 'package:online_exam_app/presentation/reset_password/reset_password_view.dart';
import 'package:online_exam_app/presentation/signup/signup_view.dart';
import 'package:provider/provider.dart';

import 'core/constants/routes.dart';
import 'core/di/di.dart';
import 'core/theme/app_theme.dart';

void main() async{
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  configureDependencies();
  getIt<AppInitializer>().initialLocale();
  FlutterNativeSplash.remove();
  runApp(ChangeNotifierProvider(
      create: (context) => getIt<LanguageProvider>(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var localProvider = Provider.of<LanguageProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(localProvider.getLocal()),
      routes: {
        Routes.loginRoute: (context) => const LoginView(),
        Routes.homeRoute: (context) => const MainView(),
        Routes.signupRoute: (context) => const SignupView(),
        Routes.forgetPasswordRoute: (context) => const ForgetPasswordView(),
        Routes.otpVerifyRoute: (context) => const OtpVerifyView(),
        Routes.resetPasswordViewRoute: (context) => const ResetPasswordView()
      },
      initialRoute: Routes.loginRoute,
    );
  }
}
