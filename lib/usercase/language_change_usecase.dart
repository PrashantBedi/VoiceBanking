import "package:alpha/model/language.dart";

import "../repository/language_change_repo.dart";

class LanguageChangeUsecase {
  late LanguageChangeRepo repo;

  LanguageChangeUsecase(this.repo);

  Future<void> languageChange(Language language) async {
    await repo.languageChange(language);
  }

  Future<Language> getLanguage() async{
    var lc = await repo.getLanguage();
    if(lc == null) {
      return Language.languageList()[0];
    }
    var indexWhere = Language.languageList()
        .indexWhere((element) => element.languageCode == lc);
    return Language.languageList()[indexWhere];
  }
}