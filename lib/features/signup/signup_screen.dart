
import 'package:auto_route/annotations.dart';
import 'package:event_planner/core/route/app_router.gr.dart';
import 'package:event_planner/shared_components/widgets/next_button.dart';
import 'package:event_planner/shared_components/widgets/text_input.dart';
import 'package:event_planner/shared_components/widgets/password_input.dart';
import 'package:event_planner/features/signup/blocs/signup_bloc.dart';
import 'package:event_planner/shared_components/theme/text_styles.dart';
import 'package:event_planner/shared_components/util/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import '../../../shared_components/theme/color_pallet.dart';

import '../../../core/route/app_router.dart';
import '../../shared_components/util/images.dart';
import '../../shared_components/widgets/page_base.dart';
@RoutePage()
class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupBloc,SignUpState>(
        builder: (context,signupState) {
        return PageBase(
          showAppBar: false,
          bodyObservesSafeArea: false,
          resizeToAvoidBottomInset: false,
          showProgress: signupState.isLoading,
          body: Stack(
            children: [
              Positioned.fill(
                child: SingleChildScrollView(
                  child: IntrinsicHeight(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          Gap(180),
                          Text(Constants.welcome, style: ThemeTextStyles.loginWelcomeTextStyle),
                          Gap(12),
                          Text(Constants.welcomeToYourPortal, style: ThemeTextStyles.subTextStyle),
                          Gap(60),
                          TextInput(
                            controller: _emailController,
                            labelText: Constants.email,
                            hintText: Constants.email,
                            prefixIcon: const Icon(
                              Icons.email_outlined,
                              color: ColorPallet.darkGrey,
                            ),
                            errorText: signupState.emailErrorText.isNotEmpty?signupState.emailErrorText:null,
                            onChanged: (text){
                              context.read<SignupBloc>().add(ValidateEmailInputs(text: text));
                            },
                          ),
                          Gap(15),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(Constants.password, style: ThemeTextStyles.loginPasswordTextStyle)),
                          ),
                          Gap(5),
                          PasswordInput(
                            controller: _passwordController,
                            hintText: Constants.password,
                            errorText:  signupState.passwordErrorText.isNotEmpty?signupState.passwordErrorText:null,
                            onChanged: (text){
                              context.read<SignupBloc>().add(ValidatePasswordInputs(text: text));
                            },
                          ),
                          Gap(15),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(Constants.confirmPassword, style: ThemeTextStyles.loginPasswordTextStyle)),
                          ),
                          Gap(5),
                          PasswordInput(
                            controller: _confirmPasswordController,
                            hintText: Constants.confirmPassword,
                            errorText:  signupState.confirmPasswordErrorText.isNotEmpty?signupState.confirmPasswordErrorText:null,
                            onChanged: (text){
                              context.read<SignupBloc>().add(ValidateConfirmPasswordInputs(text: text));
                            },
                          ),
                          Gap(140),
                          Button(
                              isDisabled: signupState.isSignupFormFieldsValidated,
                              text: Constants.signup,
                              onPressed:(){
                                context.read<SignupBloc>().add(UserSignup());
                              }),
                          Gap(15),
                          Button(
                              text: Constants.login,
                              onPressed:(){
                                appRouter.replaceAll([LoginRoute()]);
                              }),
                          Spacer(),
                          MediaQuery.of(context).viewInsets.bottom <= 50? SizedBox.shrink():Gap(300),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
        );
      }
    );
  }
}
