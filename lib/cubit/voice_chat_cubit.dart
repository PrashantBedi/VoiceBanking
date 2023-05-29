import "dart:io";

import "package:backend_integration/dto/metadata.dart";
import "package:flutter_bloc/flutter_bloc.dart";

import "../common/action_enum.dart";
import "../model/process_audio.dart";
import "../usercase/voice_process_usecase.dart";

part "voice_chat_state.dart";

class VoiceChatCubit extends Cubit<VoiceChatState> {
  late VoiceProcessUserCase vpu;

  VoiceChatCubit(this.vpu): super(VoiceChatStateInitial(ProcessAudio()));

  void processAudio(File file, String lang, MetaData md) async {
    emit(VoiceChatStateLoading(ProcessAudio()));
    var processAudio = await vpu.processVoice(file, lang, md);
    var actionEnum = Action().getActionEnum(processAudio.action);

    if(AuthActionEnum.contains(actionEnum)) {
      emit(VoiceChatStatePinAuth(processAudio));
    } else if (actionEnum == ActionEnum.registerUser) {
      emit(VoiceChatStateRegisterUser(processAudio));
    } else if (actionEnum == ActionEnum.history) {
      emit(TransactionHistory(processAudio));
    } else {
      emit(VoiceChatStateLoaded(processAudio));
    }
  }

  Future<void> registerUser(String lang, MetaData md) async {
    emit(VoiceChatStateLoading(ProcessAudio()));
    var processAudio = await vpu.withoutAudio(lang, md);
    var actionEnum = Action().getActionEnum(processAudio.action);

    emit(VoiceChatUserRegisteredSuccess(processAudio));
  }

  Future<void> historyWithDate(String lang, MetaData md) async {
    emit(VoiceChatStateLoading(ProcessAudio()));
    var processAudio = await vpu.withoutAudio(lang, md);

    emit(TransactionHistoryLoaded(processAudio));
  }

  Future<void> textToAudio(String result, String lang) async{
    await vpu.convertToVoice(result, lang);
  }

  void verifyPin(String pin) {
    if (pin == "123123") {
      emit(VoiceChatStateLoaded(state.processAudio));
    }  
  }
} 