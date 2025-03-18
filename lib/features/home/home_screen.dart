import 'package:auto_route/annotations.dart';
import 'package:event_planner/features/home/widgets/drawer.dart';
import 'package:event_planner/features/home/widgets/horizontal_photo_list.dart';
import 'package:event_planner/features/home/widgets/image_slider.dart';
import 'package:event_planner/features/home/widgets/organizers_list.dart';
import 'package:event_planner/shared_components/theme/color_pallet.dart';
import 'package:event_planner/shared_components/util/constants.dart';
import 'package:event_planner/shared_components/widgets/page_base.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../shared_components/theme/text_styles.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PageBase(
        showAppBar: false,
        bodyObservesSafeArea: false,
        resizeToAvoidBottomInset: false,
        drawer: AppDrawer(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageSlider(),
              Gap(20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text("Event Name", style: ThemeTextStyles.headingH5),
              ),
              Gap(10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text("Address", style: ThemeTextStyles.subTextStyle),
              ),
              Gap(20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(Constants.organizers, style: ThemeTextStyles.headingH5),
              ),
              Gap(15),
              OrganizersList(),
              Gap(20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Text(Constants.photos, style: ThemeTextStyles.headingH5),
                    Spacer(),
                    Text(Constants.allPhotos, style: ThemeTextStyles.subTextStyle.copyWith(color: ColorPallet.primaryColor)),
                    Gap(5),
                    Icon(Icons.arrow_forward,color: ColorPallet.primaryColor,size: 20,)
                  ],
                ),
              ),
              Gap(15),
              HorizontalPhotoList(),
              Gap(20),
              Align(
                alignment: Alignment.center,
                child: Text("16", style: ThemeTextStyles.text19.copyWith(
                  color: ColorPallet.primaryColor,fontWeight: FontWeight.w700
                )),
              ),
              Align(
                  alignment: Alignment.center,
                  child: Text(Constants.posts,maxLines: 4, overflow: TextOverflow.ellipsis, style: ThemeTextStyles.subTextStyle)),
              Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: ColorPallet.lightGrey),
                    )
                ),
              ),
              Gap(50),
            ],
          ),
        )
    );
  }
}
