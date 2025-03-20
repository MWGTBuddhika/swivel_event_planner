import 'package:event_planner/features/home/blocs/home_bloc.dart';
import 'package:event_planner/shared_components/theme/color_pallet.dart';
import 'package:event_planner/shared_components/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../shared_components/theme/text_styles.dart';

class HorizontalPhotoList extends StatelessWidget {
  const HorizontalPhotoList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc,HomeState>(
      builder: (context,homeState) {
        return Container(
          height: 300,
          child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 20),
              itemBuilder: (context, index) {
                return  Container(
                  width: 250,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: ColorPallet.lightGrey),
                      left: BorderSide(color: ColorPallet.lightGrey),
                      right: index==9? BorderSide(color: ColorPallet.lightGrey) : BorderSide.none,
                      top: BorderSide(color: ColorPallet.lightGrey)
                    )
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 130,
                        width: 250,
                        child: Image.network(
                          Constants().getRandomImageUrl(),
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
                      Gap(10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(homeState.sliderImages.isNotEmpty? homeState.sliderImages[index].title??"":"",
                          style: ThemeTextStyles.subtitlesS2.copyWith(
                          fontWeight: FontWeight.bold
                        ),),
                      ),
                      Gap(10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(homeState.sliderImages.isNotEmpty?  homeState.sliderImages[index].title??"":"",
                          maxLines: 4, overflow: TextOverflow.ellipsis, style: ThemeTextStyles.subTextStyle,),
                      ),
                    ],
                  ),
                );
              }
          ),
        );
      }
    );
  }
}
