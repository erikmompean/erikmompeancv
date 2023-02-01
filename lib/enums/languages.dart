enum Languages { none, en, es }

// TODO ALOMEJOR BORRAR
extension LanguageExtension on Languages {
  static Languages fromString(String language) {
    switch (language) {
      case 'none':
        return Languages.none;
      case 'en':
        return Languages.en;
      case 'es':
        return Languages.es;
      default:
        return Languages.none;
    }
  }
}
