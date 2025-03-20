import 'package:event_planner/features/login/blocs/login_bloc.dart';
import 'package:event_planner/features/user_profile/blocs/user_profile_bloc.dart';
import 'package:event_planner/shared_components/util/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../shared_components/theme/color_pallet.dart';
import '../../../shared_components/theme/text_styles.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final double drawerWidth= MediaQuery.of(context).size.width*0.85;
    return Drawer(
        width: drawerWidth,
        elevation: 0,
        backgroundColor: ColorPallet.white,
        shape: const RoundedRectangleBorder(),
        child: BlocBuilder<UserProfileBloc,UserProfileState>(
            builder: (context,userProfileState) {
              return Padding(
                padding: EdgeInsets.only(top: 60,left: 15,right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 50,
                          height: 50,
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            child: Image.network(
                              userProfileState.userProfile.imageUrl,
                              fit: BoxFit.cover,
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
                        Gap(15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${userProfileState.userProfile.firstName} ${userProfileState.userProfile.lastName}", style: ThemeTextStyles.subtitlesS2),
                            Text("${userProfileState.userProfile.email}", style: ThemeTextStyles.subTextStyle)
                          ],
                        ),
                      ],
                    ),
                    Gap(20),
                    InkWell(
                      onTap: (){
                        context.read<LoginBloc>().add(UserLogout());
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(CupertinoIcons.square_arrow_left,size: 20,color: ColorPallet.primaryColor),
                          Gap(10),
                          Text(Constants.logout, style: ThemeTextStyles.subtitlesS2.copyWith(
                            color: ColorPallet.primaryColor,fontWeight: FontWeight.bold
                          )),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
        )
    );
  }
}
