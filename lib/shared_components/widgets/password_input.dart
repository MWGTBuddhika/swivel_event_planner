
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theme/color_pallet.dart';
import '../theme/text_styles.dart';


class PasswordInput extends StatefulWidget {
  final TextEditingController? controller;
  final String hintText;
  final Icon? prefixIcon;
  final String? errorText;
  final Function(String)? onChanged;

  PasswordInput({
    this.controller,
    required this.hintText,
    this.prefixIcon,
    this.errorText,
    this.onChanged
  });

  @override
  _PasswordInputState createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: _obscureText,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: ThemeTextStyles.hintTextStyle,
        filled: true,
        errorText: widget.errorText,
        fillColor: ColorPallet.textInputBackground,
        prefixIcon: widget.prefixIcon ?? Icon(
          Icons.lock_outline,
          color: ColorPallet.darkGrey,
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorPallet.primaryColor),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorPallet.primaryColor),
        ),
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility_outlined : Icons.visibility_off_outlined,
            color: ColorPallet.darkGrey,
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
        enabledBorder:
            OutlineInputBorder(
              borderSide: BorderSide(color: ColorPallet.textInputBackground),
            ),
        focusedBorder:
            OutlineInputBorder(
              borderSide: BorderSide(color: ColorPallet.textInputBackground, width: 2),
            ),
        contentPadding: EdgeInsets.only(
            bottom: 0, top: 0, left: 10, right: 10),
      ),
    );
  }
}