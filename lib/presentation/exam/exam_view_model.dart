import 'dart:async';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:online_exam_app/core/base/base_view_model.dart';
import 'package:online_exam_app/core/di/di.dart';
import 'package:online_exam_app/core/providers/app_config_provider.dart';
import 'package:online_exam_app/domain/core/results.dart';
import 'package:online_exam_app/domain/entities/exam/answer.dart';
import 'package:online_exam_app/domain/entities/exam/exam.dart';
import 'package:online_exam_app/domain/entities/exam/question.dart';
import 'package:online_exam_app/domain/use_case/get_exam_questions_use_case.dart';
import 'package:online_exam_app/presentation/exam/exam_contract.dart';

@injectable
class ExamViewModel extends BaseViewModel<ExamViewState> {
  late Exam exam;
  GetExamQuestionsUseCase getExamQuestionsUseCase;

  ExamViewModel(this.getExamQuestionsUseCase) : super(InitialExamState());

  late int time = exam.duration! * 60;

  late ValueNotifier<String> timeMessage = ValueNotifier<String>("00:00");

  late Timer timer;

  List<Question?> questions = [];

  ValueNotifier<int> questionIndex = ValueNotifier(1);
  int questionCount = 1;

  void doIntent(ExamViewAction action) {
    switch (action) {
      case LoadExamQuestionsAction():
        {
          _loadQuestions();
        }
      case SelectAnswerAction():
        {
          _changeSelectedAnswer(action.answer);
        }
      case OnPressNextAction():{
        _increaseIndex();
      }
      case OnPressBackAction():{
        _decreaseIndex();
      }
      case OnPressFinishAction():{
        _submitExam();
      }
    }
  }

  void _updateTimeString() {
    String minutes = (time ~/ 60).toString();
    String seconds = (time % 60).toString();
    if (minutes.length == 1) {
      minutes = "0$minutes";
    }
    if (seconds.length == 1) {
      seconds = "0$seconds";
    }
    timeMessage.value = "$minutes:$seconds";
  }

  bool isDangerTime() {
    return time < exam.duration! * 20;
  }

  void _loadQuestions() async {
    emit(ExamQuestionsLoadingState());
    var response = await getExamQuestionsUseCase(
        getIt<AppConfigProvider>().token, exam.id!);
    switch (response) {
      case Success<List<Question?>?>():
        {
          if(response.data!.isEmpty){
            emit(
              ExamQuestionsLoadingFailState("0 ${locale!.question}"),
            );
          }else{
            questions = response.data!;
            questionCount = questions.length;
            time = exam.duration! * 60;
            timer = Timer.periodic(
              const Duration(seconds: 1),
              _updateTimer,
            );
            emit(ExamQuestionsLoadingSuccessState());
          }

        }
      case Failure<List<Question?>?>():
        {
          emit(
            ExamQuestionsLoadingFailState(
              mapExceptionToMessage(response.exception),
            ),
          );
        }
    }
  }

  _updateTimer(Timer timer) {
    time--;
    if (time < 0) {
      timer.cancel();
      _handeTimeout();
    } else {
      _updateTimeString();
    }
  }

  void _handeTimeout() {
    /// todo handle when exam time end
  }

  void _changeSelectedAnswer(Answer answer) {
    /// change the old answer is not selected
    if(questions[questionIndex.value - 1]!.selectedAnswer != null) {
      questions[questionIndex.value - 1]!
          .answers![questions[questionIndex.value - 1]!
          .answers!
          .indexOf(questions[questionIndex.value - 1]!.selectedAnswer!)]
          .selected = false;
    }
    /// update new selected answer
    questions[questionIndex.value - 1]!.selectedAnswer = answer;
    /// update the new answer is selected
    questions[questionIndex.value - 1]!
        .answers![questions[questionIndex.value - 1]!.answers!.indexOf(answer)]
        .selected = true;
    emit(RefreshState());
  }

  void _increaseIndex() {
    questionIndex.value++;
    emit(RefreshState());
  }

  void _decreaseIndex() {
    questionIndex.value--;
    emit(RefreshState());
  }

  void _submitExam() {
    /// todo submit exam
  }
}
