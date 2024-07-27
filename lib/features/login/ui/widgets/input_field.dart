import 'dart:developer';
import 'package:app_fundamentals/app_fundamentals.dart';
import 'package:flutter/material.dart';
import 'package:ringo_media_flutter_dev_test/core/design_system/app_colors.dart';

///==========================================================
/// CREATED BY MOHAMED GHONEIM 01/01/2022 TEL// +201064626369
///==========================================================
///

class  InputField extends StatelessWidget{
  final TextEditingController? controller;
  final String? hint;
  final Color? hintColor;
  final double? hintFontSize;
  final AppFormFieldItemType formFieldItemType;
  final BehaviorSubject<bool>? obscureTextSubject;
  final FocusNode? focusNode;
  final TextInputType textInputType;
  final TextInputAction? textInputAction;
  final double? fontSize;
  final Color? fontColor;
  final Widget? label;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? borderColor;
  final Color? unFocusedBorderColor;
  final Color? iconColor;
  final Color? focusedIconColor;
  final int? maxLines;
  final FormFieldValidator<String>? validator;
  final bool? showHint;
  final bool? readOnly;
  final bool? autofocus;
  final EdgeInsets? contentPadding;
  final VoidCallback? submit;
  final ValueChanged<String>? onChanged;
  final int? maxLength;
  final Widget? showPasswordIcon;
  final Color? fillColor;

  const InputField({
    this.controller,
     this.hint,
     this.hintFontSize,
    required this.formFieldItemType,
    this.obscureTextSubject,
    this.focusNode,
    required this.textInputType,
    this.textInputAction,
    this.fontSize,
    this.fontColor,
    this.label,
    this.prefixIcon,
    this.suffixIcon,
     this.borderColor,
     this.hintColor,
     this.unFocusedBorderColor,
     this.iconColor,
     this.focusedIconColor,
    this.maxLines,
    this.validator,
    this.showHint = false,
    this.readOnly = false,
    this.autofocus = false,
    this.contentPadding,
    this.submit,
    this.onChanged,
    this.maxLength,
    this.showPasswordIcon,
    this.fillColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        focusNode: focusNode,
        autofocus: autofocus ?? false,
        maxLines: maxLines??1,
        maxLength: maxLength,
        style: TextStyle(
            fontSize: fontSize ?? 13, color: fontColor ?? Colors.black),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        obscureText: formFieldItemType == AppFormFieldItemType.password &&
            obscureTextSubject!.value
            ? true
            : false,
        keyboardType: textInputType,
        textInputAction: textInputAction ?? TextInputAction.done,
        onChanged: onChanged,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon ??
              (formFieldItemType == AppFormFieldItemType.password
                  ? InkWell(
                  onTap: () {
                    log(obscureTextSubject!.value.toString());
                    obscureTextSubject!.sink
                        .add(!obscureTextSubject!.value);
                  },
                  child: showPasswordIcon ??
                   const   Icon(
                        Icons.remove_red_eye))
                  : null),

          contentPadding: contentPadding ?? const EdgeInsets.all(16),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          // label: label,
          hintText: showHint == true ? hint : '',
          hintStyle: TextStyle(fontSize: hintFontSize, color: hintColor),
          errorStyle: const TextStyle(fontSize: 10, color: Colors.red),
          fillColor: fillColor ?? Colors.transparent,
          filled: true,
          enabledBorder:
              UnderlineInputBorder(
              borderSide: BorderSide(width: 1, color: unFocusedBorderColor??Colors.grey)),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(width: 1, color: borderColor??primaryColor))
        ),

        onEditingComplete: submit,
        validator: validator);
  }
}
