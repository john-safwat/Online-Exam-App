import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:online_exam_app/core/assets/animation_assets.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(AnimationsAssets.examLoadingAnimation),
    );
  }
}
