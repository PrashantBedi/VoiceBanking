import "package:alpha/widgets/chat_message.dart";
import "package:alpha/widgets/rounded_elevated_container.dart";
import "package:alpha/widgets/mic_button.dart";
import "package:backend_integration/endpoint/text_to_voice.dart";
import "package:flutter/material.dart";
import "package:flutter_sound/flutter_sound.dart";
import "package:network/client.dart";
import "package:logger/logger.dart" show Level;

import "../common/constants.dart";
import "../cubit/voice_chat_cubit.dart";
import "../repository/voice_process_repo.dart";
import "../usercase/voice_process_usecase.dart";
import "../utilities/play_audio/play_audio.dart";
import "../utilities/recording/voice_recording.dart";

class VoiceChat extends StatefulWidget {
  VoiceChat({Key? key}) : super(key: key);

  @override
  State<VoiceChat> createState() => _VoiceChatState();
}

class _VoiceChatState extends State<VoiceChat> {
  final recorder = FlutterSoundRecorder(logLevel: Level.error);
  late VoiceRecording vc;

  @override
  void initState() {
    vc = VoiceRecording(recorder);
    vc.initializer();
    super.initState();
  }

  @override
  void dispose() {
    recorder.closeRecorder();
    super.dispose();
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
    var file = await vc.stopRecorder();
    var vpr = VoiceProcessRepository(TextToVoiceAPI(DioClient().dio));
    var vpu = VoiceProcessUserCase(vpr);
    var vCubit = VoiceChatCubit(vpu);
    var audioToText = vCubit.audioToText();
    _messages.add(ChatMessage(text: audioToText, isMe: false));
    var result = vCubit.performAction();
    _messages.add(ChatMessage(text: result, isMe: true));
    var textToAudio = vCubit.textToAudio(result);
    PlayAudio().playAudio(file.path);
    setState(() {
    });
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
                    Text("English"),
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
