import "package:alpha/theme/app_theme.dart";
import "package:flutter/material.dart";
import "common/constants.dart";
import "navigation/routes.dart";
import "presentation/voice_chat.dart";

class VoiceBanking extends StatelessWidget {
  VoiceBanking({super.key});

  final Routes _appRouter = Routes();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      title: Constants.title,
      themeMode: AppTheme.currentTheme,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.lightTheme,
      // home: VoiceChat(),
    );
  }
}
