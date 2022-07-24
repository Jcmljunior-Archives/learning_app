import '../model/locale_model.dart';

class LocaleController {
  List<LocaleModel> locales;

  LocaleController({
    required this.locales,
  });

  LocaleModel getLocale(String query) {
    return locales
        .where((LocaleModel locale) => locale.lang.contains(query))
        .toList()
        .first;
  }
}
