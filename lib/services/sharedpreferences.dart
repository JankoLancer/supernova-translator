import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:supernova_translator/models.dart/TranslateResponse.dart';

class PreferencesService {
  const PreferencesService(this._prefs);
  final SharedPreferences _prefs;
  final translationKey = 'translations';

  set saveListOfFavoritedTranslation(List<TranslateResponse> list) {
    _prefs.setStringList(
        translationKey, list.map((e) => jsonEncode(e.toJson())).toList());
  }

  List<TranslateResponse> get readListOfFavoritedTranslation {
    return _prefs
            .getStringList(translationKey)
            ?.map((e) => TranslateResponse.fromJson(jsonDecode(e), null))
            .toList() ??
        [];
  }
}
