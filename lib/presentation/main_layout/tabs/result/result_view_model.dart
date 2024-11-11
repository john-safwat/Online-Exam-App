import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:online_exam_app/core/base/base_view_model.dart';
import 'package:online_exam_app/core/di/di.dart';
import 'package:online_exam_app/domain/core/results.dart';
import 'package:online_exam_app/domain/entities/exam/exam.dart';
import 'package:online_exam_app/domain/use_case/get_exams_results_list_use_case.dart';
import 'package:online_exam_app/presentation/main_layout/tabs/result/result_contract.dart';

@injectable
class ResultViewModel extends BaseViewModel<ResultState> {
  GetExamsResultsListUseCase getExamsResultsListUseCase;

  ResultViewModel(this.getExamsResultsListUseCase)
      : super(InitialResultState());

  List<Exam?> exams = [];

  void doIntent(ResultAction action) {
    switch (action) {
      case LoadResultsAction():
        {
          _getExamsResultsList();
        }
      case NavigateToAnswersScreenAction():
        {
          _navigateToAnswersScreen(action.exam);
        }
    }
  }

  Future<void> _getExamsResultsList() async {
    emit(ResultLoadingState());
    var result = await getExamsResultsListUseCase();
    switch (result) {
      case Success<List<Exam?>>():
        {
          getIt<Logger>().i(result.data);
          exams = result.data ?? [];
          emit(ResultLoadingSuccessState());
        }
      case Failure<List<Exam?>>():
        {
          emit(
            ResultLoadingFailState(
              mapExceptionToMessage(result.exception),
            ),
          );
        }
    }
  }

  void _navigateToAnswersScreen(Exam exam) {
    emit(NavigateToAnswersScreenState(exam));
  }
}
