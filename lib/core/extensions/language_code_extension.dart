enum LanguageCode {
  english,
  arabic,
}

extension LanguageExtension on LanguageCode {
  String get value {
    switch (this) {
      case LanguageCode.english:
        return 'en';
      case LanguageCode.arabic:
        return 'ar';
    }
  }
}
