import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/base/base_view_model.dart';
import 'package:online_exam_app/core/di/di.dart';
import 'package:online_exam_app/core/providers/app_config_provider.dart';
import 'package:online_exam_app/domain/core/results.dart';
import 'package:online_exam_app/domain/entities/subject/pagination_info.dart';
import 'package:online_exam_app/domain/entities/subject/subjects.dart';
import 'package:online_exam_app/domain/use_case/get_subject_list_use_case.dart';
import 'package:online_exam_app/presentation/main_layout/tabs/explore/explore_contract.dart';

@injectable
class ExploreViewModel extends BaseViewModel<ExploreViewStates> {
  GetSubjectListUseCase getSubjectListUseCase;

  ExploreViewModel(this.getSubjectListUseCase)
      : super(InitialExploreViewState());

  int _pageNumber = 1;
  List<Subject?> subjects = [];
  int? _maxPage;

  ScrollController scrollController = ScrollController();

  void loadMoreSubjects() async {
    emit(LoadSubjectsState());
    var response = await getSubjectListUseCase(
        getIt<AppConfigProvider>().token, _pageNumber);
    switch (response) {
      case Success<(List<Subject?>?, PaginationInfo?)>():
        {
          _pageNumber++;
          _maxPage = response.data?.$2?.numberOfPages ?? 1;
          subjects.addAll(response.data!.$1!);
          emit(LoadSubjectsSuccessState());
        }
      case Failure<(List<Subject?>?, PaginationInfo?)>():
        {
          emit(
              LoadSubjectsFailState(mapExceptionToMessage(response.exception)));
        }
    }
  }
}
