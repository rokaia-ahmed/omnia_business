import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/network/remote/apis/dio_helper.dart';
import '../../../../core/network/remote/end_points.dart';
import '../models/documents_model.dart';
import '../models/upcoming_meetings_model.dart';

class HomeRepo {

  Future<Either<Failure, UpcomingMeetingsModel>> getUpcomingMeetings()async {
    try {
      Response response = await DioHelper.getData(
        url:ApiConstants.upcomingMeeting,
      );
      if (response.statusCode == 200) {
        var result = UpcomingMeetingsModel.fromJson(response.data);
        return right(result);
      }  else {
        return left(ServerFailure.fromResponse(response));
      }
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  Future<Either<Failure, DocumentsModel>> getDocuments()async {
    try {
      Response response = await DioHelper.getData(
        url:ApiConstants.documents,
      );
      if (response.statusCode == 200) {
        var result = DocumentsModel.fromJson(response.data);
        return right(result);
      }  else {
        return left(ServerFailure.fromResponse(response));
      }
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}