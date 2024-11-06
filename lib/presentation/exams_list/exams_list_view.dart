import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:online_exam_app/core/assets/animation_assets.dart';
import 'package:online_exam_app/core/base/base_view.dart';
import 'package:online_exam_app/core/di/di.dart';
import 'package:online_exam_app/core/widgets/server_error_widget.dart';
import 'package:online_exam_app/domain/entities/subject/subjects.dart';
import 'package:online_exam_app/presentation/exams_list/exams_list_contract.dart';
import 'package:online_exam_app/presentation/exams_list/exams_list_view_model.dart';
import 'package:online_exam_app/presentation/exams_list/widgets/exam_widget.dart';

class ExamsListView extends StatefulWidget {
  final Subject subject;

  const ExamsListView(this.subject, {super.key});

  @override
  State<ExamsListView> createState() => _ExamsListViewState();
}

class _ExamsListViewState extends BaseState<ExamsListView, ExamsListViewModel> {
  @override
  void initState() {
    super.initState();
    viewModel.subject = widget.subject;
    viewModel.doIntent(LoadDataAction());
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
      create: (context) => viewModel,
      child: Scaffold(
        appBar: AppBar(
          title: Text(viewModel.subject.name!),
        ),
        body: BlocConsumer<ExamsListViewModel, ExamsListViewStates>(
          listener: (context, state) {},
          builder: (context, state) {
            switch (state) {
              case InitialExamsListState():
              case LoadDataLoadingState():
                {
                  return Center(
                    child: Lottie.asset(AnimationsAssets.examLoadingAnimation),
                  );
                }
              case LoadDataLoadingSuccessState():
                {
                  if (viewModel.examsList.isEmpty) {
                    return Center(
                      child: Lottie.asset(AnimationsAssets.emptyAnimation),
                    );
                  }
                  return ListView.separated(
                      controller: viewModel.controller,
                      padding: EdgeInsets.all(16),
                      itemBuilder: (context, index) => ExamWidget(
                          viewModel.examsList[index]!,
                          viewModel.subject,
                          viewModel.locale!.question,
                          viewModel.locale!.minutes),
                      separatorBuilder: (context, index) => SizedBox(
                            height: 16,
                          ),
                      itemCount: viewModel.examsList.length);
                }
              case LoadDataLoadingFailState():
                {
                  return ServerErrorWidget(
                    state.message,
                    viewModel.locale!.tryAgain,
                    () {
                      viewModel.doIntent(
                        LoadDataAction(),
                      );
                    },
                  );
                }
            }
          },
        ),
      ),
    );
  }

  @override
  ExamsListViewModel initViewModel() {
    return getIt<ExamsListViewModel>();
  }
}
