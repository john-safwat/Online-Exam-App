import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class AnimationWidgetBuilder extends StatelessWidget {
  final int index;
  final int valueKey;
  final Widget widget;

  const AnimationWidgetBuilder(this.index, this.valueKey, this.widget,   {super.key});

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
      key: ValueKey(valueKey),
      position: index,
      duration: const Duration(milliseconds: 500),
      child: SlideAnimation(
        verticalOffset: 80.0,
        child: FadeInAnimation(
          child: widget,
        ),
      ),
    );
  }
}
