import "package:backend_integration/endpoint/process_audio.dart";
import "package:backend_integration/endpoint/text_to_voice.dart";
import "package:network/client.dart";
import "package:storage/storage.dart";
import "package:storage/storage_factory.dart";
import "package:dio/dio.dart";

import "../../common/constants.dart";
import "../../cubit/language_change_cubit.dart";
import "../../cubit/voice_chat_cubit.dart";
import "../../repository/language_change_repo.dart";
import "../../repository/voice_process_repo.dart";
import "../../usercase/language_change_usecase.dart";
import "../../usercase/voice_process_usecase.dart";

// Cubit

VoiceChatCubit get voiceChatCubit => VoiceChatCubit(voiceProcessUserCase);
LanguageChangeCubit get languageChangeCubit => LanguageChangeCubit(languageChangeUsecase);

// UseCase

LanguageChangeUsecase get languageChangeUsecase => LanguageChangeUsecase(languageChangeRepo);
VoiceProcessUserCase get voiceProcessUserCase => VoiceProcessUserCase(voiceProcessRepository, languageChangeRepo);

// Repo

LanguageChangeRepo get languageChangeRepo => LanguageChangeRepo(localStorage);
VoiceProcessRepository get voiceProcessRepository => VoiceProcessRepository(textToVoiceApi, processAudioAPI);

// Api

TextToVoiceAPI get textToVoiceApi => TextToVoiceAPI(dio);
ProcessAudioAPI get processAudioAPI => ProcessAudioAPI(dio);

// Storage

Storage get localStorage => StorageFactory.localStorage(Constants.boxName);

// Dio

Dio get dio => DioClient().dio;

