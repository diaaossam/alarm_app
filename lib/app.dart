import 'package:alarm_app/core/context/context_helper.dart';
import 'package:alarm_app/features/timer/presentation/pages/working_days_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'config/helper/app_helper.dart';
import 'config/helper/locale_helper/locale_cubit/locale_cubit.dart';
import 'config/helper/locale_helper/locale_cubit/locale_state.dart';
import 'config/theme/app_theme.dart';
import 'core/utils/app_strings.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: AppHelper.providers,
        child: BlocConsumer<LocaleCubit, LocaleState>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
              title: AppStrings.appName,
              navigatorKey: NavigationService.navigatorKey, // set property
              debugShowCheckedModeBanner: false,
              theme: ThemeManger.appTheme(),
              navigatorObservers: [
               // FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance),
              ],
              darkTheme: ThemeManger.blackTheme(),
              themeMode:LocaleCubit.get(context).getThemeMode(),
              locale: LocaleCubit.get(context).locale,
              localizationsDelegates: AppHelper.locales,
              supportedLocales: AppLocalizations.supportedLocales,
              localeResolutionCallback: AppHelper.localeResolutionCallback,
              home: const WorkingDaysScreen(),
            );
          },
        ));
  }
}
