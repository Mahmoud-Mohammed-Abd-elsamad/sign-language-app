import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sigin_lang_app/core/errors/failures.dart';
import 'package:sigin_lang_app/features/sign_to_language_screen/data/data_sources/data_source.dart';
import 'package:sigin_lang_app/features/sign_to_language_screen/data/repositories/data_repo.dart';
import 'package:sigin_lang_app/features/sign_to_language_screen/domain/entities/sign_to_language_body.dart';
import 'package:sigin_lang_app/features/sign_to_language_screen/domain/entities/sign_to_language_entity.dart';
import 'package:sigin_lang_app/features/sign_to_language_screen/domain/repositories/domain_repo.dart';
import 'package:sigin_lang_app/features/sign_to_language_screen/domain/use_cases/register_use_case.dart';

part 'sign_to_language_state.dart';

class SignToLanguageCubit extends Cubit<SignToLanguageState> {
  SignToLanguageCubit({required this.signToLanguageDataSource})
      : super(SignToLanguageInitial());

  SignToLanguageDataSource signToLanguageDataSource;

  signToLanguageTranslateVideo(SignToLanguageBody body) async {
    emit(SignToLanguageTranslateLoading());

    SignToLanguageDomainRepository signToLanguageDomainRepository =
        SignToLanguageDataRepository(signToLanguageDataSource);
    SignToLanguageVideoTranslateUseCase useCase =
        SignToLanguageVideoTranslateUseCase(signToLanguageDomainRepository);

    var result = await useCase.call(SignToLanguageBody(
        name: "",
        email: "email",
        password: "password",
        rePassword: "rePassword"));

    result.fold((l) {
      emit(SignToLanguageTranslateFailed(l));
    }, (r) {
      emit(SignToLanguageTranslateSuccess(r));
    });
  }
}
