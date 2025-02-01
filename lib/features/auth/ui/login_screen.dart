import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickup/core/helpers/extensions.dart';
import 'package:pickup/core/theming/colors.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/routing/routes.dart';
import '../../../core/theming/styles.dart';

import '../../../core/widgets/app_text_button.dart';
import '../logic/cubit/login_cubit.dart';
import '../logic/cubit/login_state.dart';
import 'widgets/dont_have_account_text.dart';
import 'widgets/email_and_password.dart';
import 'widgets/login_bloc_listener.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});



  @override
  Widget build(BuildContext context) {
    final loginCubit = context.read<LoginCubit>();


    WidgetsBinding.instance.addPostFrameCallback((_) {
      loginCubit.loadSavedLoginData();
    });

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'Login',
                    style: TextStyles.font24BlueBold,
                  ),
                ),
                verticalSpace(100),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const EmailAndPassword(),
                    verticalSpace(24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            BlocBuilder<LoginCubit, LoginState>(
                              builder: (context, state) {
                                final cubit = context.read<LoginCubit>();

                                return Checkbox(
                                  value: cubit.isRememberMeChecked,
                                  onChanged: (value) {
                                    cubit.toggleRememberMe();
                                  },
                                  activeColor: ColorsManager.mainBlue,
                                );
                              },
                            ),
                            Text(
                              'Remember Me',
                              style: TextStyles.font13BlueRegular,
                            ),
                          ],
                        ),
                        Text(
                          'Forgot Password?',
                          style: TextStyles.font13BlueRegular,
                        ),
                      ],
                    ),
                    verticalSpace(100),
                    AppTextButton(
                      buttonText: "Login",
                      textStyle: TextStyles.font16WhiteSemiBold,
                      onPressed: () {
                        validateThenDoLogin(context);
                      },
                    ),
                    verticalSpace(16),
                    verticalSpace(60),
                    const LoginBlocListener(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDoLogin(BuildContext context) {
    // context.pushNamed(Routes.homeScreen);

    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      // context.pushNamed(Routes.homeScreen);
      context.read<LoginCubit>().emitLoginStates();
    }
  }
}
