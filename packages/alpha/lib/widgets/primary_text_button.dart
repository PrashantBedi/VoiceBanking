import "package:flutter/material.dart";
import "../colors/app_color.dart";
import "../colors/app_theme_context_extension.dart";

class VBPrimaryTextButton extends StatelessWidget {
  late final VoidCallback onPress;
  late final String text;
  late final ValueKey<String>? key;

  VBPrimaryTextButton({required this.onPress, required this.text, this.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPress,
      child: Text(
        text,
        style: Theme.of(context).textTheme.labelSmall!.copyWith(
              color: context.getColor(AppColor.primary),
              letterSpacing: 0,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }
}
