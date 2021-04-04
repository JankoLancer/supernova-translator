import 'package:flutter/material.dart';
import 'package:supernova_translator/widgets/translation_card.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    return Column(
      children: [
        _buildTranslations(),
      ],
    );
  }

  Widget _buildTranslations() {
    return Column(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              TranslationCard(
                from: 'Test from',
                to: 'Test to',
                detectedLang: 'en',
              ),
              TranslationCard(
                from: 'Test from',
                to: 'Test to',
                detectedLang: 'en',
              ),
              TranslationCard(
                from: 'Test from',
                to: 'Test to',
                detectedLang: 'en',
              ),
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
