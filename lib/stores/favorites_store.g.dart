// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FavoritesStore on FavoritesStoreBase, Store {
  final _$favoriteTranslationAtom =
      Atom(name: 'FavoritesStoreBase.favoriteTranslation');

  @override
  ObservableList<TranslateResponse> get favoriteTranslation {
    _$favoriteTranslationAtom.reportRead();
    return super.favoriteTranslation;
  }

  @override
  set favoriteTranslation(ObservableList<TranslateResponse> value) {
    _$favoriteTranslationAtom.reportWrite(value, super.favoriteTranslation, () {
      super.favoriteTranslation = value;
    });
  }

  final _$FavoritesStoreBaseActionController =
      ActionController(name: 'FavoritesStoreBase');

  @override
  void addToFavorite(TranslateResponse translation) {
    final _$actionInfo = _$FavoritesStoreBaseActionController.startAction(
        name: 'FavoritesStoreBase.addToFavorite');
    try {
      return super.addToFavorite(translation);
    } finally {
      _$FavoritesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeFromFavorite(TranslateResponse translation) {
    final _$actionInfo = _$FavoritesStoreBaseActionController.startAction(
        name: 'FavoritesStoreBase.removeFromFavorite');
    try {
      return super.removeFromFavorite(translation);
    } finally {
      _$FavoritesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
favoriteTranslation: ${favoriteTranslation}
    ''';
  }
}
