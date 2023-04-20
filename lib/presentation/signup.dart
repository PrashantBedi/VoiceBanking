import "dart:io";

import "package:alpha/colors/app_color.dart";
import "package:alpha/colors/app_theme_context_extension.dart";
import "package:alpha/widgets/mic_button.dart";
import "package:alpha/widgets/password_field_form.dart";
import "package:alpha/widgets/primary_elevated_button.dart";
import "package:alpha/widgets/text_field_form.dart";
import "package:auto_route/auto_route.dart";
import "package:backend_integration/dto/metadata.dart";
import "package:flutter/material.dart" hide MetaData;
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_sound/flutter_sound.dart";
import "package:logger/logger.dart" show Level;

import "../common/constants.dart";
import "../cubit/voice_chat_cubit.dart";
import "../navigation/routes.dart";
import "../utilities/factory/factory.dart";
import "../utilities/recording/voice_recording.dart";

class SignupPage extends StatefulWidget implements AutoRouteWrapper {
  SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => voiceChatCubit,
      child: SignupPage(),
    );
  }
}

class _SignupPageState extends State<SignupPage> {
  final recorder = FlutterSoundRecorder(logLevel: Level.error);
  late VoiceRecording vc;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final fName = TextEditingController();
  final uName = TextEditingController();
  final nName = TextEditingController();
  final mNo = TextEditingController();
  final upi = TextEditingController();
  final pin = TextEditingController();

  void onSignup() async{
    var vcc = context.read<VoiceChatCubit>();
    var nav = AutoRouter.of(context);
    if(_formKey.currentState!.validate()){
      await vc.startRecord();
      await Future.delayed(Duration(milliseconds: Constants.micRecordTimeInMilliSec));
      File file = await vc.stopRecorder();
      MetaData md = MetaData(
        fullName: fName.text,
        nickName: nName.text,
        userName: uName.text,
        mobNumber: mNo.text,
        upiID: upi.text,
        pinNumber: pin.text,
      );
      await vcc.processAudio(file, Constants.defaultLanguage , md);
      nav.push(LoginRoute());
    }
  }

  @override
  void initState() {
    vc = VoiceRecording(recorder);
    vc.initializer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                    controller: fName,
                    autoFocus: true,
                    hintText: "Full Name",
                    validator: (value) {
                      if (value.length < 3) {
                        return "Enter valid full name";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: VBTextFieldForm(
                    controller: nName,
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
                    controller: uName,
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
                    controller: mNo,
                    hintText: "Mobile Number",
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value.length != 10) {
                        return "Enter valid mobile number";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: VBTextFieldForm(
                    controller: upi,
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
                    controller: pin,
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
                  child: VBMicButton(
                    onRecord: onSignup,
                    onStop: () {},
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
