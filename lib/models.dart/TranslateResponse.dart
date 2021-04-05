class TranslateResponseList {
  final List<TranslateResponse> translations;

  TranslateResponseList({
    required this.translations,
  });

  factory TranslateResponseList.fromJson(
      Map<String, dynamic> json, String inputText) {
    var translations = json['data']['translations']
        .map<TranslateResponse>(
            (post) => TranslateResponse.fromJson(post, inputText))
        .toList();

    return TranslateResponseList(
      translations: translations,
    );
  }
}

class TranslateResponse {
  String? detectedSourceLanguage;
  String? model;
  String? translatedText;
  String inputText;

  TranslateResponse(
      {required this.detectedSourceLanguage,
      required this.model,
      required this.translatedText,
      required this.inputText});

  factory TranslateResponse.fromJson(
          Map<String, dynamic> json, String inputText) =>
      TranslateResponse(
          detectedSourceLanguage: json['detectedSourceLanguage'],
          model: json['model'],
          translatedText: json['translatedText'],
          inputText: inputText);
}
