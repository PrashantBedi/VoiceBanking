import "package:flutter/material.dart";
import "package:network/client.dart";
import "voice_banking.dart";

void startup() {
  DioClient.init(
    "https://asr.iitm.ac.in/",
    Duration(seconds: 10),
    Duration(seconds: 10),
  );

  runApp(const VoiceBanking());
}
