import "package:alpha/colors/app_color.dart";
import "package:alpha/colors/app_theme_context_extension.dart";
import "package:alpha/widgets/password_field_form.dart";
import "package:alpha/widgets/primary_elevated_button.dart";
import "package:alpha/widgets/text_field_form.dart";
import "package:flutter/material.dart";

class SignupPage extends StatefulWidget {
  SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: VBTextFieldForm(
                    autoFocus: true,
                    hintText: "Full Name",
                    validator: (value) {
                      if (value.lenght < 3) {
                        return "Enter valid full name";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: VBTextFieldForm(
                    hintText: "Nick Name",
                    validator: (value) {
                      if (value.length < 3) {
                        return "Enter valid nick name";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: VBTextFieldForm(
                    hintText: "User Name",
                    validator: (value) {
                      if (value.length < 3) {
                        return "Enter valid user name";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: VBTextFieldForm(
                    hintText: "Mobile Number",
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value.length > 10) {
                        return "Enter valid mobile number";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: VBTextFieldForm(
                    hintText: "UPI ID",
                    validator: (value) {
                      if (value.length < 7) {
                        return "Enter valid upi id";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: VBPasswordFormField(
                    hintText: "6 Digit Pin",
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value.length != 6) {
                        return "Enter valid pin";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: VBPrimaryElevatedButton.stretched(
                    onPress: () {
                      _formKey.currentState!.validate();
                    },
                    child: Text(
                      "Submit",
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            color: context.getColor(AppColor.white),
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
