import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/assets/app_colors.dart';
import 'package:online_exam_app/presentation/otp_verify/Widget/otp_form_field.dart';
import 'package:online_exam_app/presentation/otp_verify/otp_verify_contract.dart';
import 'package:online_exam_app/presentation/otp_verify/otp_verify_view_model.dart';

class OtpForm extends StatelessWidget {
  OtpForm({super.key});

  @override
  Widget build(BuildContext context) {
    var viewModel = BlocProvider.of<OtpVerifyViewModel>(context);
    return ListView(
      padding: const EdgeInsets.all(14),
      children: [
        Text(
          viewModel.locale!.emailVerification,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 16),
        Text(
          viewModel.locale!.pleaseEnterYourCodeThatSendToYourEmailAddress,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge,
          maxLines: 2,
        ),
        const SizedBox(height: 32),
        Form(
          onChanged: () => viewModel.doIntent(FormDataChangedAction()),
          key: viewModel.formKey,
          child: Row(
            children: [
              OtpFormField(0),
              const SizedBox(width: 8),
              OtpFormField(1),
              const SizedBox(width: 8),
              OtpFormField(2),
              const SizedBox(width: 8),
              OtpFormField(3),
              const SizedBox(width: 8),
              OtpFormField(4),
              const SizedBox(width: 8),
              OtpFormField(5),
            ],
          ),
        ),
        const SizedBox(height: 32),
        ValueListenableBuilder(
          valueListenable: viewModel.timerMessage,
          builder: (context, value, child) => Text(
            viewModel.timerMessage.value,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        const SizedBox(height: 32),
        ValueListenableBuilder(
          valueListenable: viewModel.valid,
          builder:(context, value, child) => ElevatedButton(
            onPressed: () => viewModel.doIntent(OnCompleteCodeVerifyAction()),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(16),
              backgroundColor: viewModel.valid.value
                  ? AppColors.blue
                  : AppColors.black[AppColors.colorCode30],
            ),
            child: Text(viewModel.locale!.confirm),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              viewModel.locale!.didNotReceiveCode,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            TextButton(
              onPressed: () {
                viewModel.doIntent(OtpResendAction());
              },
              child: Text(
                viewModel.locale!.resend,
              ),
            )
          ],
        ),
      ],
    );
  }
}
