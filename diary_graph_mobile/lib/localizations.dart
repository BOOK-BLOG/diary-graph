import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'package:flutter/material.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static Map<String, Map<String, String>> _locallized = {
    'diarygraph': {
      'en': 'Diary Graph',
      'zh': 'Diary Graph',
    },
    'recent': {
      'en': 'Recent',
      'zh': '最近',
    },
    'memories': {
      'en': 'Memories',
      'zh': '回忆',
    },
    'search': {
      'en': 'Search',
      'zh': '搜索',
    },
    'settings': {
      'en': 'Settings',
      'zh': '设置',
    },
    'theme': {
      'en': 'Theme',
      'zh': '主题',
    },
    'cancel': {
      'en': 'Cancel',
      'zh': '取消',
    },
    'applyTheTheme': {
      'en': 'Apply The Theme',
      'zh': '应用主题',
    },
    'restartTheAppToApplyTheTheme': {
      'en': 'Restart the app to apple the theme',
      'zh': '重启应用以应用主题',
    },
    'exitAndRestartManually': {
      'en': 'Exit and restart manually',
      'zh': '退出并手动重启',
    },
    'restartLater': {
      'en': 'Restart later',
      'zh': '稍后重启',
    },
    'showQuickActionButton': {
      'en': 'Show Quick Action Button',
      'zh': '显示快速操作按钮',
    },
  };

  String get diarygraph {
    return _locallized['diarygraph'][locale.languageCode];
  }

  String get recent {
    return _locallized['recent'][locale.languageCode];
  }

  String get memories {
    return _locallized['memories'][locale.languageCode];
  }

  String get search {
    return _locallized['search'][locale.languageCode];
  }

  String get settings {
    return _locallized['settings'][locale.languageCode];
  }

  String get cancel {
    return _locallized['cancel'][locale.languageCode];
  }

  String get theme {
    return _locallized['theme'][locale.languageCode];
  }

  String get applyTheTheme {
    return _locallized['applyTheTheme'][locale.languageCode];
  }

  String get restartTheAppToApplyTheTheme {
    return _locallized['restartTheAppToApplyTheTheme'][locale.languageCode];
  }

  String get exitAndRestartManually {
    return _locallized['exitAndRestartManually'][locale.languageCode];
  }

  String get restartLater {
    return _locallized['restartLater'][locale.languageCode];
  }

  String get showQuickActionButton {
    return _locallized['showQuickActionButton'][locale.languageCode];
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(
      AppLocalizations(locale),
    );
  }

  @override
  bool isSupported(Locale locale) {
    return true;
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) {
    return true;
  }
}
