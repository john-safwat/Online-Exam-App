import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/presentation/otp_verify/otp_verify_contract.dart';
import 'package:online_exam_app/presentation/otp_verify/otp_verify_view_model.dart';

class OtpFormField extends StatelessWidget {
  int index;

  OtpFormField(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    var viewModel = BlocProvider.of<OtpVerifyViewModel>(context);
    return Expanded(
      child: TextFormField(
        autofocus: true,
        onChanged: (value) {
          viewModel.doIntent(EnterOtpNumberAction(value, index));
        },
        autovalidateMode: AutovalidateMode.onUserInteraction,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        keyboardType: TextInputType.number,
        maxLength: 1,
        validator: (value) => viewModel.otpInputValidation(value ?? ""),
        cursorColor: Theme.of(context).primaryColor,
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
        ),
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
