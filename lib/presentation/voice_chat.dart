import "package:alpha/widgets/chat_message.dart";
import "package:alpha/widgets/rounded_elevated_container.dart";
import "package:alpha/widgets/icon_button.dart";
import "package:flutter/material.dart";

import "../common/constants.dart";

class VoiceChat extends StatelessWidget {
  VoiceChat({Key? key}) : super(key: key);

  final List<ChatMessage> _messages = [
    ChatMessage(
      text: "Hi, How may I help you?",
      isMe: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Constants.title,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(8.0),
              itemCount: _messages.length,
              itemBuilder: (BuildContext context, int index) {
                return _messages[index];
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
                    Text("Hindi"),
                    VBIconButton(
                      onPress: () {},
                      icon: Icon(Icons.mic),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
