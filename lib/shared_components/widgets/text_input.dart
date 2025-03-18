import 'package:event_planner/shared_components/theme/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../theme/color_pallet.dart';


class TextInput extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final Icon? prefixIcon;
  final InputBorder? enabledBorder;
  final EdgeInsetsGeometry? padding;
  final Color? fillColor;
  final TextStyle? hintStyle;
  final InputBorder? focusedBorder;
  final EdgeInsets? contentPadding;
  final TextAlign? textAlign;
  final TextInputType? inputType;
  final Function(String)? onChanged;
  final String? errorText;
  final String labelText;

  const TextInput(
      {Key? key,
      this.controller,
      this.hintText = "Enter Text",
      this.prefixIcon,
      this.enabledBorder,
      this.padding,
      this.fillColor,
      this.hintStyle,
      this.focusedBorder,
      this.contentPadding,
      this.textAlign,
      this.inputType,
        this.errorText,
        this.onChanged,
      required this.labelText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Align(
              alignment: Alignment.centerLeft,
              child: Text(labelText, style: ThemeTextStyles.loginEmailTextStyle)),
        ),
        Gap(5),
        TextField(
          controller: controller,
          textAlign: textAlign ?? TextAlign.left,
          keyboardType: inputType?? TextInputType.emailAddress,
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: hintText,
            errorMaxLines: 3,
            errorText: errorText,
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorPallet.primaryColor),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorPallet.primaryColor),
            ),
            filled: true,
            fillColor: fillColor ?? ColorPallet.textInputBackground,
            prefixIcon: prefixIcon,
            hintStyle: hintStyle?? ThemeTextStyles.hintTextStyle,
            enabledBorder: enabledBorder ??
                OutlineInputBorder(
                  borderSide: BorderSide(color: ColorPallet.textInputBackground),
                ),
            focusedBorder: focusedBorder ??
                OutlineInputBorder(
                  borderSide: BorderSide(color: ColorPallet.textInputBackground, width: 2),
                ),
              contentPadding: EdgeInsets.only(
                  bottom: 0, top: 0, left: 10, right: 10),
          ),
        ),
      ],
    );
  }
}
