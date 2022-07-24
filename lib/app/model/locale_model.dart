import 'dart:convert';

LocaleModel localeModelFromJson(String str) {
  final data = jsonDecode(str);
  return LocaleModel.fromMap(data);
}

String localeModelToJson(LocaleModel locale) {
  final data = locale.toMap();
  return jsonEncode(data);
}

class LocaleModel {
  int id;
  String lang;

  LocaleModel({
    required this.id,
    required this.lang,
  });

  factory LocaleModel.fromMap(Map<String, dynamic> json) => LocaleModel(
        id: json['id'],
        lang: json['lang'],
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'lang': lang,
    };
  }

  @override
  String toString() {
    return 'Locale{id: $id, lang: $lang}';
  }
}
