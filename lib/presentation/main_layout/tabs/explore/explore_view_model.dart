import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/base/base_view_model.dart';
import 'package:online_exam_app/core/di/di.dart';
import 'package:online_exam_app/core/providers/app_config_provider.dart';
import 'package:online_exam_app/domain/core/results.dart';
import 'package:online_exam_app/domain/entities/subject/pagination_info.dart';
import 'package:online_exam_app/domain/entities/subject/subjects.dart';
import 'package:online_exam_app/domain/use_case/get_subject_list_use_case.dart';
import 'package:online_exam_app/presentation/main_layout/main_view_model.dart';
import 'package:online_exam_app/presentation/main_layout/tabs/explore/explore_contract.dart';

@injectable
class ExploreViewModel extends BaseViewModel<ExploreViewStates> {
  GetSubjectListUseCase getSubjectListUseCase;
  late MainViewModel mainViewModel;

  ExploreViewModel(this.getSubjectListUseCase)
      : super(InitialExploreViewState()) {
    scrollController.addListener(_listenOnScroll);
  }

  int pageNumber = 1;
  List<Subject?> allSubjects = [];
  List<Subject?> displayedSubjects = [];
  int? maxPage;

  ScrollController scrollController = ScrollController();

  void _loadMoreSubjects() async {
    if (pageNumber == 1) {
      emit(LoadSubjectsState());
    }
    var response = await getSubjectListUseCase(
        getIt<AppConfigProvider>().token, pageNumber);
    switch (response) {
      case Success<(List<Subject?>?, PaginationInfo?)>():
        {
          pageNumber++;
          maxPage = response.data?.$2?.numberOfPages ?? 1;
          allSubjects.addAll(response.data!.$1!);
          displayedSubjects = [];
          displayedSubjects.addAll(allSubjects);
          emit(LoadSubjectsSuccessState());
        }
      case Failure<(List<Subject?>?, PaginationInfo?)>():
        {
          emit(
              LoadSubjectsFailState(mapExceptionToMessage(response.exception)));
          mainViewModel.validateOnException(response.exception);
        }
    }
  }

  void doIntent(ExploreViewActions action) {
    switch (action) {
      case LoadDataAction():
        {
          if (pageNumber != maxPage) {
            _loadMoreSubjects();
          }
        }
      case SearchAction():
        {
          _search(action.searchText);
        }
      case OnSubjectPressAction():
        {
          _navigateToExamsList(action.subject);
        }
    }
  }

  void _listenOnScroll() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      if (pageNumber <= (maxPage ?? 1)) {
        _loadMoreSubjects();
      }
    }
  }

  void _search(String searchText) async {
    displayedSubjects = allSubjects
        .where(
          (element) =>
              element!.name!.toLowerCase().contains(searchText.toLowerCase()),
        )
        .toList();
    emit(LoadSubjectsSuccessState());
  }

  void _navigateToExamsList(Subject subject) {
    emit(NavigateToExamsListState(subject));
  }
}
