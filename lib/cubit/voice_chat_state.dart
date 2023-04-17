part of "voice_chat_cubit.dart";

abstract class VoiceChatState {}

class VoiceChatStateInitial extends VoiceChatState{}

class VoiceChatStateLoading extends VoiceChatState{}

class VoiceChatStateLoaded extends VoiceChatState{}

class VoiceChatStateError extends VoiceChatState{}

