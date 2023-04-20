import "dart:io";

import "package:backend_integration/dto/metadata.dart";
import "package:flutter_bloc/flutter_bloc.dart";

import "../usercase/voice_process_usecase.dart";

part "voice_chat_state.dart";

class VoiceChatCubit extends Cubit<VoiceChatState> {
  late VoiceProcessUserCase vpu;

  VoiceChatCubit(this.vpu): super(VoiceChatStateInitial());

  Future<String> processAudio(File file, String lang, MetaData md) async {
    return await vpu.processVoice(file, lang, md);
  }

  Future<void> textToAudio(String result, String lang) async{
    await vpu.convertToVoice(result, lang);
  }
}