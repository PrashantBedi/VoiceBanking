import "package:flutter/material.dart";
import "../colors/app_color.dart";
import "../colors/app_theme_context_extension.dart";

class VBTextTitle extends StatelessWidget {
  late final String text;
  final String? logo;
  final double? scale;

  VBTextTitle(
    this.text, {
    this.logo,
    this.scale,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          fit: FlexFit.tight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              logo == null
                  ? SizedBox.shrink()
                  : Image.asset(
                      logo!,
                      scale: scale,
                    ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  text,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: context.getColor(AppColor.titleText),
                      ),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
