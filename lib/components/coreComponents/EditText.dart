import 'package:flutter/material.dart';
import '../constant/AppColors.dart';
import '../constant/AppFonts.dart';
import '../constant/TextStyles.dart';

class EditText extends StatefulWidget {
  final TextEditingController controller;
  final bool? readOnly;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double? radius;
  final Color? borderColor;
  final Color? filledColor;
  final bool isFilled;
  final String? hint;
  final String? error;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final bool isPassword;
  const EditText({super.key, required this.controller, this.readOnly, this.padding, this.margin, this.radius, this.borderColor, this.filledColor, this.isFilled = true, this.hint, this.hintStyle, this.textStyle, this.error, this.isPassword = false});

  @override
  State<EditText> createState() => _EditTextState();
}

class _EditTextState extends State<EditText> {

  @override
  Widget build(BuildContext context) {
    final borderStyle = _borderStyle(borderColor: widget.borderColor,radius: widget.radius);
    return Padding(
      padding: widget.margin ?? EdgeInsets.zero,
      child: TextField(
        style: widget.textStyle ?? TextStyles.regular14Black,
        decoration: InputDecoration(
          hintText: widget.hint,
          hintStyle: widget.hintStyle ?? TextStyles.regularTextHint,
          filled: widget.isFilled,
          fillColor: widget.filledColor ?? AppColors.transparent,
          enabledBorder: borderStyle,
          border: borderStyle,
          focusedBorder: borderStyle,
            errorText: widget.error != null && widget.error!.trim().isEmpty
                ? null
                : widget.error,

        ),
        obscureText: widget.isPassword,
        readOnly: widget.readOnly ?? false,
        controller: widget.controller,
      ),
    );
  }
}

InputBorder _borderStyle({double? radius, Color? borderColor}){
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius??AppFonts.s10),
      borderSide: BorderSide(color:borderColor?? AppColors.primaryGreen, width: 2));
}
