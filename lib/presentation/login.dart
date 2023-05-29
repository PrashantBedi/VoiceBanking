import "package:alpha/colors/app_color.dart";
import "package:alpha/colors/app_theme_context_extension.dart";
import "package:alpha/widgets/otp_text_field_widget.dart";
import "package:alpha/widgets/primary_elevated_button.dart";
import "package:alpha/widgets/primary_text_button.dart";
import "package:alpha/widgets/text_field_form.dart";
import "package:alpha/widgets/text_title.dart";
import "package:alpha/widgets/text_widget.dart";
import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:network/client.dart";
import "package:otp_text_field/otp_text_field.dart";
import "../common/constants.dart";
import "../cubit/login_cubit.dart";
import "../navigation/routes.dart";
import "../utilities/factory/factory.dart";

class Login extends StatefulWidget implements AutoRouteWrapper {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => loginCubit,
      child: Login(),
    );
  }
}

class _LoginState extends State<Login> {
  final OtpFieldController controller = OtpFieldController();
  bool hasError = false;

  void loginUser(String value) {
    if (value.length == 6) {
      context.read<LoginCubit>().loginUser(value).then((value) {
        hasError = value;
        if (value) {
          AutoRouter.of(context).push(LanguageChangeRoute());
        }
      });
    }
  }

  void configIp() async {
    var ip = TextEditingController();
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: true,
      enableDrag: true,
      builder: (context) => Container(
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  VBTextFieldForm(
                    hintText: "Configure your ip",
                    controller: ip,
                    autoFocus: true,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: VBPrimaryElevatedButton.fit(
                      child: Text("Configure"),
                      onPress: () {
                        Navigator.pop(context);
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
    DioClient.init(
      "http://${ip.text}:8080/",
      Duration(seconds: 10),
      Duration(seconds: 10),
    );
  }

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
                          hasError: hasError,
                          onChange: loginUser,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          VBPrimaryTextButton(
                            text: "Register User?",
                            onPress: () {
                              AutoRouter.of(context).push(SignupPageRoute()).then((_) {});
                            },
                          ),
                          VBPrimaryTextButton(
                            onPress: configIp,
                            text: "Config IP",
                          ),
                        ],
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
