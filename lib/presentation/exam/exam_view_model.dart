import 'dart:async';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/base/base_view_model.dart';
import 'package:online_exam_app/core/di/di.dart';
import 'package:online_exam_app/core/providers/app_config_provider.dart';
import 'package:online_exam_app/domain/core/results.dart';
import 'package:online_exam_app/domain/entities/exam/answer.dart';
import 'package:online_exam_app/domain/entities/exam/exam.dart';
import 'package:online_exam_app/domain/entities/exam/question.dart';
import 'package:online_exam_app/domain/use_case/get_exam_questions_use_case.dart';
import 'package:online_exam_app/domain/use_case/submit_exam_use_case.dart';
import 'package:online_exam_app/presentation/exam/exam_contract.dart';
import 'package:online_exam_app/presentation/main_layout/main_view_model.dart';

@injectable
class ExamViewModel extends BaseViewModel<ExamViewState> {
  late Exam exam;
  GetExamQuestionsUseCase getExamQuestionsUseCase;
  SubmitExamUseCase submitExamUseCase;

  ExamViewModel(this.getExamQuestionsUseCase, this.submitExamUseCase)
      : super(InitialExamState());

  late int time = exam.duration! * 60;

  late ValueNotifier<String> timeMessage = ValueNotifier<String>("00:00");

  late Timer timer;

  List<Question?> questions = [];

  ValueNotifier<int> questionIndex = ValueNotifier(1);
  int questionCount = 1;

  double gradePercent = 0;
  int correctCount = 0;
  int incorrectCount = 0;

  late AnimationController questionAnimationController;
  late AnimationController answersAnimationController;

  void doIntent(ExamViewAction action) async {
    switch (action) {
      case LoadExamQuestionsAction():
        {
          await _loadQuestions();
        }
      case SelectAnswerAction():
        {
          _changeSelectedAnswer(action.answer);
        }
      case OnPressNextAction():
        {
          _increaseIndex();
          _playAnimations();
        }
      case OnPressBackAction():
        {
          await _playBackAnimations();
          _decreaseIndex();
          _playAnimations();
        }
      case OnPressFinishAction():
        {
          _submitExam();
        }
      case StartAgainAction():
        {
          _startAgain();
        }
      case NavigateToAnswersScreenAction():{
        _navigateToAnswersScreen();
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

  Future<void> _loadQuestions() async {
    emit(ExamQuestionsLoadingState());
    var response = await getExamQuestionsUseCase(
        getIt<AppConfigProvider>().token, exam.id!);
    switch (response) {
      case Success<List<Question?>?>():
        {
          if (response.data!.isEmpty) {
            emit(
              ExamQuestionsLoadingFailState("0 ${locale!.question}"),
            );
          } else {
            questions = response.data!;
            questionCount = questions.length;
            time = exam.duration! * 60;
            exam.questions = questions;
            timer = Timer.periodic(
              const Duration(seconds: 1),
              _updateTimer,
            );
            emit(ExamQuestionsLoadingSuccessState());
            Future.delayed(
              const Duration(milliseconds: 100),
              () => _playAnimations(),
            );
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
      _handeTimeout();
    } else {
      _updateTimeString();
    }
  }

  void _handeTimeout() {
    timer.cancel();
    emit(ExamTimeoutState());
  }

  void _changeSelectedAnswer(Answer answer) {
    /// change the old answer is not selected
    if (questions[questionIndex.value - 1]!.selectedAnswer != null) {
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
  }

  void _decreaseIndex() {
    questionIndex.value--;
  }

  void _submitExam() async {
    emit(ExamCheckingState());
    var response = await submitExamUseCase(exam, questions);
    switch (response) {
      case Success<void>():
        {
          timer.cancel();
          _evaluate();
          emit(ExamCheckingSuccessState());
        }
      case Failure<void>():
        {
          emit(
              ExamCheckingFailState(mapExceptionToMessage(response.exception)));
        }
    }
  }

  void _playAnimations() async {
    questionAnimationController.reset();
    questionAnimationController.animateTo(1,
        duration: const Duration(milliseconds: 200));
    answersAnimationController.reset();
    answersAnimationController.animateTo(1,
        duration: const Duration(milliseconds: 400));
  }

  _playBackAnimations() async {
    await answersAnimationController.animateTo(0,
        duration: const Duration(milliseconds: 300));
  }

  void _evaluate() {
    int correctAnswers = 0;
    for (var question in questions) {
      if (question!.correct == question.selectedAnswer?.key) {
        correctAnswers++;
      }
    }
    gradePercent = (correctAnswers / questions.length * 100);
    correctCount = correctAnswers;
    incorrectCount = questions.length - correctCount;
  }

  void _startAgain() {
    for (Question? question in questions) {
      question?.selectedAnswer = null;
      for (Answer? answer in question!.answers!) {
        answer?.selected = false;
      }
    }
    questionIndex.value = 1;
    time = exam.duration! * 60;
    timer = Timer.periodic(
      const Duration(seconds: 1),
      _updateTimer,
    );
    Future.delayed(
      const Duration(milliseconds: 100),
      () => _playAnimations(),
    );
    emit(ExamQuestionsLoadingSuccessState());
  }

  void _navigateToAnswersScreen() {
    exam.questions = questions;
    exam.correctAnswers = correctCount;
    emit(NavigateToAnswersScreenState(exam));
  }
}
