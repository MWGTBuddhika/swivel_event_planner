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
            builder: (context,UserProfileState) {
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
                        Gap(15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Jane Cooper", style: ThemeTextStyles.subtitlesS2),
                            Text("jane.c@gmail.com", style: ThemeTextStyles.subTextStyle)
                          ],
                        ),
                      ],
                    ),
                    Gap(20),
                    Row(
                      children: [
                        Icon(CupertinoIcons.square_arrow_left,size: 20,color: ColorPallet.primaryColor),
                        Gap(10),
                        Text(Constants.logout, style: ThemeTextStyles.subtitlesS2.copyWith(
                          color: ColorPallet.primaryColor,fontWeight: FontWeight.bold
                        )),
                      ],
                    ),
                  ],
                ),
              );
            }
        )
    );
  }
}
