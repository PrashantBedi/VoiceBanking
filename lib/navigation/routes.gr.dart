// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'routes.dart';

class _$Routes extends RootStackRouter {
  _$Routes([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    VoiceChatRoute.name: (routeData) {
      final args = routeData.argsAs<VoiceChatRouteArgs>(
          orElse: () => const VoiceChatRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: VoiceChat(key: args.key),
      );
    },
    LanguageChangeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const LanguageChange(),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: Login(key: args.key),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/chat',
          fullMatch: true,
        ),
        RouteConfig(
          VoiceChatRoute.name,
          path: '/chat',
        ),
        RouteConfig(
          LanguageChangeRoute.name,
          path: '/lang',
        ),
        RouteConfig(
          LoginRoute.name,
          path: '/login',
        ),
      ];
}

/// generated route for
/// [VoiceChat]
class VoiceChatRoute extends PageRouteInfo<VoiceChatRouteArgs> {
  VoiceChatRoute({Key? key})
      : super(
          VoiceChatRoute.name,
          path: '/chat',
          args: VoiceChatRouteArgs(key: key),
        );

  static const String name = 'VoiceChatRoute';
}

class VoiceChatRouteArgs {
  const VoiceChatRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'VoiceChatRouteArgs{key: $key}';
  }
}

/// generated route for
/// [LanguageChange]
class LanguageChangeRoute extends PageRouteInfo<void> {
  const LanguageChangeRoute()
      : super(
          LanguageChangeRoute.name,
          path: '/lang',
        );

  static const String name = 'LanguageChangeRoute';
}

/// generated route for
/// [Login]
class LoginRoute extends PageRouteInfo<LoginRouteArgs> {
  LoginRoute({Key? key})
      : super(
          LoginRoute.name,
          path: '/login',
          args: LoginRouteArgs(key: key),
        );

  static const String name = 'LoginRoute';
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key}';
  }
}
