import "package:flutter_bloc/flutter_bloc.dart";

import "../usercase/voice_process_usecase.dart";

part "voice_chat_state.dart";

class VoiceChatCubit extends Cubit<VoiceChatState> {
  late VoiceProcessUserCase vpu;

  VoiceChatCubit(this.vpu): super(VoiceChatStateInitial());

  String audioToText() {
    return vpu.processVoice();
  }

  String performAction() {
    return vpu.performAction();
  }

  Future<String> textToAudio(String result) async{
    return await vpu.convertToVoice(result);
  }
}