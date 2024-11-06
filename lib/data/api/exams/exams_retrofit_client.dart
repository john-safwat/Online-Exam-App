import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/data/api/api_constants.dart';
import 'package:online_exam_app/data/api/models/exams/exams_response_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'exams_retrofit_client.g.dart';

@singleton
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ExamsRetrofitClient {

  @factoryMethod
  factory ExamsRetrofitClient(Dio dio) = _ExamsRetrofitClient;

  @GET(ApiConstants.examsRoute)
  Future<ExamsResponseDto> getExamsBySubject(@Header("token") String token,
      @Query("subject") String subjectId, @Query("page") int pageNumber,
      [@Query("limit") int perPage = 40]);
}
