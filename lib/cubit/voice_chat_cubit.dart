import "dart:io";

import "package:flutter_bloc/flutter_bloc.dart";

import "../usercase/voice_process_usecase.dart";

part "voice_chat_state.dart";

class VoiceChatCubit extends Cubit<VoiceChatState> {
  late VoiceProcessUserCase vpu;

  VoiceChatCubit(this.vpu): super(VoiceChatStateInitial());

  String audioToText(File file, String lang) {
    return vpu.processVoice(file, lang);
  }

  String performAction() {
    return vpu.performAction();
  }

  Future<void> textToAudio(String result) async{
    await vpu.convertToVoice(result);
  }
}