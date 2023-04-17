import "../repository/voice_process_repo.dart";

class VoiceProcessUserCase{
  late VoiceProcessRepository repo;

  VoiceProcessUserCase(this.repo);

  String processVoice() {
    return repo.processVoice();
  }

  String performAction() {
    return repo.performAction();
  }

  Future<String> convertToVoice(String result) async {
    return await repo.convertToVoice(result);
  }
}