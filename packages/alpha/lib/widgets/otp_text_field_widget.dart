import "package:alpha/colors/app_theme_context_extension.dart";
import "package:flutter/material.dart";
import "package:otp_text_field/otp_text_field.dart";
import "package:otp_text_field/style.dart";

import "../colors/app_color.dart";

class VBOtpTextFieldWidget extends StatefulWidget {
  final OtpFieldController otpController;
  final int? otpLength;
  final double? totalWidth;
  final double? fieldWidth;
  final double? outlinedBorderRadius;
  final FieldStyle? fieldStyle;
  final ValueChanged<String>? onChange;
  final ValueChanged<String>? onComplete;
  final MainAxisAlignment? mainAxisAlignment;
  final bool hasError;
  final bool isSecureInput;
  final ValueKey<String>? key;

  VBOtpTextFieldWidget({
    required this.otpController,
    this.otpLength = 5,
    this.totalWidth = 300,
    this.fieldWidth = 45,
    this.fieldStyle = FieldStyle.box,
    this.outlinedBorderRadius = 5,
    this.mainAxisAlignment = MainAxisAlignment.spaceAround,
    this.onChange,
    this.onComplete,
    required this.hasError,
    this.isSecureInput = false,
    this.key,
  });

  @override
  State<VBOtpTextFieldWidget> createState() => _VBOtpTextFieldWidgetState();
}

class _VBOtpTextFieldWidgetState extends State<VBOtpTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: OTPTextField(
        hasError: widget.hasError,
        controller: widget.otpController,
        keyboardType: TextInputType.numberWithOptions(decimal: false),
        obscureText: widget.isSecureInput,
        length: widget.otpLength!,
        textFieldAlignment: widget.mainAxisAlignment!,
        width: widget.totalWidth!,
        fieldWidth: widget.fieldWidth!,
        fieldStyle: widget.fieldStyle!,
        outlineBorderRadius: widget.outlinedBorderRadius!,
        style: Theme.of(context).textTheme.headlineMedium!.copyWith(
              // color: context.getColor(AppColor.HEADLINE_TEXT),
              fontSize: 20,
            ),
        onChanged: widget.onChange,
        onCompleted: widget.onComplete,
        otpFieldStyle: OtpFieldStyle(
          errorBorderColor: Colors.red,
          enabledBorderColor: context.getColor(AppColor.border),
          focusBorderColor: context.getColor(AppColor.border),
          backgroundColor: context.getColor(AppColor.widgetBg),
        ),
      ),
    );
  }
}
