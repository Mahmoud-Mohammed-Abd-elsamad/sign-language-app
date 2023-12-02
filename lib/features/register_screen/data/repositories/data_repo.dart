import 'package:dartz/dartz.dart';
import 'package:sigin_lang_app/core/errors/failures.dart';
import 'package:sigin_lang_app/features/register_screen/data/data_sources/data_source.dart';
import 'package:sigin_lang_app/features/register_screen/domain/entities/register_body.dart';
import 'package:sigin_lang_app/features/register_screen/domain/entities/register_entity.dart';
import 'package:sigin_lang_app/features/register_screen/domain/repositories/domain_repo.dart';

class RegisterDataRepository extends RegisterDomainRepository{
  RegisterDataRepository(this.registerDataSource);

  RegisterDataSource registerDataSource;


  @override
  Future<Either<FailureError, RegisterEntity>> register(RegisterBody registerBody) {
    return registerDataSource.register(registerBody);
  }
}