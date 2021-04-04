import 'package:flutter/material.dart';
import 'package:supernova_translator/widgets/translation_card.dart';

class TranslationPage extends StatelessWidget {
  const TranslationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    return Column(
      children: [
        _buildNewTranslation(),
        _buildTranslations(),
      ],
    );
  }

  Widget _buildNewTranslation() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: DropdownButton<String>(
                      items: <String>['A', 'B', 'C', 'D'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (_) {},
                    ),
                  ),
                  IconButton(
                      icon: Icon(Icons.swap_horiz), onPressed: () => null),
                  Expanded(
                    child: DropdownButton<String>(
                      items: <String>['A', 'B', 'C', 'D'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (_) {},
                    ),
                  ),
                ],
              ),
              TextField()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTranslations() {
    return Column(
      children: [
        Text('Translations'),
        SingleChildScrollView(
          child: Column(
            children: [
              TranslationCard(
                from: 'Test from',
                to: 'Test to',
                detectedLang: 'en',
              )
            ],
          ),
        )
      ],
    );
  }
}
