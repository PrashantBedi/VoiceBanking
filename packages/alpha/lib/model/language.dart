class Language {
  final String name;
  final String languageCode;
  final String countryCode;

  Language(this.name, this.languageCode, this.countryCode);

  static List<Language> languageList() {
    return <Language>[
      Language("English", "en", "US"),
      Language("Hindi", "hi", "IN"),
    ];
  }
}
