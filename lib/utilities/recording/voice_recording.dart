import "dart:io";

import "package:flutter_sound/flutter_sound.dart";
import "package:permission_handler/permission_handler.dart";

import "../../common/constants.dart";

class VoiceRecording {
  late FlutterSoundRecorder recorder;

  VoiceRecording(this.recorder);

  void initializer() async {
    final status = await Permission.microphone.request();
    if (status != PermissionStatus.granted) {
      throw Constants.permissionError;
    }
    await recorder.openRecorder();
    recorder.setSubscriptionDuration(const Duration(milliseconds: 500));
  }

  Future startRecord() async {
    await recorder.startRecorder(toFile: Constants.recordedAudioFileName);
  }

  Future<File> stopRecorder() async {
    final filePath = await recorder.stopRecorder();
    return File(filePath!);
  }
}
