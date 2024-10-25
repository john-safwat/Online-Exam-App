import 'package:flutter/material.dart';
import 'package:online_exam_app/core/constants/constants.dart';
import 'package:online_exam_app/core/di/di.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({super.key});

  @override
  Widget build(BuildContext context) {
    // return Center(
    //   child: Lottie.asset(AnimationsAssets.examLoadingAnimation),
    // );
    return Center(
      child: ElevatedButton(
          onPressed: () {
            getIt<SharedPreferences>().remove(Constants.tokenKey);
          },
          child: const Text("logout")),
    );
  }
}
