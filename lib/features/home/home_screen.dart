import 'dart:math';

import 'package:auto_route/annotations.dart';
import 'package:event_planner/core/route/app_router.dart';
import 'package:event_planner/core/route/app_router.gr.dart';
import 'package:event_planner/features/home/blocs/home_bloc.dart';
import 'package:event_planner/features/home/widgets/app_drawer.dart';
import 'package:event_planner/features/home/widgets/horizontal_photo_list.dart';
import 'package:event_planner/features/home/widgets/image_slider.dart';
import 'package:event_planner/features/home/widgets/organizers_list.dart';
import 'package:event_planner/shared_components/theme/color_pallet.dart';
import 'package:event_planner/shared_components/util/constants.dart';
import 'package:event_planner/shared_components/widgets/page_base.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../shared_components/theme/text_styles.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc,HomeState>(
      builder: (context,homeState) {
        final random = Random();
        return PageBase(
            showAppBar: false,
            bodyObservesSafeArea: false,
            resizeToAvoidBottomInset: false,
            showProgress: homeState.isAnyDataLoading,
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ImageSlider(),
                  Gap(20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(homeState.sliderImages.isNotEmpty?
                    homeState.sliderImages[random.nextInt(homeState.sliderImages.length)].title??"":"",
                        style: ThemeTextStyles.headingH5),
                  ),
                  Gap(10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text("56 O'Mally Road, ST LEONARDS, 2065, NSW", style: ThemeTextStyles.subTextStyle),
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
                  InkWell(
                    onTap: (){
                      appRouter.navigate(PostsRoute());
                    },
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Text("${homeState.posts.length}", style: ThemeTextStyles.text19.copyWith(
                              color: ColorPallet.primaryColor,fontWeight: FontWeight.w700
                          )),
                        ),
                        Align(
                            alignment: Alignment.center,
                            child: Text(Constants.posts,maxLines: 4, overflow: TextOverflow.ellipsis,
                                style: ThemeTextStyles.subTextStyle)),
                      ],
                    ),
                  ),
                  Gap(10),
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
    );
  }
}
