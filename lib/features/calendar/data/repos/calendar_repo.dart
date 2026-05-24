import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/network/remote/apis/dio_helper.dart';
import '../../../../core/network/remote/end_points.dart';
import '../models/timeline_model.dart';

class CalendarRepo {
  Future<Either<Failure, TimelineModel>> getTimeLine({required String date})async {
    try {
      Response response = await DioHelper.getData(
        url:ApiConstants.timeline,
        query: {
          "date": date,
        },
      );
      if (response.statusCode == 200) {
        var result = TimelineModel.fromJson(response.data);
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