import 'package:alpha/widgets/icon_button.dart';
import 'package:flutter/material.dart';

class VBRoundedElevatedCard extends StatelessWidget {
  final Widget child;
  const VBRoundedElevatedCard({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          side: BorderSide(
            color: Colors.black26,
            width: 0.5,
          )),
      elevation: 5,
      child: child,
    );
  }
}
