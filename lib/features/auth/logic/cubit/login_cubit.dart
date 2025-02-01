import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:pickup/features/auth/data/models/login_request_body.dart';
import 'package:pickup/features/auth/data/repos/login_repo.dart';

import '../../../../core/helpers/constants.dart';
import '../../../../core/helpers/shared_pref_helper.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/dio_factory.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;

  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  bool isRememberMeChecked = false;

  // void emitLoginStates(LoginRequestBody loginRequestBody) async {
  //   emit(const LoginState.loading());
  //   final response = await _loginRepo.login(loginRequestBody);
  //
  //   response.when(
  //     success: (loginResponse){
  //       emit(LoginState.success(loginResponse));
  //     },
  //     failure: (ErrorHandler error){
  //       emit(LoginState.error(error: error.apiErrorModel.message ?? ''));
  //     },
  //   );
  // }

  void emitLoginStates() async {
    emit(const LoginState.loading());
    final response = await _loginRepo.login(
      LoginRequestBody(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
    response.when(success: (loginResponse) async {
      if (isRememberMeChecked) {
        await SharedPrefHelper.setSecuredString("email", emailController.text);
        await SharedPrefHelper.setSecuredString("password", passwordController.text);
      }
      await SharedPrefHelper.setSecuredString("username", loginResponse.data?.user?.name ?? '');
      await saveUserToken(loginResponse.data?.access_token ?? '');
      emit(LoginState.success(loginResponse));
    }, failure: (error) {
      emit(LoginState.error(error: error.apiErrorModel.message ?? ''));
    });
  }



  Future<void> loadSavedLoginData() async {
    final savedEmail = await SharedPrefHelper.getSecuredString("email");
    final savedPassword =
    await SharedPrefHelper.getSecuredString("password");
    final savedRememberMe =
        await SharedPrefHelper.getBool("remember_me") ?? false;

    if (savedRememberMe) {
      emailController.text = savedEmail ?? "";
      passwordController.text = savedPassword ?? "";
      isRememberMeChecked = savedRememberMe;
      emit(LoginState.rememberMeChanged(isRememberMeChecked));
    }
  }


  Future<void> saveUserToken(String token) async {
    await SharedPrefHelper.setSecuredString(SharedPrefKeys.userToken, token);
    DioFactory.setTokenIntoHeaderAfterLogin(token);
  }

  void toggleRememberMe() async{
    isRememberMeChecked = !isRememberMeChecked;
    SharedPrefHelper.setData("remember_me", isRememberMeChecked);
    emit(LoginState.rememberMeChanged(isRememberMeChecked));
  }
}
