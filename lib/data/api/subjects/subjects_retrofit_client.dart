import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/data/api/api_constants.dart';
import 'package:online_exam_app/data/models/subject/subjects_response_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'subjects_retrofit_client.g.dart';

@singleton
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class SubjectsRetrofitClient {
  @factoryMethod
  factory SubjectsRetrofitClient(Dio dio) = _SubjectsRetrofitClient;

  @GET(ApiConstants.subjectRoute)
  Future<SubjectsResponseDto> getSubjects(@Header("token") String token);
}
