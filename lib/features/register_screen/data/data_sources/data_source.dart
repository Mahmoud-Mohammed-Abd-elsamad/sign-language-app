import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:sigin_lang_app/features/register_screen/data/models/register_mode.dart';
import 'package:sigin_lang_app/features/register_screen/domain/entities/register_body.dart';

import '../../../../core/errors/failures.dart';
import 'package:http/http.dart' as http;

abstract class RegisterDataSource {
  Future<Either<FailureError,RegisterModel>> register(RegisterBody registerBody);

}


class RemoteRegisterDataSource extends RegisterDataSource {
  @override
  Future<Either<FailureError, RegisterModel>> register(
      RegisterBody registerBody) async {
    try {
      var response = await http.post(
        Uri.parse(
            'http://127.0.0.1:8000/sign-language/public/api/auth/register'),
        body: jsonEncode(<String, String>{
          "name": registerBody.name,
          "email": registerBody.email,
          "password": registerBody.password,
          "password_confirmation": registerBody.rePassword
        }),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        print(registerBody.email + " email =============================");
        print(registerBody.name + " name =============================");

        RegisterModel registerModel =
            RegisterModel.fromJson(response.body as Map<String, dynamic>);
        return Right(registerModel);
      } else {
        print(registerBody.email + " email =============================");
        print(registerBody.name + " name =============================");

        return Left(RemoteFailure("Failed to register"));
      }
    } catch (ex) {
      return left(RemoteFailure("${ex.toString()}======================"));
    }

    ///
  }
}

class LocalRegisterDataSource extends RegisterDataSource {
  @override
  Future<Either<FailureError, RegisterModel>> register(
      RegisterBody registerBody) {
    // TODO: implement register
    throw UnimplementedError();
  }
}