import "package:alpha/model/language.dart";
import "package:storage/storage.dart";

import "../common/constants.dart";

class LanguageChangeRepo {
  late Storage _localStorage;

  LanguageChangeRepo(this._localStorage);

  Future<void> languageChange(Language language) async{
    _localStorage.setItem(key: Constants.language, value: language.languageCode);
  }

  Future<String?> getLanguage() async{
    return await _localStorage.getItem(key: Constants.language);
  }

  Future<void> clearLanguage() async{
    return _localStorage.deleteItem(key: Constants.language);
  }
}