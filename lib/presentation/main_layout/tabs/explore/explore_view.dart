import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:online_exam_app/core/assets/animation_assets.dart';
import 'package:online_exam_app/core/di/di.dart';
import 'package:online_exam_app/data/local_database/subjects/subjects_local_database.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({super.key});

  @override
  Widget build(BuildContext context) {
    var database = getIt<SubjectsLocalDatabase>();
    return Center(
      child: Lottie.asset(AnimationsAssets.examLoadingAnimation),
    );
  }
}
