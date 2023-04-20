import "primary_elevated_button.dart";
import "package:flutter/material.dart";
import "package:otp_text_field/otp_field.dart";
import "../colors/app_color.dart";
import "../colors/app_theme_context_extension.dart";
import "otp_text_field_widget.dart";

class VBSetMPinPopup extends StatefulWidget {
  const VBSetMPinPopup({
    Key? key,
  }) : super(key: key);

  @override
  State<VBSetMPinPopup> createState() => _VBSetMPinPopupState();
}

class _VBSetMPinPopupState extends State<VBSetMPinPopup> {
  String pin = "";
  bool hasError = false;

  void onChange(value) {
    pin = value;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          color: context.getColor(AppColor.backgroundLight),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Text(
                    "Enter your Pin",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: VBOtpTextFieldWidget(
                    otpController: OtpFieldController(),
                    hasError: hasError,
                    onChange: onChange,
                    isSecureInput: true,
                    otpLength: 6,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: VBPrimaryElevatedButton.stretched(
                    onPress: () {
                      if(pin.length == 6) {
                        Navigator.pop(context);
                      } else {
                        hasError = true;
                        setState(() {});
                      }
                    },
                    child: Text(
                          "Verify",
                      style: TextStyle(
                        color: context.getColor(AppColor.white),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
