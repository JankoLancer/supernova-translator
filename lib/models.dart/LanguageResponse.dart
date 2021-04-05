class LanguageResponseList {
  final List<LanguageResponse> languages;

  LanguageResponseList({
    required this.languages,
  });

  factory LanguageResponseList.fromJson(Map<String, dynamic> json) {
    var languages = json['data']['languages']
        .map<LanguageResponse>((post) => LanguageResponse.fromJson(post))
        .toList();

    return LanguageResponseList(
      languages: languages,
    );
  }
}

class LanguageResponse {
  String language;
  String name;

  LanguageResponse({required this.language, required this.name});

  factory LanguageResponse.fromJson(Map<String, dynamic> json) =>
      LanguageResponse(
        language: json['language'],
        name: json['name'],
      );

  @override
  String toString() {
    return '$name $language';
  }
}
