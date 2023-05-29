import "package:alpha/widgets/chat_message.dart";
import "package:alpha/widgets/primary_elevated_button.dart";
import "package:alpha/widgets/rounded_elevated_container.dart";
import "package:alpha/widgets/mic_button.dart";
import "package:alpha/widgets/text_widget.dart";
import "package:alpha/widgets/verify_pin_popup.dart";
import "package:auto_route/auto_route.dart";
import "package:backend_integration/dto/metadata.dart";
import "package:flutter/material.dart" hide MetaData;
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_sound/flutter_sound.dart";
import "package:intl/intl.dart";
import "package:logger/logger.dart" show Level;
import "package:syncfusion_flutter_datepicker/datepicker.dart";

import "../common/constants.dart";
import "../cubit/language_change_cubit.dart";
import "../cubit/voice_chat_cubit.dart";
import "../navigation/routes.dart";
import "../utilities/factory/factory.dart";
import "../utilities/recording/voice_recording.dart";
import "signup.dart";

class VoiceChat extends StatefulWidget implements AutoRouteWrapper {
  final String lang;
  VoiceChat({Key? key, required this.lang}) : super(key: key);

  @override
  State<VoiceChat> createState() => _VoiceChatState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => voiceChatCubit,
        ),
        BlocProvider(
          create: (context) => languageChangeCubit,
        )
      ],
      child: VoiceChat(
        lang: lang,
      ),
    );
  }
}

class _VoiceChatState extends State<VoiceChat> {
  final recorder = FlutterSoundRecorder(logLevel: Level.error);
  late VoiceRecording vc;
  final scrollController = ScrollController();

  Future<void> transactionHistory() async {
    final picked = await showDateRangePicker(
        context: context,
        lastDate: DateTime.now(),
        firstDate: new DateTime(2000),
        saveText: "Continue");
    if (picked != null && picked != null) {
      var startDate = DateFormat("yyyy-MM-dd:00-00").format(picked.start);
      var endDate = DateFormat("yyyy-MM-dd:00-00").format(picked.end);
      var range = "${startDate},${endDate}";
      MetaData md = MetaData.withAction(
        action: Constants.durationAction,
        nickName: Constants.defaultNickName,
        duration: range,
      );

      // ignore: use_build_context_synchronously
      context.read<VoiceChatCubit>().historyWithDate(widget.lang, md);
    }
  }

  @override
  void initState() {
    context.read<LanguageChangeCubit>().getLanguage();
    vc = VoiceRecording(recorder);
    initMessage();
    vc.initializer();
    super.initState();
  }

  void initMessage() {
    _messages = [
      ChatMessage(
        text: initText[widget.lang]!,
        isMe: true,
      ),
    ];
    playAudio(_messages.first.text);
  }

  @override
  void dispose() {
    recorder.closeRecorder();
    super.dispose();
  }

  void playAudio(String text) {
    context.read<VoiceChatCubit>().textToAudio(text, widget.lang);
  }

  late List<ChatMessage> _messages;

  void onStart() {
    vc.startRecord();
  }

  Future<void> verifyPin() {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: false,
      enableDrag: true,
      builder: (context) => VBSetMPinPopup(),
    );
  }

  void onStop() async {
    var vcc = context.read<VoiceChatCubit>();
    var file = await vc.stopRecorder();
    MetaData md = MetaData(
      nickName: Constants.defaultNickName,
    );
    vcc.processAudio(file, widget.lang, md);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<VoiceChatCubit, VoiceChatState>(
      listener: (context, state) async {
        var vcc = context.read<VoiceChatCubit>();
        var autoRouter = AutoRouter.of(context);
        if (state is VoiceChatStatePinAuth) {
          await verifyPin();
          addMessage(state, vcc);
        }

        if (state is VoiceChatStateRegisterUser) {
          _messages.insert(
            0,
            ChatMessage(text: state.processAudio.input, isMe: false),
          );
          // ignore: use_build_context_synchronously
          showDialog(
            context: context,
            builder: (context) => BlocProvider(
              create: (context) => voiceChatCubit,
              child: SignupPage(),
            ),
          ).then(
            (value) => {
              setState(() {
                _messages.insert(
                  0,
                  ChatMessage(text: value as String, isMe: true),
                );
              }),
            },
          );
        }

        if(state is TransactionHistory) {
          _messages.insert(
            0,
            ChatMessage(text: state.processAudio.input, isMe: false),
          );
          transactionHistory();
        }

        if(state is TransactionHistoryLoaded) {
          setState(() {
            _messages.insert(
            0,
            ChatMessage(text: state.processAudio.output, isMe: true),
          );
          });
        }

        if (state is VoiceChatStatePinValid || state is VoiceChatStateLoaded) {
          addMessage(state, vcc);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            Constants.title,
          ),
          automaticallyImplyLeading: false,
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(8.0),
                reverse: true,
                itemCount: _messages.length,
                itemBuilder: (BuildContext context, int index) {
                  return _messages[index].text == "" ? SizedBox.shrink() : _messages[index];
                },
              ),
            ),
            Divider(height: 1.0),
            Align(
              alignment: Alignment.bottomCenter,
              child: VBRoundedElevatedCard(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () =>
                            AutoRouter.of(context).push(LanguageChangeRoute()),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.menu),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: BlocBuilder<LanguageChangeCubit,
                                  LanguageChangeState>(
                                builder: (context, state) {
                                  if (state is LanguageChangeLoaded) {
                                    return VBTextWidget.bodyMedium(
                                      state.language.name,
                                    );
                                  }
                                  return CircularProgressIndicator();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      BlocBuilder<VoiceChatCubit, VoiceChatState>(
                        builder: (context, state) {
                          if (state is VoiceChatStateLoading) {
                            return CircularProgressIndicator();
                          }
                          return VBMicButton(
                            onRecord: onStart,
                            onStop: onStop,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void addMessage(VoiceChatState state, VoiceChatCubit vcc) {
    _messages.insert(
      0,
      ChatMessage(text: state.processAudio.input, isMe: false),
    );
    _messages.insert(
      0,
      ChatMessage(text: state.processAudio.output, isMe: true),
    );
    vcc.textToAudio(state.processAudio.output, widget.lang);
    setState(() {});
  }
}

Map<String, String> initText = {
  "hindi": "कहिए, मैं आपकी क्या सहायता कर सकता हूं?",
  "tamil": "வணக்கம், நான் உங்களுக்கு எப்படி உதவ முடியும்?",
  "telugu": "హాయ్, నేను మీకు ఎలా సహాయం చేయగలను",
};
