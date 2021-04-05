import 'package:dio/dio.dart';
import 'package:supernova_translator/constants/endpoints.dart';
import 'package:supernova_translator/models.dart/LanguageResponse.dart';
import 'package:supernova_translator/models.dart/TranslateResponse.dart';

class Repository {
  Repository._();

  static final Repository _instance = Repository._();

  static Repository get instance => _instance;

  Future<TranslateResponseList> translate({
    required String inputText,
    required String targetLanguage,
    String? sourceLanguage,
  }) async {
    try {
      final res = await Dio().post(Endpoints.TRANSLATE_API, queryParameters: {
        'q': inputText,
        'target': targetLanguage,
        'source': sourceLanguage,
        'key': Endpoints.TRANSLATE_API_KEY
      });

      return TranslateResponseList.fromJson(res.data ?? [], inputText);
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  Future<LanguageResponseList> getLanguages() async {
    try {
      final res = await Dio().get(Endpoints.LANGUAGES_API, queryParameters: {
        'target': 'en',
        'key': Endpoints.TRANSLATE_API_KEY
      });

      return LanguageResponseList.fromJson(res.data ?? []);
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }
}
