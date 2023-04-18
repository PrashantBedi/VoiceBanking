import "package:alpha/widgets/chat_message.dart";
import "package:alpha/widgets/rounded_elevated_container.dart";
import "package:alpha/widgets/mic_button.dart";
import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_sound/flutter_sound.dart";
import "package:logger/logger.dart" show Level;

import "../common/constants.dart";
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
    return BlocProvider(
      create: (context) => voiceChatCubit(),
      child: VoiceChat(),
    );
  }
}

class _VoiceChatState extends State<VoiceChat> {
  final recorder = FlutterSoundRecorder(logLevel: Level.error);
  late VoiceRecording vc;

  @override
  void initState() {
    vc = VoiceRecording(recorder);
    vc.initializer();
    playAudio(_messages.first.text);
    super.initState();
  }

  @override
  void dispose() {
    recorder.closeRecorder();
    super.dispose();
  }

  void playAudio(String text) {
    context.read<VoiceChatCubit>().textToAudio(text);
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

  void onStop() async {
    var vcc = context.read<VoiceChatCubit>();
    var file = await vc.stopRecorder();
    var audioToText = vcc.audioToText();
    _messages.add(ChatMessage(text: audioToText, isMe: false));
    playAudio(audioToText);
    var result = vcc.performAction();
    _messages.add(ChatMessage(text: result, isMe: true));
    var textToAudio = vcc.textToAudio(result);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Constants.title,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(8.0),
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
                            child: Text("English"),
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
