import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:sigin_lang_app/features/login_screen/domain/entities/login_body.dart';
import 'package:sigin_lang_app/features/register_screen/domain/entities/register_body.dart';
import 'package:http/http.dart' as http;

import '../../../../core/errors/failures.dart';
import '../../../register_screen/data/models/register_mode.dart';

abstract class LoginDataSource {
  Future<Either<FailureError, RegisterModel>> login(LoginBody body);
}

class LocalLoginDataSource extends LoginDataSource {
  @override
  login(LoginBody body) {
    // TODO: implement login
    throw UnimplementedError();
  }
}

class RemoteLoginDataSource extends LoginDataSource {
  @override
  login(LoginBody body) async {
    try {
      var response = await http.post(
        Uri.parse(
            'http://12.34.56.78:80/sign-language/public/api/auth/register'),
        body: jsonEncode(<String, String>{
          "email": body.email,
          "password": body.password,
        }),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        print(body.email + " email =============================");
        print(body.password + " name =============================");

        RegisterModel registerModel =
            RegisterModel.fromJson(response.body as Map<String, dynamic>);
        return Right(registerModel);
      } else {
        print(body.email + " email =============================");

        return Left(RemoteFailure("Failed to register"));
      }
    } catch (ex) {
      return left(RemoteFailure("${ex.toString()}======================"));
    }

    ///
  }
}
