import 'package:mobx/mobx.dart';
import 'package:supernova_translator/models.dart/TranslateResponse.dart';
import 'package:supernova_translator/services/sharedpreferences.dart';

part 'favorites_store.g.dart';

class FavoritesStore = FavoritesStoreBase with _$FavoritesStore;

abstract class FavoritesStoreBase with Store {
  final PreferencesService _preferencesService;

  FavoritesStoreBase(this._preferencesService) {
    favoriteTranslation =
        ObservableList.of(_preferencesService.readListOfFavoritedTranslation);
  }

  @observable
  ObservableList<TranslateResponse> favoriteTranslation = ObservableList.of([]);

  @action
  void addToFavorite(TranslateResponse translation) {
    favoriteTranslation.add(translation);
    _preferencesService.saveListOfFavoritedTranslation = favoriteTranslation;
  }

  @action
  void removeFromFavorite(TranslateResponse translation) {
    favoriteTranslation.remove(translation);
    _preferencesService.saveListOfFavoritedTranslation = favoriteTranslation;
  }

  bool containsFavorite(TranslateResponse translation) {
    return favoriteTranslation.contains(translation);
  }
}
