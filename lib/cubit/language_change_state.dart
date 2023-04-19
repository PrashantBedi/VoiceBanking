part of "language_change_cubit.dart";

abstract class LanguageChangeState {}

class LanguageChangeInitial extends LanguageChangeState{}

class LanguageChangeLoading extends LanguageChangeState{}

class LanguageChangeLoaded extends LanguageChangeState{
  Language language;

  LanguageChangeLoaded(this.language);
}

class LanguageChangeError extends LanguageChangeState{}

