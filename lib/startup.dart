import "package:flutter/material.dart";
import "package:network/client.dart";
import "package:storage/storage.dart";
import "common/constants.dart";
import "voice_banking.dart";

void startup() async{
  DioClient.init(
    "https://asr.iitm.ac.in/",
    Duration(seconds: 10),
    Duration(seconds: 10),
  );

  await initHive();
  await createBox(Constants.boxName);

  runApp(VoiceBanking());
}
