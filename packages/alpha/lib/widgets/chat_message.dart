import 'package:alpha/colors/app_color.dart';
import 'package:alpha/colors/app_theme_context_extension.dart';
import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  ChatMessage({super.key, required this.text, required this.isMe});

  final String text;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment:
                  isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 5.0),
                  decoration: BoxDecoration(
                    color: context.getColor(AppColor.textChatBox),
                    borderRadius: isMe ? forMe : forUser,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(text),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  var forUser = const BorderRadius.only(
    topRight: Radius.circular(8),
    topLeft: Radius.circular(16),
    bottomRight: Radius.circular(16),
    bottomLeft: Radius.zero,
  );

  var forMe = const BorderRadius.only(
    topRight: Radius.circular(16),
    topLeft: Radius.circular(8),
    bottomRight: Radius.zero,
    bottomLeft: Radius.circular(16),
  );
}
