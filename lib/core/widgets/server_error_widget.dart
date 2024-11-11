import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:online_exam_app/core/assets/animation_assets.dart';

class ServerErrorWidget extends StatelessWidget {
  final String title;
  final String buttonTitle;
  final Function onTryAgainPress;

  const ServerErrorWidget(this.title, this.buttonTitle, this.onTryAgainPress,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(AnimationsAssets.notFoundAnimation),
          Text(
            title,
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              onTryAgainPress();
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(16),
            ),
            child: Text(buttonTitle),
          ),
        ],
      ),
    );
  }
}
