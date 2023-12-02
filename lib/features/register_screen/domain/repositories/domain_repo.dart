
import 'package:dartz/dartz.dart';
import 'package:sigin_lang_app/features/register_screen/domain/entities/register_body.dart';

import '../../../../core/errors/failures.dart';
import '../entities/register_entity.dart';

abstract class RegisterDomainRepository{

  Future<Either<FailureError,RegisterEntity>> register(RegisterBody registerBody);

}