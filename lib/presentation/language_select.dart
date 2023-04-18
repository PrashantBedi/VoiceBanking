import "package:alpha/model/language.dart";
import "package:alpha/widgets/language_list.dart";
import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";

import "../navigation/routes.dart";

class LanguageChange extends StatefulWidget {
  const LanguageChange({Key? key}) : super(key: key);

  @override
  _LanguageChangeState createState() => _LanguageChangeState();
}

class _LanguageChangeState extends State<LanguageChange> {
  final List<Language> languageList = Language.languageList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Select Language",
          ),
        ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              "Choose Preferred Language",
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: VBLanguageList(
                changeLanguage: (_) {
                  AutoRouter.of(context).popUntilRoot();
                  AutoRouter.of(context).push(VoiceChatRoute());
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
