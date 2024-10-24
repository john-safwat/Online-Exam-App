import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/base/base_view_model.dart';
import 'package:online_exam_app/core/di/di.dart';
import 'package:online_exam_app/core/providers/app_config_provider.dart';
import 'package:online_exam_app/domain/core/results.dart';
import 'package:online_exam_app/domain/entities/user/user.dart';
import 'package:online_exam_app/domain/use_case/get_user_info_use_case.dart';
import 'package:online_exam_app/presentation/main_layout/tabs/profile/profile_contract.dart';

@injectable
class ProfileViewModel extends BaseViewModel<ProfileViewState> {
  GetUserInfoUseCase getUserInfoUseCase;

  ProfileViewModel(this.getUserInfoUseCase) : super(InitialProfileViewState());


  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  ValueNotifier<bool> valid = ValueNotifier(false);
  User? user;

  void doIntent(ProfileAction action){
    switch (action) {

      case LoadDataAction():{
        _loadData();
      }
    }
  }

  void _loadData() async{
    emit(ProfileDataLoadingState());
    var response  = await getUserInfoUseCase(getIt<AppConfigProvider>().token);
    switch (response) {

      case Success<User?>():{
        _initUser(response.data);
        emit(ProfileDataLoadingSuccessState());
      }
      case Failure<User?>():
        {
          emit(ProfileDataLoadingFailState(mapExceptionToMessage(response.exception)));
        }
    }
  }

  void _initUser(User? data) {
    user = data;
    emailController.text = data?.email??"";
    phoneController.text = data?.phone??"";
    firstNameController.text = data?.firstName??"";
    lastNameController.text = data?.lastName??"";
    nameController.text = data?.username??"";
  }


}
