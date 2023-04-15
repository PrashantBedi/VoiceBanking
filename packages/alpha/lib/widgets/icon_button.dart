import 'package:alpha/colors/app_theme_context_extension.dart';
import 'package:flutter/material.dart';

import '../colors/app_color.dart';

class VBIconButton extends StatelessWidget {
  final VoidCallback onPress;
  final Icon icon;

  const VBIconButton({Key? key, required this.onPress, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          shape: MaterialStateProperty.resolveWith((states) =>
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
          backgroundColor: MaterialStateProperty.resolveWith(
              (states) => context.getColor(AppColor.primary))),
      onPressed: onPress,
      child: icon,
    );
  }
}
