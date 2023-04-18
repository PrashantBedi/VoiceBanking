import "package:auto_route/annotations.dart";
import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";

import "../presentation/language_select.dart";
import "../presentation/login.dart";
import "../presentation/voice_chat.dart";

part "routes.gr.dart";

@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(page: VoiceChat, path: "/chat", initial: true),
    AutoRoute(page: LanguageChange, path: "/lang"),
    AutoRoute(page: Login, path: "/login"),
  ],
)
class Routes extends _$Routes {
  Routes();
}
