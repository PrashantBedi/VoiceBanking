import "package:backend_integration/dto/text_to_voice_req.dart";
import "package:backend_integration/dto/text_to_voice_resp.dart";
import "package:backend_integration/endpoint/text_to_voice.dart";
import "package:dio/dio.dart";
import "package:retrofit/retrofit.dart";

class VoiceProcessRepository {
  late TextToVoiceAPI ttv;

  VoiceProcessRepository(this.ttv);

  String processVoice() {
    // Call to endpoint to get text of input
    return "What's my bank balance";
  }

  String performAction() {
    // Call endpoint to get result
    return "Your bank balance is 5000\$";
  }

  Future<String> convertToVoice(String result) async {
    // TextToVoiceResp? textToVoice;
    // try {
    //   textToVoice = await ttv.textToVoice(
    //     TextToVoiceReq(
    //       input: "चॉकलेट आइसक्रीम बनाने की विधि बताओ",
    //       lang: "Hindi",
    //       gender: "male",
    //     ),
    //   );
    // } on Error catch (e) {
    //   print("----> ERROR ${e.toString()}");
    // }
    // print("-----> Response ${textToVoice?.audio}");
    return "Path of mp3 file";
  }
}
