import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/assets/app_colors.dart';
import 'package:online_exam_app/core/theme/app_theme.dart';
import 'package:online_exam_app/presentation/otp_verify/otp_verify_contract.dart';
import 'package:online_exam_app/presentation/otp_verify/otp_verify_view_model.dart';
import 'package:pinput/pinput.dart';

class OtpForm extends StatelessWidget {
  late OtpVerifyViewModel viewModel;
  final defaultPinTheme = PinTheme(
    width: 65,
    height: 65,
    textStyle: const TextStyle(fontSize: 20, color: Colors.black),
    decoration: BoxDecoration(
      color: Color(AppColors.lightGreen.value),
      border: Border.all(color: Color(AppColors.black.value)),
      borderRadius: BorderRadius.circular(25),
    ),
  );

  OtpForm({super.key});

  @override
  Widget build(BuildContext context) {
    viewModel = BlocProvider.of<OtpVerifyViewModel>(context);
    return ListView(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              viewModel.locale!.emailVerification,
              style:
                  AppTheme.appTheme.textTheme.bodyLarge!.copyWith(fontSize: 18),
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              viewModel.locale!.pleaseEnterYourCodeThatSendToYourEmailAddress,
              style:
                  AppTheme.appTheme.textTheme.bodyLarge!.copyWith(fontSize: 14),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Pinput(
          controller: viewModel.otpController,
          length: 6,
          defaultPinTheme: defaultPinTheme,
          focusedPinTheme: defaultPinTheme.copyWith(
            decoration: defaultPinTheme.decoration!
                .copyWith(border: Border.all(color: AppColors.green)),
          ),
          onCompleted: (value) =>
              viewModel.doIntent(OnCompleteCodeVerifyAction()),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              viewModel.locale!.didNotReceiveCode,
              style:
                  AppTheme.appTheme.textTheme.bodyLarge!.copyWith(fontSize: 14),
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  viewModel.locale!.resend,
                  style: AppTheme.appTheme.textTheme.bodyLarge!
                      .copyWith(fontSize: 14),
                ))
          ],
        ),
      ],
    );
  }
}
