import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'messages_all.dart';


class AppLocalizations {
  static Future<AppLocalizations> load(Locale locale) {
    final String name =
    locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      print(
          'the local code of $localeName ${locale.countryCode.isEmpty} ${locale}');
      return AppLocalizations();
    });
  }

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  String get appName {
    return Intl.message('WanAndroid', name: 'appName');
  }
  String get viewStateMessageError {
    return Intl.message('WanAndroid', name: 'viewStateMessageError');
  }
  String get viewStateMessageNetworkError {
    return Intl.message('WanAndroid', name: 'viewStateMessageNetworkError');
  }
  String get viewStateMessageEmpty {
    return Intl.message('WanAndroid', name: 'viewStateMessageEmpty');
  }
  String get viewStateButtonRefresh {
    return Intl.message('WanAndroid', name: 'viewStateButtonRefresh');
  }
  String get viewStateButtonRetry {
    return Intl.message('WanAndroid', name: 'viewStateButtonRetry');
  }
  String get viewStateMessageUnAuth {
    return Intl.message('WanAndroid', name: 'viewStateMessageUnAuth');
  }
  String get viewStateButtonLogin {
    return Intl.message('WanAndroid', name: 'viewStateButtonLogin');
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'zh'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}

