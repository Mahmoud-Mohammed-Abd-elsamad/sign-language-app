import 'package:dartz/dartz.dart';
import 'package:sigin_lang_app/features/register_screen/data/models/register_mode.dart';
import 'package:sigin_lang_app/features/register_screen/domain/entities/register_body.dart';

import '../../../../core/errors/failures.dart';
import '../../domain/entities/register_entity.dart';

abstract class RegisterDataSource{

  Future<Either<FailureError,RegisterModel>> register(RegisterBody registerBody);

}


class RemoteDataSource extends RegisterDataSource{
  @override
  Future<Either<FailureError, RegisterModel>> register(RegisterBody registerBody) {
    // TODO: implement register
    throw UnimplementedError();
  }

}

class LocalDataSource extends RegisterDataSource{
  @override
  Future<Either<FailureError, RegisterModel>> register(RegisterBody registerBody) {
    // TODO: implement register
    throw UnimplementedError();
  }

}