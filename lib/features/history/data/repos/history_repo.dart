import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/network/remote/apis/dio_helper.dart';
import '../../../../core/network/remote/end_points.dart';
import '../models/my_history_model.dart';

class HistoryRepo {

  Future<Either<Failure, MyHistoryModel>> getMyHistory()async {
    try {
      Response response = await DioHelper.getData(
        url:ApiConstants.myHistory,
        query: {
          "month": DateTime.now().month,
          "year": DateTime.now().year,
        }
      );
      if (response.statusCode == 200) {
        var result = MyHistoryModel.fromJson(response.data);
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