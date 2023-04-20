import "package:alpha/widgets/chat_message.dart";
import "package:alpha/widgets/rounded_elevated_container.dart";
import "package:alpha/widgets/mic_button.dart";
import "package:alpha/widgets/text_widget.dart";
import "package:alpha/widgets/verify_pin_popup.dart";
import "package:auto_route/auto_route.dart";
import "package:backend_integration/dto/metadata.dart";
import "package:flutter/material.dart" hide MetaData;
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_sound/flutter_sound.dart";
import "package:logger/logger.dart" show Level;

import "../common/constants.dart";
import "../cubit/language_change_cubit.dart";
import "../cubit/voice_chat_cubit.dart";
import "../navigation/routes.dart";
import "../utilities/factory/factory.dart";
import "../utilities/recording/voice_recording.dart";

class VoiceChat extends StatefulWidget implements AutoRouteWrapper {
  VoiceChat({Key? key}) : super(key: key);

  @override
  State<VoiceChat> createState() => _VoiceChatState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => voiceChatCubit,
        ),
        BlocProvider(
          create: (context) => languageChangeCubit,
        )
      ],
      child: VoiceChat(),
    );
  }
}

class _VoiceChatState extends State<VoiceChat> {
  final recorder = FlutterSoundRecorder(logLevel: Level.error);
  late VoiceRecording vc;
  String selectedLang = "english";
  final scrollController = ScrollController();

  @override
  void initState() {
    vc = VoiceRecording(recorder);
    vc.initializer();
    playAudio(_messages.first.text);
    context.read<LanguageChangeCubit>().getLanguage();
    super.initState();
  }

  @override
  void dispose() {
    recorder.closeRecorder();
    super.dispose();
  }

  void playAudio(String text) {
    context.read<VoiceChatCubit>().textToAudio(text, selectedLang);
  }

  final List<ChatMessage> _messages = [
    ChatMessage(
      text: "Hi, How may I help you?",
      isMe: true,
    ),
  ];

  void onStart() {
    vc.startRecord();
  }

  Future<void> verifyPin() {
    return showModalBottomSheet(
      context: context,
      isDismissible: false,
      builder: (context) => VBSetMPinPopup(),
    );
  }

  void onStop() async {
    var vcc = context.read<VoiceChatCubit>();
    var file = await vc.stopRecorder();
    await verifyPin();
    MetaData md = MetaData(
      nickName: Constants.defaultNickName,
    );
    String audioToText = await vcc.processAudio(file, selectedLang, md);
    _messages.insert(0, ChatMessage(text: audioToText, isMe: true));
    vcc.textToAudio(audioToText, selectedLang);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Constants.title,
        ),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(8.0),
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (BuildContext context, int index) {
                return _messages[index];
              },
            ),
          ),
          Divider(height: 1.0),
          Align(
            alignment: Alignment.bottomCenter,
            child: VBRoundedElevatedCard(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () =>
                          AutoRouter.of(context).push(LanguageChangeRoute()),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.menu),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: BlocBuilder<LanguageChangeCubit,
                                LanguageChangeState>(
                              builder: (context, state) {
                                if (state is LanguageChangeLoaded) {
                                  selectedLang =
                                      state.language.name.toLowerCase();
                                  return VBTextWidget.bodyMedium(
                                    state.language.name,
                                  );
                                }
                                return CircularProgressIndicator();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    VBMicButton(
                      onRecord: onStart,
                      onStop: onStop,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
