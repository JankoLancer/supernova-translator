import 'package:mobx/mobx.dart';
import 'package:supernova_translator/models.dart/LanguageResponse.dart';
import 'package:supernova_translator/models.dart/TranslateResponse.dart';
import 'package:supernova_translator/services/network.dart';

part 'translation_store.g.dart';

class TranslationStore = TranslationStoreBase with _$TranslationStore;

abstract class TranslationStoreBase with Store {
  @observable
  LanguageResponseList languageListTarget = LanguageResponseList(languages: []);

  @observable
  LanguageResponseList languageListSource = LanguageResponseList(languages: []);

  @observable
  bool languageFetched = false;

  @computed
  bool get swapPossible {
    return selectedSourceLanguage.name != 'Detect';
  }

  @observable
  ObservableFuture fetchLanguagesFuture = ObservableFuture.value([]);

  @computed
  bool get isLanguagesLoading =>
      fetchLanguagesFuture.status == FutureStatus.pending;

  @action
  Future getLanguages() async {
    final future = Network.instance.getLanguages();
    fetchLanguagesFuture = ObservableFuture(future);

    languageListTarget = await future;
    languageListSource =
        LanguageResponseList(languages: languageListTarget.languages.toList());
    languageListSource.languages
        .add(LanguageResponse(language: '', name: 'Detect'));
    languageFetched = true;
    selectedSourceLanguage = languageListSource.languages.last;
    selectedTargetLanguage = languageListTarget.languages
        .firstWhere((element) => element.language == 'en');
  }

  @observable
  LanguageResponse selectedSourceLanguage =
      LanguageResponse(language: '', name: '');

  @observable
  LanguageResponse selectedTargetLanguage =
      LanguageResponse(language: '', name: '');

  @observable
  String? textForTranslation;

  @observable
  TranslateResponseList? trenslatedList;

  @observable
  ObservableFuture fetchTranslationFuture = ObservableFuture.value([]);

  @computed
  bool get isTranslationLoading =>
      fetchTranslationFuture.status == FutureStatus.pending;

  @action
  void setSourceLanguage(LanguageResponse language) {
    selectedSourceLanguage = language;
  }

  @action
  void setTargetLanguage(LanguageResponse language) {
    selectedTargetLanguage = language;
  }

  @action
  void swapLanguages() {
    var tempLanguage = selectedTargetLanguage;
    selectedTargetLanguage = selectedSourceLanguage;
    selectedSourceLanguage = tempLanguage;
  }

  @action
  Future<void> setTextForTranslation(String text) async {
    if (text == textForTranslation) return;
    textForTranslation = text;
    final future = Network.instance.translate(
      inputText: text,
      sourceLanguage: selectedSourceLanguage.language,
      targetLanguage: selectedTargetLanguage.language,
    );

    fetchTranslationFuture = ObservableFuture(future);

    trenslatedList = await future;
  }
}
