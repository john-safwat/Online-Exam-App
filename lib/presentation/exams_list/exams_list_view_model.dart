import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/base/base_view_model.dart';
import 'package:online_exam_app/core/di/di.dart';
import 'package:online_exam_app/core/providers/app_config_provider.dart';
import 'package:online_exam_app/domain/core/results.dart';
import 'package:online_exam_app/domain/entities/exam/exam.dart';
import 'package:online_exam_app/domain/entities/subject/pagination_info.dart';
import 'package:online_exam_app/domain/entities/subject/subjects.dart';
import 'package:online_exam_app/domain/use_case/get_exams_list_by_subject_use_case.dart';
import 'package:online_exam_app/presentation/exams_list/exams_list_contract.dart';

@injectable
class ExamsListViewModel extends BaseViewModel<ExamsListViewStates> {
  GetExamsListBySubjectUseCase getExamsListBySubjectUseCase;

  ExamsListViewModel(this.getExamsListBySubjectUseCase)
      : super(InitialExamsListState()) {
    controller.addListener(_listenOnScroll);
  }

  late Subject subject;

  List<Exam?> examsList = [];
  int pageNumber = 1;
  int? maxPageNumber;

  ScrollController controller = ScrollController();

  void doIntent(ExamsListAction action) {
    switch (action) {
      case LoadDataAction():
        {
          _loadData();
        }
      case ShowBottomSheetAction():
        {
          _showBottomSheet(action.exam);
        }
      case OnStartExamPress():
        {
          _navigateToExamScreen(action.exam);
        }
    }
  }

  void _loadData() async {
    if (pageNumber == 1) {
      emit(LoadDataLoadingState());
    }
    var response = await getExamsListBySubjectUseCase(
        getIt<AppConfigProvider>().token, subject.id!, pageNumber);

    switch (response) {
      case Success<(List<Exam?>?, PaginationInfo?)>():
        {
          pageNumber++;
          maxPageNumber = response.data?.$2?.numberOfPages ?? 1;
          examsList.addAll(response.data!.$1!);
          emit(LoadDataLoadingSuccessState());
        }

      case Failure<(List<Exam?>?, PaginationInfo?)>():
        {
          emit(LoadDataLoadingFailState(
              mapExceptionToMessage(response.exception)));
        }
    }
  }

  void _listenOnScroll() {
    if (controller.position.pixels == controller.position.maxScrollExtent) {
      if (pageNumber <= (maxPageNumber ?? 1)) {
        _loadData();
      }
    }
  }

  void _showBottomSheet(Exam exam) {
    emit(ShowBottomSheetState(exam));
  }

  void _navigateToExamScreen(Exam exam) {
    emit(NavigateToExamScreenState(exam));
  }
}
