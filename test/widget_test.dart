import 'package:flutter_test/flutter_test.dart';
import 'package:supernova_translator/network/repository.dart';

void main() {
  test('Test get languages', () async {
    var res = await Repository.instance.getLanguages();

    expect(res.languages.length, greaterThan(100));
  });

  test('Test translation', () async {
    var res = await Repository.instance
        .translate(inputText: 'Hello there', targetLanguage: 'sr');

    expect(res.translations[0].detectedSourceLanguage, equals('en'));
    expect(res.translations[0].translatedText, equals('Поздрав'));
  });
}
