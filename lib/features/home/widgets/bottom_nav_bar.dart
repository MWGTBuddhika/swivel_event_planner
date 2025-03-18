import 'package:event_planner/shared_components/theme/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/route/app_router.dart';
import '../../../shared_components/theme/color_pallet.dart';
import '../../../shared_components/util/constants.dart';

class BottomTabNavigationBar extends StatelessWidget {
  const BottomTabNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      surfaceTintColor: ColorPallet.black,
      color: ColorPallet.black,
      height: 80,
      padding: EdgeInsets.zero,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          color: ColorPallet.black,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0.2,
              blurRadius: 5,
              offset: Offset(0, -5), // changes position of shadow
            ),
          ],
        ),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: (){
                    tabsRouter.setActiveIndex(0);
                  },
                  icon: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                    child: Column(
                      children: [
                        Icon(CupertinoIcons.home ,size: 25,
                          color: ColorPallet.lightGrey,),
                        Text(Constants.home,style: ThemeTextStyles.captionC1.copyWith(
                          color: ColorPallet.lightGrey
                        ),)
                      ],
                    ),
                  )
              ),
              IconButton(
                  onPressed: (){
                    tabsRouter.setActiveIndex(1);
                  },
                  icon: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                    child: Column(
                      children: [
                        Icon(CupertinoIcons.square_grid_2x2 ,size: 25,
                          color: ColorPallet.lightGrey,),
                        Text(Constants.profile,style: ThemeTextStyles.captionC1.copyWith(
                            color: ColorPallet.lightGrey
                        ),)
                      ],
                    ),
                  )
              ),
            ]
        ),
      ),
    );
  }
}
