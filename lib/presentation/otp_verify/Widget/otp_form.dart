import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/theme/app_theme.dart';
import 'package:online_exam_app/presentation/otp_verify/otp_verify_view_model.dart';

class OtpForm extends StatelessWidget {
  late OtpVerifyViewModel viewModel;

  OtpForm({super.key});

  @override
  Widget build(BuildContext context) {
    viewModel = BlocProvider.of<OtpVerifyViewModel>(context);
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: viewModel.formKey,
      child: ListView(
        padding: const EdgeInsets.all(14),
        children: [
          Text(
              textAlign: TextAlign.center,
              viewModel.locale!.emailVerification,
              style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(
            height: 16,
          ),
          Text(
            textAlign: TextAlign.center,
            viewModel.locale!.pleaseEnterYourCodeThatSendToYourEmailAddress,
            style: Theme.of(context).textTheme.bodyLarge,
            maxLines: 2,
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: TextFormField(
                  autofocus: true,
                  onSaved: (pin1) {},
                  onChanged: (value) {
                    if (value.length == 1) {
                      FocusScope.of(context).nextFocus();
                    }
                  },
                  keyboardType: TextInputType.number,
                  maxLength: 1,
                  decoration: const InputDecoration(
                      counterText: "",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)))),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TextFormField(
                  onSaved: (pin2) {},
                  onChanged: (value) {
                    if (value.length == 1) {
                      FocusScope.of(context).nextFocus();
                    } else if (value.isEmpty) {
                      FocusScope.of(context).previousFocus();
                    }
                  },
                  keyboardType: TextInputType.number,
                  maxLength: 1,
                  decoration: const InputDecoration(
                      counterText: "",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)))),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TextFormField(
                  onSaved: (pin3) {},
                  onChanged: (value) {
                    if (value.length == 1) {
                      FocusScope.of(context).nextFocus();
                    } else if (value.isEmpty) {
                      FocusScope.of(context).previousFocus();
                    }
                  },
                  keyboardType: TextInputType.number,
                  maxLength: 1,
                  decoration: const InputDecoration(
                      counterText: "",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)))),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TextFormField(
                  onSaved: (pin4) {},
                  onChanged: (value) {
                    if (value.length == 1) {
                      FocusScope.of(context).nextFocus();
                    } else if (value.isEmpty) {
                      FocusScope.of(context).previousFocus();
                    }
                  },
                  keyboardType: TextInputType.number,
                  maxLength: 1,
                  decoration: const InputDecoration(
                      counterText: "",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)))),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TextFormField(
                  onSaved: (pin5) {},
                  onChanged: (value) {
                    if (value.length == 1) {
                      FocusScope.of(context).nextFocus();
                    } else if (value.isEmpty) {
                      FocusScope.of(context).previousFocus();
                    }
                  },
                  keyboardType: TextInputType.number,
                  maxLength: 1,
                  decoration: const InputDecoration(
                      counterText: "",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)))),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TextFormField(
                  onSaved: (pin6) {},
                  onChanged: (value) {
                    if (value.length == 1) {
                      FocusScope.of(context).nextFocus();
                    } else if (value.isEmpty) {
                      FocusScope.of(context).previousFocus();
                    }
                  },
                  keyboardType: TextInputType.number,
                  maxLength: 1,
                  decoration: const InputDecoration(
                      counterText: "",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)))),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                viewModel.locale!.didNotReceiveCode,
                style: AppTheme.appTheme.textTheme.bodyLarge!
                    .copyWith(fontSize: 14),
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
      ),
    );
  }
}
