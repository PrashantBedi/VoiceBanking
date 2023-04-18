import "dart:ui";
import "package:flutter/scheduler.dart";

class Language {
  final String flag;
  final String name;
  final String languageCode;
  final String countryCode;

  Language(this.flag, this.name, this.languageCode, this.countryCode);
  static Locale currentLocale = SchedulerBinding.instance.window.locale;

  static List<Language> languageList() {
    return <Language>[
      Language("🇨🇵", "French", "fr", "FR"),
      Language("🇺🇸", "English", "en", "US"),
      Language("🇮🇳", "Hindi", "hi", "IN"),
    ];
  }
}
