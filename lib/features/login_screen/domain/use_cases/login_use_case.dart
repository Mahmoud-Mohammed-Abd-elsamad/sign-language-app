import 'package:dartz/dartz.dart';
import 'package:sigin_lang_app/core/errors/failures.dart';
import 'package:sigin_lang_app/features/login_screen/domain/entities/login_body.dart';
import 'package:sigin_lang_app/features/login_screen/domain/repositories/domain_repo.dart';
import 'package:sigin_lang_app/features/register_screen/domain/entities/register_body.dart';
import 'package:sigin_lang_app/features/register_screen/domain/entities/register_entity.dart';

class LoginUseCase {
  LoinDomainRepo domainRepo;

  LoginUseCase({required this.domainRepo});

  Future<Either<FailureError, RegisterEntity>> call(LoginBody body) {
    return domainRepo.login(body);
  }
}
