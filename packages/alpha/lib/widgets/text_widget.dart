import "dart:collection";
import "package:flutter/material.dart";
import "../colors/app_color.dart";
import "../colors/app_theme_context_extension.dart";

class VBTextWidget extends StatelessWidget {
  late final String text;
  late final _TextType textType;

  VBTextWidget.headlineLarge(this.text, {super.key}) {
    textType = _TextType.headlineLarge;
  }

  VBTextWidget.headlineMedium(this.text, {super.key}) {
    textType = _TextType.headlineMedium;
  }

  VBTextWidget.labelSmall(this.text, {super.key}) {
    textType = _TextType.labelSmall;
  }

  VBTextWidget.labelMedium(this.text, {super.key}) {
    textType = _TextType.labelMedium;
  }

  VBTextWidget.headlineSmall(this.text, {super.key}) {
    textType = _TextType.headlineSmall;
  }

  VBTextWidget.bodyMedium(this.text, {super.key}) {
    textType = _TextType.bodyMedium;
  }

  VBTextWidget.bodySmall(this.text, {super.key}) {
    textType = _TextType.bodySmall;
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: _getStyle(context, textType),
      textAlign: TextAlign.center,
    );
  }

  TextStyle _getStyle(BuildContext context, _TextType textType) {
    return HashMap.from({
      _TextType.headlineLarge: Theme.of(context)
          .textTheme
          .headlineLarge
          ?.copyWith(color: context.getColor(AppColor.headlineText)),
      _TextType.headlineMedium: Theme.of(context)
          .textTheme
          .headlineMedium
          ?.copyWith(color: context.getColor(AppColor.headlineText)),
      _TextType.headlineSmall: Theme.of(context)
          .textTheme
          .headlineSmall
          ?.copyWith(color: context.getColor(AppColor.labelText)),
      _TextType.labelMedium: Theme.of(context)
          .textTheme
          .labelMedium
          ?.copyWith(color: context.getColor(AppColor.labelText)),
      _TextType.labelSmall: Theme.of(context)
          .textTheme
          .labelSmall
          ?.copyWith(color: context.getColor(AppColor.labelText)),
      _TextType.bodyMedium: Theme.of(context)
          .textTheme
          .bodyMedium
          ?.copyWith(color: context.getColor(AppColor.headlineText)),
      _TextType.bodySmall: Theme.of(context)
          .textTheme
          .bodySmall
          ?.copyWith(color: context.getColor(AppColor.headlineText)),
    })[textType];
  }
}

enum _TextType {
  headlineLarge,
  headlineMedium,
  headlineSmall,
  bodyMedium,
  bodySmall,
  labelMedium,
  labelSmall,
}
