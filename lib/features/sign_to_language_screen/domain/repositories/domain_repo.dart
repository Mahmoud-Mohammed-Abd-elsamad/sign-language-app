import 'package:dartz/dartz.dart';
import 'package:sigin_lang_app/features/register_screen/domain/entities/register_body.dart';

import '../../../../core/errors/failures.dart';
import '../entities/sign_to_language_body.dart';
import '../entities/sign_to_language_entity.dart';

abstract class SignToLanguageDomainRepository {
  Future<Either<FailureError, SignToLanguageEntity>>
      signToLanguageVideoTranslate(SignToLanguageBody signToLanguageBody);
}
