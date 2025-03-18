import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../shared_components/theme/color_pallet.dart';
import '../../shared_components/theme/text_styles.dart';
class AppSnackBar{

  SnackBar showSnackBar({
    required String title,
    required String subTitle,
    Color snackBarColor = ColorPallet.defaultColor,
    TextStyle? titleStyle,
    TextStyle? subTitleStyle,
  }){
    return  SnackBar(
      duration: Duration(seconds: 2),
      padding: EdgeInsets.only(left: 10,right: 10,top: 30,bottom: 10),
      backgroundColor: Colors.transparent,elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14))),
      content: GestureDetector(
        onTap: () {
          ScaffoldMessenger.of(Get.context!).hideCurrentSnackBar(reason: SnackBarClosedReason.dismiss);
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 4,horizontal: 4),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(14)),
              color: Colors.black,
              boxShadow:[ BoxShadow(
                  color: Colors.black.withOpacity(.50),
                  //offset: const Offset(5, -5),
                  blurRadius: 10)]
          ),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10,horizontal: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: snackBarColor,
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                              title,
                              textAlign: TextAlign.center,
                              style:titleStyle?? ThemeTextStyles.headingH6.copyWith(
                                  color: Colors.black
                              )
                          ),
                          Gap(5),
                          Text(
                              subTitle,
                              textAlign: TextAlign.center,
                              //overflow: TextOverflow.ellipsis,
                              style:subTitleStyle??ThemeTextStyles.bodyTextB2.copyWith(
                                  color: Colors.black
                              )
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}