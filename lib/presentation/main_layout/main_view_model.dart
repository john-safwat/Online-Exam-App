import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/base/base_view_model.dart';
import 'package:online_exam_app/presentation/main_layout/main_contract.dart';

@injectable
class MainViewModel extends BaseViewModel<MainViewStates> {
  MainViewModel() : super(InitializeMainViewState());

  int selectedIndex = 0;
  PageController pageController = PageController();

  void doIntent(MainViewAction action) {
    switch (action) {
      case InitializeMainViewAction():
        {
          _initPageController();
        }
      case ChangeSelectedIndexAction():
        {
          _updateSelectedIndex(action.index);
        }
    }
  }

  void _initPageController() {
    pageController.addListener(_updateSelectedIndexWhenPageChange);
  }

  void _updateSelectedIndexWhenPageChange() {
    selectedIndex = pageController.page!.toInt();
    emit(PageChangedState());
  }

  void _updateSelectedIndex(int index) {
    selectedIndex = index;
    pageController.animateToPage(selectedIndex,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
    Future.delayed(const Duration(milliseconds: 500)).then(
      (value) {
        emit(PageChangedState());
      },
    );
  }
}
