import "package:flutter/material.dart";
import "../colors/app_color.dart";
import "../colors/app_theme_context_extension.dart";

class VBPrimaryElevatedButton extends StatelessWidget {
  late final VoidCallback? onPress;
  late final Widget child;
  late final FlexFit _flexFit;

  VBPrimaryElevatedButton.stretched({
    super.key,
    this.onPress,
    required this.child,
  }) {
    _flexFit = FlexFit.tight;
  }

  VBPrimaryElevatedButton.fit({
    super.key,
    this.onPress,
    required this.child,
  }) {
    _flexFit = FlexFit.loose;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          fit: _flexFit,
          child: ElevatedButton(
            onPressed: onPress,
            style: ButtonStyle(
              shape: MaterialStateProperty.resolveWith(
                (context) => RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              backgroundColor:
                  MaterialStateProperty.resolveWith<Color>((states) {
                if (states.contains(MaterialState.disabled)) {
                  return context.getColor(AppColor.primary).withOpacity(0.3);
                }
                return context.getColor(AppColor.primary);
              }),
            ),
            child: Padding(padding: const EdgeInsets.all(12.0), child: child),
          ),
        ),
      ],
    );
  }
}
