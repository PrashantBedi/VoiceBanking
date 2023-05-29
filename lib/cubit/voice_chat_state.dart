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

class VoiceChatStateRegisterUser extends VoiceChatState{
  VoiceChatStateRegisterUser(super.processAudio);
}

class TransactionHistory extends VoiceChatState{
  TransactionHistory(super.processAudio);
}

class TransactionHistoryLoaded extends VoiceChatState{
  TransactionHistoryLoaded(super.processAudio);
}

class VoiceChatUserRegisteredSuccess extends VoiceChatState{
  VoiceChatUserRegisteredSuccess(super.processAudio);
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
