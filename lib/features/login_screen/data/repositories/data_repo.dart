import 'package:dartz/dartz.dart';
import 'package:sigin_lang_app/core/errors/failures.dart';
import 'package:sigin_lang_app/features/login_screen/data/data_sources/data_source.dart';
import 'package:sigin_lang_app/features/login_screen/domain/entities/login_body.dart';
import 'package:sigin_lang_app/features/login_screen/domain/repositories/domain_repo.dart';
import 'package:sigin_lang_app/features/register_screen/domain/entities/register_body.dart';
import 'package:sigin_lang_app/features/register_screen/domain/entities/register_entity.dart';

class LoginDataRepo extends LoinDomainRepo {
  LoginDataSource dataSource;

  LoginDataRepo({required this.dataSource});

  @override
  Future<Either<FailureError, RegisterEntity>> login(LoginBody body) {
    return dataSource.login(body);
  }
}
