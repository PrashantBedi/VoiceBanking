import "package:alpha/theme/app_theme.dart";
import "package:flutter/material.dart";
import "common/constants.dart";
import "navigation/routes.dart";
import "presentation/voice_chat.dart";

class VoiceBanking extends StatelessWidget {
  const VoiceBanking({super.key});

  @override
  Widget build(BuildContext context) {
    final Routes _appRouter = Routes();
    return MaterialApp(
      // routerDelegate: _appRouter.delegate(),
      // routeInformationParser: _appRouter.defaultRouteParser(),
      title: Constants.title,
      themeMode: AppTheme.currentTheme,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.lightTheme,
      home: VoiceChat(),
    );
  }
}
