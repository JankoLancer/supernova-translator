// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'translation_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TranslationStore on TranslationStoreBase, Store {
  Computed<bool>? _$swapPossibleComputed;

  @override
  bool get swapPossible =>
      (_$swapPossibleComputed ??= Computed<bool>(() => super.swapPossible,
              name: 'TranslationStoreBase.swapPossible'))
          .value;
  Computed<bool>? _$isLanguagesLoadingComputed;

  @override
  bool get isLanguagesLoading => (_$isLanguagesLoadingComputed ??=
          Computed<bool>(() => super.isLanguagesLoading,
              name: 'TranslationStoreBase.isLanguagesLoading'))
      .value;
  Computed<bool>? _$isTranslationLoadingComputed;

  @override
  bool get isTranslationLoading => (_$isTranslationLoadingComputed ??=
          Computed<bool>(() => super.isTranslationLoading,
              name: 'TranslationStoreBase.isTranslationLoading'))
      .value;

  final _$languageListTargetAtom =
      Atom(name: 'TranslationStoreBase.languageListTarget');

  @override
  LanguageResponseList get languageListTarget {
    _$languageListTargetAtom.reportRead();
    return super.languageListTarget;
  }

  @override
  set languageListTarget(LanguageResponseList value) {
    _$languageListTargetAtom.reportWrite(value, super.languageListTarget, () {
      super.languageListTarget = value;
    });
  }

  final _$languageListSourceAtom =
      Atom(name: 'TranslationStoreBase.languageListSource');

  @override
  LanguageResponseList get languageListSource {
    _$languageListSourceAtom.reportRead();
    return super.languageListSource;
  }

  @override
  set languageListSource(LanguageResponseList value) {
    _$languageListSourceAtom.reportWrite(value, super.languageListSource, () {
      super.languageListSource = value;
    });
  }

  final _$languageFetchedAtom =
      Atom(name: 'TranslationStoreBase.languageFetched');

  @override
  bool get languageFetched {
    _$languageFetchedAtom.reportRead();
    return super.languageFetched;
  }

  @override
  set languageFetched(bool value) {
    _$languageFetchedAtom.reportWrite(value, super.languageFetched, () {
      super.languageFetched = value;
    });
  }

  final _$fetchLanguagesFutureAtom =
      Atom(name: 'TranslationStoreBase.fetchLanguagesFuture');

  @override
  ObservableFuture<dynamic> get fetchLanguagesFuture {
    _$fetchLanguagesFutureAtom.reportRead();
    return super.fetchLanguagesFuture;
  }

  @override
  set fetchLanguagesFuture(ObservableFuture<dynamic> value) {
    _$fetchLanguagesFutureAtom.reportWrite(value, super.fetchLanguagesFuture,
        () {
      super.fetchLanguagesFuture = value;
    });
  }

  final _$selectedSourceLanguageAtom =
      Atom(name: 'TranslationStoreBase.selectedSourceLanguage');

  @override
  LanguageResponse get selectedSourceLanguage {
    _$selectedSourceLanguageAtom.reportRead();
    return super.selectedSourceLanguage;
  }

  @override
  set selectedSourceLanguage(LanguageResponse value) {
    _$selectedSourceLanguageAtom
        .reportWrite(value, super.selectedSourceLanguage, () {
      super.selectedSourceLanguage = value;
    });
  }

  final _$selectedTargetLanguageAtom =
      Atom(name: 'TranslationStoreBase.selectedTargetLanguage');

  @override
  LanguageResponse get selectedTargetLanguage {
    _$selectedTargetLanguageAtom.reportRead();
    return super.selectedTargetLanguage;
  }

  @override
  set selectedTargetLanguage(LanguageResponse value) {
    _$selectedTargetLanguageAtom
        .reportWrite(value, super.selectedTargetLanguage, () {
      super.selectedTargetLanguage = value;
    });
  }

  final _$textForTranslationAtom =
      Atom(name: 'TranslationStoreBase.textForTranslation');

  @override
  String? get textForTranslation {
    _$textForTranslationAtom.reportRead();
    return super.textForTranslation;
  }

  @override
  set textForTranslation(String? value) {
    _$textForTranslationAtom.reportWrite(value, super.textForTranslation, () {
      super.textForTranslation = value;
    });
  }

  final _$trenslatedListAtom =
      Atom(name: 'TranslationStoreBase.trenslatedList');

  @override
  TranslateResponseList? get trenslatedList {
    _$trenslatedListAtom.reportRead();
    return super.trenslatedList;
  }

  @override
  set trenslatedList(TranslateResponseList? value) {
    _$trenslatedListAtom.reportWrite(value, super.trenslatedList, () {
      super.trenslatedList = value;
    });
  }

  final _$fetchTranslationFutureAtom =
      Atom(name: 'TranslationStoreBase.fetchTranslationFuture');

  @override
  ObservableFuture<dynamic> get fetchTranslationFuture {
    _$fetchTranslationFutureAtom.reportRead();
    return super.fetchTranslationFuture;
  }

  @override
  set fetchTranslationFuture(ObservableFuture<dynamic> value) {
    _$fetchTranslationFutureAtom
        .reportWrite(value, super.fetchTranslationFuture, () {
      super.fetchTranslationFuture = value;
    });
  }

  final _$getLanguagesAsyncAction =
      AsyncAction('TranslationStoreBase.getLanguages');

  @override
  Future<dynamic> getLanguages() {
    return _$getLanguagesAsyncAction.run(() => super.getLanguages());
  }

  final _$translateAsyncAction = AsyncAction('TranslationStoreBase.translate');

  @override
  Future<void> translate() {
    return _$translateAsyncAction.run(() => super.translate());
  }

  final _$TranslationStoreBaseActionController =
      ActionController(name: 'TranslationStoreBase');

  @override
  void setSourceLanguage(LanguageResponse language) {
    final _$actionInfo = _$TranslationStoreBaseActionController.startAction(
        name: 'TranslationStoreBase.setSourceLanguage');
    try {
      return super.setSourceLanguage(language);
    } finally {
      _$TranslationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTargetLanguage(LanguageResponse language) {
    final _$actionInfo = _$TranslationStoreBaseActionController.startAction(
        name: 'TranslationStoreBase.setTargetLanguage');
    try {
      return super.setTargetLanguage(language);
    } finally {
      _$TranslationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void swapLanguages() {
    final _$actionInfo = _$TranslationStoreBaseActionController.startAction(
        name: 'TranslationStoreBase.swapLanguages');
    try {
      return super.swapLanguages();
    } finally {
      _$TranslationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTextForTranslation(String text) {
    final _$actionInfo = _$TranslationStoreBaseActionController.startAction(
        name: 'TranslationStoreBase.setTextForTranslation');
    try {
      return super.setTextForTranslation(text);
    } finally {
      _$TranslationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
languageListTarget: ${languageListTarget},
languageListSource: ${languageListSource},
languageFetched: ${languageFetched},
fetchLanguagesFuture: ${fetchLanguagesFuture},
selectedSourceLanguage: ${selectedSourceLanguage},
selectedTargetLanguage: ${selectedTargetLanguage},
textForTranslation: ${textForTranslation},
trenslatedList: ${trenslatedList},
fetchTranslationFuture: ${fetchTranslationFuture},
swapPossible: ${swapPossible},
isLanguagesLoading: ${isLanguagesLoading},
isTranslationLoading: ${isTranslationLoading}
    ''';
  }
}
