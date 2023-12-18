import 'package:dartz/dartz.dart';
import 'package:sigin_lang_app/core/errors/failures.dart';
import 'package:sigin_lang_app/features/register_screen/domain/entities/register_body.dart';
import 'package:sigin_lang_app/features/register_screen/domain/entities/register_entity.dart';
import 'package:sigin_lang_app/features/sign_to_language_screen/domain/entities/sign_to_language_body.dart';

import '../entities/sign_to_language_entity.dart';
import '../repositories/domain_repo.dart';

class SignToLanguageVideoTranslateUseCase {
  SignToLanguageVideoTranslateUseCase(this.signToLanguageDomainRepository);

  SignToLanguageDomainRepository signToLanguageDomainRepository;

  Future<Either<FailureError, SignToLanguageEntity>> call(
      SignToLanguageBody signToLanguageBody) {
    return signToLanguageDomainRepository
        .signToLanguageVideoTranslate(signToLanguageBody);
  }
}
