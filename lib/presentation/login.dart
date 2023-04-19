import "package:alpha/colors/app_color.dart";
import "package:alpha/colors/app_theme_context_extension.dart";
import "package:alpha/widgets/otp_text_field_widget.dart";
import "package:alpha/widgets/primary_text_button.dart";
import "package:alpha/widgets/text_title.dart";
import "package:alpha/widgets/text_widget.dart";
import "package:flutter/material.dart";
import "package:otp_text_field/otp_text_field.dart";
import "../common/constants.dart";

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  final OtpFieldController controller = OtpFieldController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 35.0),
              child: VBTextTitle(
                Constants.title,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: VBTextWidget.headlineMedium(
                          "Please, Enter your 6 digits pin",
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: VBOtpTextFieldWidget(
                          otpController: controller,
                          hasError: false,
                          onChange: (value) {},
                          isSecureInput: true,
                          otpLength: 6,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 35,
                          vertical: 20,
                        ),
                        child: Divider(
                          color: context.getColor(AppColor.border),
                          thickness: 1,
                        ),
                      ),
                      VBPrimaryTextButton(
                        text: "Register User?",
                        onPress: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
