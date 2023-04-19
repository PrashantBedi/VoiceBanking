import "package:alpha/colors/app_color.dart";
import "package:alpha/colors/app_theme_context_extension.dart";
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
      // appBar: AppBar(
      //   title: Text(
      //     "Login",
      //   ),
      // ),
      body: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30.0),
              child: Text(
                Constants.title,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.7,
                    decoration: BoxDecoration(
                      color: context.getColor(AppColor.widgetBg),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Text(
                            "Please, Enter your 6 digits pin",
                          ),
                        ),
                        VBOtpTextFieldWidget(
                          otpController: OtpFieldController(),
                          hasError: false,
                          onChange: (value) {},
                          isSecureInput: true,
                          otpLength: 6,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 35,
                            right: 35,
                            top: 45,
                          ),
                          child: Divider(
                            color: context.getColor(AppColor.border),
                            thickness: 1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Text(
                            "Register User",
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(
                                  color: context.getColor(AppColor.primary),
                                ),
                          ),
                        ),
                      ],
                    ),
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
