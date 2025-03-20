import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../theme/color_pallet.dart';
import '../util/constants.dart';

class Button extends StatelessWidget {
  final Color? color;
  final Color textColor;
  final String text;
  final VoidCallback onPressed;
  final IconData? icon;
  final bool isIconAtLeft;
  final bool showIcon;
  final bool isDisabled;

  Button(
      {this.color,
      this.textColor = ColorPallet.white,
      required this.text,
        this.icon,
        this.isIconAtLeft=false,
        this.showIcon=true,
        this.isDisabled =false,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: isDisabled,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: isDisabled? ColorPallet.primaryDisabledColor:
                  color ?? ColorPallet.primaryColor,
                  padding: EdgeInsets.symmetric(vertical: 9, horizontal: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          showIcon && isIconAtLeft?
                          Icon(icon?? Icons.arrow_forward,size: 20,color: textColor,):SizedBox.shrink(),
                          Gap(10),
                          Text(
                            text,
                            overflow: TextOverflow.fade,
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                              color: textColor,
                            ),
                          ),
                          Gap(10),
                          showIcon && !isIconAtLeft?
                          Icon(icon?? Icons.arrow_forward,size: 20,color: textColor,):SizedBox.shrink(),
                        ],
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
