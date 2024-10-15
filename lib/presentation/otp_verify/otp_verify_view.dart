import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/base/base_view.dart';
import 'package:online_exam_app/core/constants/routes.dart';
import 'package:online_exam_app/core/di/di.dart';
import 'package:online_exam_app/core/utils/app_dialogs.dart';
import 'package:online_exam_app/presentation/otp_verify/Widget/otp_form.dart';
import 'package:online_exam_app/presentation/otp_verify/otp_verify_contract.dart';
import 'package:online_exam_app/presentation/otp_verify/otp_verify_view_model.dart';

class OtpVerifyView extends StatefulWidget {
  const OtpVerifyView({super.key});

  @override
  State<OtpVerifyView> createState() => _OtpVerifyViewState();
}

class _OtpVerifyViewState extends BaseState<OtpVerifyView, OtpVerifyViewModel> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
      create: (context) => viewModel,
      child: BlocConsumer<OtpVerifyViewModel, OtpVerifyViewState>(
        listener: (context, state) {
          if (state is OtpVerifyLoadingState) {
            AppDialogs.showLoading(
                message: viewModel.locale!.loading, context: context);
          }
          if (state is OtpSuccessState) {
            AppDialogs.showSuccessDialog(
                message: viewModel.locale!.otpIsValid,
                context: context,
                posActionTitle: viewModel.locale!.ok,
                posAction: () {
                  Navigator.pushReplacementNamed(context, Routes.signupRoute);
                });
          }
          if (state is OtpFailState) {
            AppDialogs.showFailDialog(
              message: state.message,
              context: context,
              posActionTitle: viewModel.locale!.ok,
            );
          }
          if (state is HideLoadingState) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            title: Text(viewModel.locale!.forgetPassword),
          ),
          body: OtpForm(),
        ),
      ),
    );
  }

  @override
  OtpVerifyViewModel initViewModel() {
    return getIt<OtpVerifyViewModel>();
  }
}
