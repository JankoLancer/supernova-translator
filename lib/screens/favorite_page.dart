import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:supernova_translator/stores/favorites_store.dart';
import 'package:supernova_translator/widgets/translation_card.dart';

class FavoritePage extends StatelessWidget {
  final FavoritesStore store;
  const FavoritePage(this.store, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    return SingleChildScrollView(child: _buildTranslations());
  }

  Widget _buildTranslations() {
    return Observer(builder: (context) {
      return Column(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                ...store.favoriteTranslation
                    .map((element) => TranslationCard(
                          from: element.inputText,
                          to: element.translatedText,
                          detectedLang: element.detectedSourceLanguage,
                          favorited: true,
                          onTap: () => store.removeFromFavorite(element),
                        ))
                    .toList()
              ],
            ),
          )
        ],
      );
    });
  }
}
