import "package:alpha/widgets/otp_text_field_widget.dart";
import "package:flutter/material.dart";
import "package:otp_text_field/otp_text_field.dart";
import "../common/constants.dart";

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  final OtpFieldController controller = OtpFieldController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Constants.title,
        ),
      ),
      body: Center(
        child: VBOtpTextFieldWidget(
          otpController: controller,
          hasError: false,
          otpLength: 6,
        ),
      ),
    );
  }
}
