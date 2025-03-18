
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
class UserProfileScreen extends StatelessWidget {
  UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PageBase(
      showAppBar: false,
      bodyObservesSafeArea: false,
      resizeToAvoidBottomInset: true,
      body: BlocBuilder<UserProfileBloc,UserProfileState>(
          builder: (context,userProfileState) {
            return Stack(
              children: [
                SingleChildScrollView(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          Gap(50),
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.all(Radius.circular(50)),
                                    child: Image.network(
                                      "https://images.unsplash.com/photo-1579353977828-2a4eab540b9a?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                                      fit: BoxFit.fill,
                                      loadingBuilder:
                                          (context, child, loadingProgress) {
                                        if (loadingProgress == null) return child;
                                        return Center(
                                          child: CircularProgressIndicator(
                                            value: loadingProgress.expectedTotalBytes !=
                                                null
                                                ? loadingProgress
                                                .cumulativeBytesLoaded /
                                                (loadingProgress
                                                    .expectedTotalBytes ??
                                                    1)
                                                : null,
                                            color: ColorPallet.primaryColor,
                                          ),
                                        );
                                      },
                                      errorBuilder: (context, error, stackTrace) =>
                                          Icon(Icons.error),
                                    ),
                                  ),
                                ),
                              ),
                              Center(child: Text(Constants.profile, style: ThemeTextStyles.personalInfoTextStyle)),
                            ],
                          ),
                          Gap(10),
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(color: ColorPallet.lightGrey),
                                )
                            ),
                          ),
                          Gap(20),
                          SizedBox(
                            width: 150,
                            height: 150,
                            child: ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(100)),
                              child: Image.network(
                                "https://images.unsplash.com/photo-1579353977828-2a4eab540b9a?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                                fit: BoxFit.fill,
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return Center(
                                    child: CircularProgressIndicator(
                                      value: loadingProgress.expectedTotalBytes !=
                                          null
                                          ? loadingProgress
                                          .cumulativeBytesLoaded /
                                          (loadingProgress
                                              .expectedTotalBytes ??
                                              1)
                                          : null,
                                      color: ColorPallet.primaryColor,
                                    ),
                                  );
                                },
                                errorBuilder: (context, error, stackTrace) =>
                                    Icon(Icons.error),
                              ),
                            ),
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
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                    child: Button(
                        text: Constants.edit,
                        showIcon: false,
                        onPressed: () {

                        }),
                  ),
                )
              ],
            );
          }
      ),
    );
  }
}
