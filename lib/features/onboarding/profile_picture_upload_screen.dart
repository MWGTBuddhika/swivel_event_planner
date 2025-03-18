
import 'package:auto_route/annotations.dart';
import 'package:event_planner/core/route/app_router.gr.dart';
import 'package:event_planner/shared_components/widgets/next_button.dart';
import 'package:event_planner/shared_components/theme/text_styles.dart';
import 'package:event_planner/shared_components/util/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import '../../../shared_components/theme/color_pallet.dart';

import '../../../core/route/app_router.dart';
import '../../shared_components/widgets/page_base.dart';
import '../user_profile/blocs/user_profile_bloc.dart';
@RoutePage()
class ProfilePictureUploadScreen extends StatelessWidget {
  ProfilePictureUploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PageBase(
      showAppBar: false,
      bodyObservesSafeArea: false,
      resizeToAvoidBottomInset: false,
      body: BlocBuilder<UserProfileBloc,UserProfileState>(
          builder: (context,userprofileState) {
            return Container(
              height: MediaQuery.of(context).size.height,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Gap(MediaQuery.of(context).size.height*0.3),
                    Text(Constants.welcome, style: ThemeTextStyles.loginWelcomeTextStyle),
                    Gap(12),
                    Text(Constants.uploadPictureDesc,
                        style: ThemeTextStyles.subTextStyle,
                    textAlign: TextAlign.center,),
                    Gap(50),
                    GestureDetector(
                      onTap: (){
                        context.read<UserProfileBloc>().add(PickAndUploadUserImage());
                      },
                      child: Container(
                        width: 116,
                        height: 116,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorPallet.fadedOrange
                        ),
                        child:
                         userprofileState.userProfile.imageUrl.isNotEmpty?
                         Image.network(
                           userprofileState.userProfile.imageUrl,
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
                         ):
                         Icon(Icons.camera_alt_outlined,color: ColorPallet.primaryColor),
                      ),
                    ),
                    Spacer(),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Button(
                          text: Constants.next,
                          onPressed: () {
                            appRouter.navigate(PersonalInformationRoute());
                          }),
                    ),
                    Gap(50),
                  ],
                ),
              ),
            );
          }
      ),
    );
  }
}
