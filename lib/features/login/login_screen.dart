
import 'package:auto_route/annotations.dart';
import 'package:event_planner/core/route/app_router.gr.dart';
import 'package:event_planner/shared_components/widgets/next_button.dart';
import 'package:event_planner/shared_components/widgets/text_input.dart';
import 'package:event_planner/shared_components/widgets/password_input.dart';
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
import 'blocs/login_bloc.dart';
@RoutePage()
class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc,LoginState>(
        builder: (context,loginState) {
        return PageBase(
          showAppBar: false,
          bodyObservesSafeArea: false,
          resizeToAvoidBottomInset: false,
          showProgress: loginState.isLoading,
          body: SingleChildScrollView(
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
                            labelText: Constants.email,
                            hintText: Constants.email,
                            prefixIcon: const Icon(
                              Icons.email_outlined,
                              color: ColorPallet.darkGrey,
                            ),
                            errorText: loginState.emailErrorText.isNotEmpty?loginState.emailErrorText:null,
                            onChanged: (text){
                              context.read<LoginBloc>().add(CheckUserEmailInputs(text: text));
                            },
                          ),
                          Gap(20),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(Constants.password, style: ThemeTextStyles.loginPasswordTextStyle)),
                          ),
                          Gap(5),
                          PasswordInput(
                            hintText: Constants.password,
                            errorText:  loginState.passwordErrorText.isNotEmpty?loginState.passwordErrorText:null,
                            onChanged: (text){
                              context.read<LoginBloc>().add(CheckUserPasswordInputs(text: text));
                            },
                          ),
                          Gap(10),
                          Align(
                              alignment: Alignment.centerRight,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(Constants.restorePassword, style: ThemeTextStyles.loginRestorePasswordTextStyle),
                                  Gap(5),
                                  Icon(CupertinoIcons.arrow_up_right,color: ColorPallet.primaryColor,size: 20,)
                                ],
                              )),
                          Gap(160),
                          Button(
                              text: Constants.login,
                              isDisabled: !loginState.isLoginFieldsValidated,
                              onPressed:(){
                                context.read<LoginBloc>().add(UserLogin());
                              }),
                          Gap(15),
                          Button(
                              text: Constants.signup,
                              onPressed: () {
                            appRouter.replaceAll([SignupRoute()]);
                          }),
                          Spacer(),
                          MediaQuery.of(context).viewInsets.bottom <= 50? SizedBox.shrink():Gap(300),
                        ],
                      ),
                    ),
                  ),
                )

        );
      }
    );
  }
}
