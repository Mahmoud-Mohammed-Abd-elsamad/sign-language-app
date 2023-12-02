import 'package:dartz/dartz.dart';
import 'package:sigin_lang_app/core/errors/failures.dart';
import 'package:sigin_lang_app/features/register_screen/domain/entities/register_body.dart';
import 'package:sigin_lang_app/features/register_screen/domain/entities/register_entity.dart';

import '../repositories/domain_repo.dart';

class RegisterUseCase{
  RegisterUseCase(this.registerDomainRepository);

  RegisterDomainRepository registerDomainRepository;


 Future<Either<FailureError,RegisterEntity>> call(RegisterBody registerBody){
   return registerDomainRepository.register(registerBody);
  }

}
