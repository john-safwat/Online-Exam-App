import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:online_exam_app/core/base/base_view_model.dart';
import 'package:online_exam_app/core/providers/language_provider.dart';
import 'package:provider/provider.dart';

abstract class BaseState<T extends StatefulWidget, VM extends BaseViewModel>
    extends State<T> {
  late VM viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = initViewModel();
  }

  @override
  void dispose() {
    super.dispose();
    viewModel.local = null;
    viewModel.languageProvider = null;
  }

  @override
  Widget build(BuildContext context) {
    viewModel.local = AppLocalizations.of(context);
    viewModel.languageProvider = Provider.of<LanguageProvider>(context);
    return const Placeholder();
  }

  VM initViewModel();
}
