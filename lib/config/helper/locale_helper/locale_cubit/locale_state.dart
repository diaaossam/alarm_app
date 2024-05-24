abstract class LocaleState {}

class ChangeLocaleState extends LocaleState {}

class ToggleLocaleState extends LocaleState {
  final int index;

  ToggleLocaleState({required this.index});
}

class ChangeLocaleState2 extends LocaleState {}

class LocaleInitial extends LocaleState {}

class ChangeAppTheme extends LocaleState {}

class LastPageViewState extends LocaleState {}

class ChooseAppLangState extends LocaleState {}

class ChooseAppAdvertState extends LocaleState {}

class ChooseAppThemeState extends LocaleState {}

class CacheAppDataSuccessState extends LocaleState {}

class CacheAppDataLoadingState extends LocaleState {}

class SaveLangPageState extends LocaleState {}

class GetCachedAppThemeState extends LocaleState {}

class SystemThemeState extends LocaleState {}
