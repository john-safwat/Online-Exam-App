import 'package:dialogs/app_dialog_utils.dart';
import 'package:flutter/material.dart';
import '../assets/animation_assets.dart';

class AppDialogs {
  void showFailDialog(
      {required String message,
        required BuildContext context,
        String? posActionTitle,
        VoidCallback? posAction,
        String? negativeActionTitle,
        VoidCallback? negativeAction}) {
    AppDialogUtils.showDialogOnScreen(
        context: context,
        message: message,
        imagePath: AnimationsAssets.errorAnimation,
        posAction: posAction,
        negativeAction: negativeAction,
        negativeActionTitle: negativeActionTitle,
        posActionTitle: posActionTitle);
  }

  void showInfoDialog(
      {required String message,
        required BuildContext context,
        String? posActionTitle,
        VoidCallback? posAction,
        String? negativeActionTitle,
        VoidCallback? negativeAction}) {
    AppDialogUtils.showDialogOnScreen(
        context: context,
        message: message,
        imagePath: AnimationsAssets.infoAnimation,
        posAction: posAction,
        negativeAction: negativeAction,
        negativeActionTitle: negativeActionTitle,
        posActionTitle: posActionTitle);
  }

  void showLoading({required String message , required BuildContext context}) {
    AppDialogUtils.showLoadingDialog(context: context, message: message);
  }

  void showSuccessDialog(
      {required String message,
        required BuildContext context,
        String? posActionTitle,
        VoidCallback? posAction,
        String? negativeActionTitle,
        VoidCallback? negativeAction}) {
    AppDialogUtils.showDialogOnScreen(
        context: context,
        message: message,
        imagePath: AnimationsAssets.checkAnimation,
        posAction: posAction,
        negativeAction: negativeAction,
        negativeActionTitle: negativeActionTitle,
        posActionTitle: posActionTitle);
  }

}