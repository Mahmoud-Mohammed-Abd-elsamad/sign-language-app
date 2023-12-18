import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:sigin_lang_app/core/errors/failures.dart';
import 'package:sigin_lang_app/features/register_screen/data/data_sources/data_source.dart';
import 'package:sigin_lang_app/features/register_screen/data/repositories/data_repo.dart';
import 'package:sigin_lang_app/features/register_screen/domain/entities/register_body.dart';
import 'package:sigin_lang_app/features/register_screen/domain/entities/register_entity.dart';
import 'package:sigin_lang_app/features/register_screen/domain/repositories/domain_repo.dart';
import 'package:sigin_lang_app/features/register_screen/domain/use_cases/register_use_case.dart';

import '../../domain/entities/register_entity.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {

  RegisterDataSource registerDataSource;

  RegisterCubit(this.registerDataSource) : super(RegisterInitial());

  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  var obscureText = true;
  var confirmPassword = false;

  obscureTextFunction() {
    obscureText = !obscureText;
    emit(RegisterInitial());
  }

  register() async {
    emit(RegisterLoading());

    RegisterDomainRepository registerDomainRepo =
        RegisterDataRepository(registerDataSource);
    RegisterUseCase useCse = RegisterUseCase(registerDomainRepo);

    var result = await useCse.call(RegisterBody(
        name: nameController.text,
        email: emailController.text,
        password: passController.text,
        rePassword: passController.text));

    result.fold((l) {
      emit(RegisterFailure(l));
      print(l.errorMessage + "  #error#");
    }, (r) {
      emit(RegisterSuccess(r));
    });
  }

  void confirmPasswordFunction(String value) {
    if (value == passController.text) {
      emit(RegisterInitial());
      confirmPassword = true;
    } else {
      emit(RegisterInitial());
      confirmPassword = false;
    }
  }
//  {
//
//    // remain data source implementation
//    print("register method --------------------------------------------");
//
//    emit(RegisterLoading());
//    RegisterDomainRepository registerDomainRepository =  RegisterDataRepository(registerDataSource);
//   RegisterUseCase useCase = RegisterUseCase(registerDomainRepository);
//
//   var result  = await useCase.call(RegisterBody(name:nameController.text, email: emailController.text, password: passController.text, rePassword: repassController.text));
//
//   result.fold((l) => {
//
//   emit(RegisterFailure(l))
//
//   }, (r) => {
//
//     emit(RegisterSuccess(r))
//   });
//
//
//
// }
}
