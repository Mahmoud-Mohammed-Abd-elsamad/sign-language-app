import 'package:dartz/dartz.dart';
import 'package:sigin_lang_app/core/errors/failures.dart';
import 'package:sigin_lang_app/features/sign_to_language_screen/domain/entities/sign_to_language_body.dart';
import 'package:sigin_lang_app/features/sign_to_language_screen/domain/entities/sign_to_language_entity.dart';

import '../../domain/repositories/domain_repo.dart';
import '../data_sources/data_source.dart';

class SignToLanguageDataRepository extends SignToLanguageDomainRepository {
  SignToLanguageDataRepository(this.signToLanguageDataSource);

  SignToLanguageDataSource signToLanguageDataSource;

  @override
  Future<Either<FailureError, SignToLanguageEntity>>
      signToLanguageVideoTranslate(SignToLanguageBody signToLanguageBody) {
    return signToLanguageDataSource
        .signToLanguageVideoTranslate(signToLanguageBody);
  }
}
