import "package:backend_integration/endpoint/process_audio.dart";
import "package:backend_integration/endpoint/text_to_voice.dart";
import "package:network/client.dart";

import "../../cubit/voice_chat_cubit.dart";
import "../../repository/voice_process_repo.dart";
import "../../usercase/voice_process_usecase.dart";

VoiceChatCubit voiceChatCubit() {
  var ttvApi = TextToVoiceAPI(DioClient().dio);
  var paApi = ProcessAudioAPI(DioClient().dio);
  var vpr = VoiceProcessRepository(ttvApi, paApi);
  var vpu = VoiceProcessUserCase(vpr);
  var vCubit = VoiceChatCubit(vpu);
  return vCubit;
}