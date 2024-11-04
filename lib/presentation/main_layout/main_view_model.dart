import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/base/base_view_model.dart';
import 'package:online_exam_app/domain/use_case/delete_token_use_case.dart';
import 'package:online_exam_app/presentation/main_layout/main_contract.dart';

@injectable
class MainViewModel extends BaseViewModel<MainViewStates> {
  DeleteTokenUseCase deleteTokenUseCase;

  MainViewModel(this.deleteTokenUseCase) : super(InitializeMainViewState());

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
      case LogoutAction():
        {
          _logout();
        }
    }
  }

  void _initPageController() {
    pageController.addListener(_updateSelectedIndexWhenPageChange);
  }

  void _updateSelectedIndexWhenPageChange() {
    if (pageController.page!.toInt() == selectedIndex) {
      return;
    }
    selectedIndex = pageController.page!.toInt();
    emit(PageChangedState());
  }

  void _updateSelectedIndex(int index) {
    selectedIndex = index;
    pageController.jumpToPage(selectedIndex);
    emit(PageChangedState());
  }

  void validateOnException(Exception exception) {
    if (exception is DioException) {
      if (exception.type == DioExceptionType.badResponse) {
        if (exception.response?.data["message"] ==
            "invalid token .. login again") {
          appConfigProvider!.token = "";
          emit(InvalidTokenState());
        }
      }
    }
  }

  void _logout() async {
    await deleteTokenUseCase();
    emit(NavigateToLoginState());
  }
}
