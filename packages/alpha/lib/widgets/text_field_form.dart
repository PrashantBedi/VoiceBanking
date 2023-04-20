import "package:flutter/material.dart";
import "../colors/app_color.dart";
import "../colors/app_theme_context_extension.dart";

class VBTextFieldForm extends StatelessWidget {
  final FormFieldValidator? validator;
  final TextEditingController? controller;
  final bool autoFocus;
  late final String hintText;
  final Image? image;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final TextInputType? keyboardType;
  final Function(String)? onSubmit;
  final ValueKey<String>? key;

  VBTextFieldForm({
    required this.hintText,
    this.validator,
    this.controller,
    this.autoFocus = false,
    this.image,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType,
    this.onSubmit,
    this.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: prefixIcon != null ? prefixIcon : image,
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: context.getColor(AppColor.hintText),
            ),
        errorStyle: TextStyle(
          color: context.getColor(AppColor.error),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: context.getColor(AppColor.border),
            style: BorderStyle.solid,
          ),
        ),
        fillColor: context.getColor(AppColor.backgroundLight),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: context.getColor(AppColor.border),
            style: BorderStyle.solid,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: context.getColor(AppColor.error),
            style: BorderStyle.solid,
          ),
        ),
        filled: true,
      ),
      keyboardType: keyboardType,
      style: Theme.of(context).textTheme.headlineMedium!.copyWith(
            color: context.getColor(AppColor.headlineText),
          ),
      autofocus: autoFocus,
      onFieldSubmitted: onSubmit,
    );
  }
}
