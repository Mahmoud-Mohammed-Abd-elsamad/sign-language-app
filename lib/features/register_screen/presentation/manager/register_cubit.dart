import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
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
  TextEditingController repassController = TextEditingController();


   register() async {

     // remain data source implementation
     print("register method --------------------------------------------");

     emit(RegisterLoading());
     RegisterDomainRepository registerDomainRepository =  RegisterDataRepository(registerDataSource);
    RegisterUseCase useCase = RegisterUseCase(registerDomainRepository);

    var result  = await useCase.call(RegisterBody(name: "name", email: "email", password: "password", rePassword: "rePassword"));

    result.fold((l) => {


      emit(RegisterFailure(l))

    }, (r) => {

      emit(RegisterSuccess(r))
    });



  }
}
