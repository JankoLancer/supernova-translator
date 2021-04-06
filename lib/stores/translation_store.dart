import 'package:mobx/mobx.dart';
import 'package:supernova_translator/models.dart/LanguageResponse.dart';
import 'package:supernova_translator/models.dart/TranslateResponse.dart';
import 'package:supernova_translator/services/network.dart';
import 'package:supernova_translator/stores/error_store.dart';

part 'translation_store.g.dart';

class TranslationStore = TranslationStoreBase with _$TranslationStore;

abstract class TranslationStoreBase with Store {
  final ErrorStore errorStore = ErrorStore();

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

    try {
      languageListTarget = await future;
      languageListSource = LanguageResponseList(
          languages: languageListTarget.languages.toList());
      languageListSource.languages
          .add(LanguageResponse(language: '', name: 'Detect'));
      languageFetched = true;
      selectedSourceLanguage = languageListSource.languages.last;
      selectedTargetLanguage = languageListTarget.languages
          .firstWhere((element) => element.language == 'en');
    } catch (e) {
      errorStore.errorMessage = 'Network error, try again later';
    }
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
    translate();
  }

  @action
  void setTargetLanguage(LanguageResponse language) {
    selectedTargetLanguage = language;
    translate();
  }

  @action
  void swapLanguages() {
    var tempLanguage = selectedTargetLanguage;
    selectedTargetLanguage = selectedSourceLanguage;
    selectedSourceLanguage = tempLanguage;
  }

  @action
  void setTextForTranslation(String text) {
    if (text == textForTranslation) return;
    textForTranslation = text;
    translate();
  }

  @action
  Future<void> translate() async {
    if (textForTranslation == null) return;

    final future = Network.instance.translate(
      inputText: textForTranslation!,
      sourceLanguage: selectedSourceLanguage.language,
      targetLanguage: selectedTargetLanguage.language,
    );

    try {
      fetchTranslationFuture = ObservableFuture(future);
      trenslatedList = await future;
    } catch (e) {
      errorStore.errorMessage = 'Network error, try again later';
    }
  }
}
