import "package:alpha/model/language.dart";
import "package:alpha/widgets/language_list.dart";
import "package:alpha/widgets/text_widget.dart";
import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";

import "../cubit/language_change_cubit.dart";
import "../navigation/routes.dart";
import "../utilities/factory/factory.dart";

class LanguageChange extends StatefulWidget implements AutoRouteWrapper {
  const LanguageChange({Key? key}) : super(key: key);

  @override
  _LanguageChangeState createState() => _LanguageChangeState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => languageChangeCubit,
      child: LanguageChange(),
    );
  }
}

class _LanguageChangeState extends State<LanguageChange> {
  final List<Language> languageList = Language.languageList();

  @override
  void initState() {
    context.read<LanguageChangeCubit>().getLanguage();
  }

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
            child: VBTextWidget.headlineLarge(
              "Choose Preferred Language",
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: BlocBuilder<LanguageChangeCubit, LanguageChangeState>(
                builder: (context, state) {
                  if (state is LanguageChangeLoaded)
                    return VBLanguageList(
                      changeLanguage: (language) {
                        context.read<LanguageChangeCubit>().changeLanguage(
                            language);
                        AutoRouter.of(context).popUntilRoot();
                        AutoRouter.of(context).push(VoiceChatRoute());
                      },
                      language: state.language,
                    );
                  return CircularProgressIndicator();
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
