import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../theme/color_pallet.dart';
import '../util/constants.dart';

class Button extends StatelessWidget {
  final Color color;
  final Color textColor;
  final String text;
  final VoidCallback onPressed;
  final IconData? icon;
  final bool isIconAtLeft;
  final bool showIcon;

  Button(
      {this.color = ColorPallet.primaryColor,
      this.textColor = ColorPallet.white,
      required this.text,
        this.icon,
        this.isIconAtLeft=false,
        this.showIcon=true,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: color,
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
    );
  }
}
