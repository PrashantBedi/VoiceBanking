import "package:alpha/model/language.dart";
import "package:flutter_bloc/flutter_bloc.dart";

import "../usercase/language_change_usecase.dart";

part "language_change_state.dart";

class LanguageChangeCubit extends Cubit<LanguageChangeState> {
  LanguageChangeCubit(this.lcu): super(LanguageChangeInitial());

  LanguageChangeUseCase lcu;

  Future<void> changeLanguage(Language language) async {
    await lcu.languageChange(language);
  }

  Future<void> getLanguage() async {
    emit(LanguageChangeLoading());
    var language = await lcu.getLanguage();
    emit(LanguageChangeLoaded(language));
  }
}