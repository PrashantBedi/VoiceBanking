part of "voice_chat_cubit.dart";

abstract class VoiceChatState {
  final ProcessAudio processAudio;

  const VoiceChatState(this.processAudio);
}

class VoiceChatStateInitial extends VoiceChatState{
  VoiceChatStateInitial(super.processAudio);
}

class VoiceChatStateLoading extends VoiceChatState{
  VoiceChatStateLoading(super.processAudio);
}

class VoiceChatStateLoaded extends VoiceChatState{
  VoiceChatStateLoaded(super.processAudio);
}

class VoiceChatStatePinAuth extends VoiceChatState{
  VoiceChatStatePinAuth(super.processAudio);
}

class VoiceChatStatePinValid extends VoiceChatState{
  VoiceChatStatePinValid(super.processAudio);
}

class VoiceChatStateError extends VoiceChatState{
  VoiceChatStateError(super.processAudio);
}
