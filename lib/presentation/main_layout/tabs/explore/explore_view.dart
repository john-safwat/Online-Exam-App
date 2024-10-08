import 'package:flutter/material.dart';
import 'package:online_exam_app/core/providers/language_provider.dart';
import 'package:provider/provider.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({super.key});

  @override
  Widget build(BuildContext context) {
    LanguageProvider provider = Provider.of<LanguageProvider>(context);
    return Container(
      color: Colors.red,
    );
  }
}
