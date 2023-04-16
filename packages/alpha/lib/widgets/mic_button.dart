import 'package:alpha/colors/app_theme_context_extension.dart';
import 'package:flutter/material.dart';

import '../colors/app_color.dart';

class VBMicButton extends StatefulWidget {
  final VoidCallback onRecord;
  final VoidCallback onStop;

  const VBMicButton({Key? key, required this.onRecord, required this.onStop})
      : super(key: key);

  @override
  State<VBMicButton> createState() => _VBMicButtonState();
}

class _VBMicButtonState extends State<VBMicButton> {
  bool isRecording = false;

  void onPress() {
    isRecording ? widget.onStop() : widget.onRecord();
    setState(() {
      isRecording = !isRecording;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          shape: MaterialStateProperty.resolveWith((states) =>
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
          backgroundColor: MaterialStateProperty.resolveWith(
              (states) => context.getColor(AppColor.primary))),
      onPressed: onPress,
      child: Icon(
        isRecording ? Icons.stop : Icons.mic,
        color: context.getColor(AppColor.icon),
      ),
    );
  }
}
