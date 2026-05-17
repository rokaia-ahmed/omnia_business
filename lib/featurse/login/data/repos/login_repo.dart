import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/network/local/cache/chace_helper.dart';
import '../../../../core/network/remote/apis/dio_helper.dart';
import '../../../../core/network/remote/end_points.dart';

class LoginRepo {

  Future<Either<Failure, String>> login(
      {required String email, required String password}) async {
    try {
      Response response = await DioHelper.postData(
        url: ApiConstants.login,
        data: {
          "email": email,
          "password": password,
        },
      );
      if (response.statusCode == 200) {
        CacheHelper.saveData('token', response.data['data']['token']);
        debugPrint('token ==========${response.data['data']['token']}');
        return right(response.data['message']);
      } else if (response.statusCode == 404 || response.statusCode == 403) {
        return left(Failure('${response.data['message']}'));
      } else {
        return Left(ServerFailure.fromResponse(response));
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