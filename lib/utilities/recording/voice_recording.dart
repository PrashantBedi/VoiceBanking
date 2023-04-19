import "dart:io";

import "package:flutter_sound/flutter_sound.dart";
import "package:path_provider/path_provider.dart";
import "package:permission_handler/permission_handler.dart";
import "package:record_mp3/record_mp3.dart";

class VoiceRecording {
  late FlutterSoundRecorder recorder;

  VoiceRecording(this.recorder);

  void initializer() async {
    final status = await Permission.microphone.request();
    if (status != PermissionStatus.granted) {
      throw "Permission not granted";
    }
    await recorder.openRecorder();
    recorder.setSubscriptionDuration(const Duration(milliseconds: 500));
  }

  Future startRecord() async {
    await recorder.startRecorder(toFile: "output.aac");
  }

  Future<File> stopRecorder() async {
    final filePath = await recorder.stopRecorder();
    return File(filePath!);
  }
}
