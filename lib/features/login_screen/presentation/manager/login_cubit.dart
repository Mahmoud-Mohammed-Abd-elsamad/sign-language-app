import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:sigin_lang_app/features/login_screen/data/data_sources/data_source.dart';
import 'package:sigin_lang_app/features/login_screen/data/repositories/data_repo.dart';
import 'package:sigin_lang_app/features/login_screen/domain/entities/login_body.dart';
import 'package:sigin_lang_app/features/login_screen/domain/repositories/domain_repo.dart';
import 'package:sigin_lang_app/features/login_screen/domain/use_cases/login_use_case.dart';

import '../../../../core/errors/failures.dart';
import '../../../register_screen/domain/entities/register_entity.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.loginDataSource}) : super(LoginInitial());
  LoginDataSource loginDataSource;

  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  var obscureText = true;

  obscureTextFunction() {
    obscureText = !obscureText;
    emit(LoginInitial());
  }

  login() async {
    emit(LoginLoading());

    LoinDomainRepo domainRepo = LoginDataRepo(dataSource: loginDataSource);
    LoginUseCase useCae = LoginUseCase(domainRepo: domainRepo);

    var result = await useCae.call(
        LoginBody(email: emailController.text, password: passController.text));

    result.fold((l) => emit(LoginFailure(l)), (r) => emit(LoginSuccess(r)));
  }
}
