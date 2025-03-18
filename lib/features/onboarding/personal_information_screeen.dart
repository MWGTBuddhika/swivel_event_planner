
import 'package:auto_route/annotations.dart';
import 'package:event_planner/core/route/app_router.gr.dart';
import 'package:event_planner/shared_components/theme/color_pallet.dart';
import 'package:event_planner/shared_components/widgets/next_button.dart';
import 'package:event_planner/shared_components/widgets/text_input.dart';
import 'package:event_planner/shared_components/theme/text_styles.dart';
import 'package:event_planner/shared_components/util/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import '../../core/route/app_router.dart';
import '../../shared_components/widgets/page_base.dart';
import '../user_profile/blocs/user_profile_bloc.dart';
@RoutePage()
class PersonalInformationScreen extends StatelessWidget {
  PersonalInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PageBase(
      showAppBar: false,
      bodyObservesSafeArea: false,
      resizeToAvoidBottomInset: true,
      body: BlocBuilder<UserProfileBloc,UserProfileState>(
          builder: (context,userProfileState) {
            return SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Gap(50),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(Constants.personalInfo, style: ThemeTextStyles.personalInfoTextStyle)),
                      Gap(8),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(Constants.personalInfoDesc,
                          style: ThemeTextStyles.subTextStyle,
                          textAlign: TextAlign.center,),
                      ),
                      Gap(20),
                      TextInput(
                        labelText: Constants.firstName,
                        hintText: Constants.firstName,
                        errorText: userProfileState.isFirstNameInvalid?
                        userProfileState.userProfileValidations.firstNameErrorText:null,
                        onChanged: (text){
                          context.read<UserProfileBloc>().add(ValidateFirstName(text: text));
                        },
                      ),
                      Gap(15),
                      TextInput(
                        labelText: Constants.lastName,
                        hintText: Constants.lastName,
                        errorText: userProfileState.isLastNameInvalid?
                        userProfileState.userProfileValidations.lastNameErrorText:null,
                        onChanged: (text){
                          context.read<UserProfileBloc>().add(ValidateLastName(text: text));
                        },
                      ),
                      Gap(15),
                      TextInput(
                        labelText: Constants.email,
                        hintText: Constants.email,
                        errorText: userProfileState.isEmailInvalid?
                        userProfileState.userProfileValidations.emailErrorText:null,
                        onChanged: (text){
                          context.read<UserProfileBloc>().add(ValidateEmail(text: text));
                        },
                      ),
                      Gap(15),
                      TextInput(
                        labelText: Constants.phoneNumber,
                        hintText: Constants.phoneNumber,
                        errorText: userProfileState.isPhoneNumberInvalid?
                        userProfileState.userProfileValidations.phoneNumberErrorText:null,
                        onChanged: (text){
                          context.read<UserProfileBloc>().add(ValidatePhoneNumber(text: text));
                        },
                      ),
                      Gap(15),
                      TextInput(
                        labelText: Constants.mailingAddress,
                        hintText: Constants.mailingAddress,
                        errorText: userProfileState.isAddressInvalid?
                        userProfileState.userProfileValidations.mailingAddressErrorText:null,
                        onChanged: (text){
                          context.read<UserProfileBloc>().add(ValidateMailingAddress(text: text));
                        },
                      ),
                      Spacer(),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          children: [
                            Flexible(
                              flex: 1,
                              child: Button(
                                  text: Constants.back,
                                  color: ColorPallet.fadedOrange,
                                  textColor: ColorPallet.darkGrey,
                                  isIconAtLeft: true,
                                  icon: Icons.arrow_back,
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  }),
                            ),
                            Gap(10),
                            Flexible(
                              flex: 1,
                              child: Button(
                                  text: Constants.next,
                                  onPressed: () {
                                    appRouter.replaceAll([DashboardRoute()]);
                                  }),
                            ),
                          ],
                        ),
                      ),
                      Gap(50),
                    ],
                  ),
                ),
              ),
            );
          }
      ),
    );
  }
}
