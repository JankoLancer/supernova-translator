import 'dart:async';

import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:supernova_translator/models.dart/LanguageResponse.dart';
import 'package:supernova_translator/stores/connectivity_store.dart';
import 'package:supernova_translator/stores/favorites_store.dart';
import 'package:supernova_translator/stores/translation_store.dart';
import 'package:supernova_translator/widgets/translation_card.dart';

class TranslationPage extends StatefulWidget {
  final translationStore;
  final connectivityStore;
  final favoriteStore;

  TranslationPage(
      this.translationStore, this.connectivityStore, this.favoriteStore,
      {Key? key})
      : super(key: key);

  @override
  _TranslationPageState createState() => _TranslationPageState();
}

class _TranslationPageState extends State<TranslationPage> {
  late TranslationStore tranStore;
  late ConnectivityStore connStore;
  late FavoritesStore favStore;
  late TextEditingController translationController;
  Timer? _debounce;
  ReactionDisposer? _disposer;

  @override
  void initState() {
    super.initState();
    tranStore = widget.translationStore;
    connStore = widget.connectivityStore;
    favStore = widget.favoriteStore;
    translationController =
        TextEditingController(text: tranStore.textForTranslation);

    _disposer = reaction<bool>((_) => connStore.isConnected, (connected) {
      if (connected && !tranStore.languageFetched) {
        tranStore.getLanguages();
      }
      if (!connected) {
        final currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _disposer!();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _handleErrorMessage(),
        _buildNewTranslation(),
        _buildTranslations(),
      ],
    );
  }

  Widget _handleErrorMessage() {
    return Observer(
      builder: (context) {
        if (tranStore.errorStore.errorMessage.isNotEmpty) {
          Future.delayed(Duration(milliseconds: 0), () {
            FlushbarHelper.createError(
              message: tranStore.errorStore.errorMessage,
              duration: Duration(seconds: 3),
            ).show(context);
          });
        }
        return Container();
      },
    );
  }

  Widget _buildNewTranslation() {
    return Observer(builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: IntrinsicHeight(
            child: Stack(
              children: [
                _buildTranslationForm(),
                _buildNoConnectionIfNeeded(),
                _buildLanguageLoadingIfNeeded()
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget _buildTranslationForm() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: DropdownButton<LanguageResponse>(
                  isExpanded: true,
                  value: tranStore.selectedSourceLanguage,
                  items: tranStore.languageListSource.languages
                      .map((LanguageResponse language) {
                    return DropdownMenuItem<LanguageResponse>(
                      value: language,
                      child: Text(language.name),
                    );
                  }).toList(),
                  onChanged: (selected) {
                    tranStore.setSourceLanguage(selected!);
                  },
                ),
              ),
              IconButton(
                icon: Icon(Icons.swap_horiz),
                onPressed:
                    tranStore.swapPossible ? tranStore.swapLanguages : null,
              ),
              Expanded(
                child: DropdownButton<LanguageResponse>(
                    isExpanded: true,
                    value: tranStore.selectedTargetLanguage,
                    items: tranStore.languageListTarget.languages
                        .map((LanguageResponse language) {
                      return DropdownMenuItem<LanguageResponse>(
                        value: language,
                        child: Text(language.name),
                      );
                    }).toList(),
                    onChanged: (selected) {
                      tranStore.setTargetLanguage(selected!);
                    }),
              ),
            ],
          ),
          TextField(
            controller: translationController,
            onChanged: (newValue) {
              if (_debounce?.isActive ?? false) _debounce!.cancel();
              _debounce = Timer(const Duration(milliseconds: 1000), () {
                tranStore.setTextForTranslation(newValue);
              });
            },
          )
        ],
      ),
    );
  }

  Widget _buildLanguageLoadingIfNeeded() {
    return Observer(builder: (context) {
      return (tranStore.isLanguagesLoading)
          ? Positioned.fill(
              child: AbsorbPointer(
                absorbing: true,
                child: Container(
                  color: const Color(0xFF000000).withOpacity(0.3),
                  child: Center(child: CircularProgressIndicator()),
                ),
              ),
            )
          : Container();
    });
  }

  Widget _buildNoConnectionIfNeeded() {
    return Observer(builder: (context) {
      return (!connStore.isConnected)
          ? Positioned.fill(
              child: AbsorbPointer(
                absorbing: true,
                child: Container(
                  color: const Color(0xFF000000).withOpacity(0.3),
                  child: Center(child: Icon(Icons.signal_wifi_off)),
                ),
              ),
            )
          : Container();
    });
  }

  Widget _buildTranslations() {
    return Expanded(
      child: Observer(builder: (context) {
        return Column(
          children: [
            Text('Translations'),
            if (!tranStore.isTranslationLoading)
              Expanded(
                child: SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(),
                    child: Column(
                      children: [
                        if (tranStore.trenslatedList != null)
                          ...tranStore.trenslatedList!.translations.map((e) {
                            final favorited = favStore.containsFavorite(e);
                            return e.inputText.isNotEmpty
                                ? TranslationCard(
                                    from: e.inputText,
                                    to: e.translatedText,
                                    detectedLang: e.detectedSourceLanguage,
                                    favorited: favorited,
                                    onTap: favorited
                                        ? () => favStore.removeFromFavorite(e)
                                        : () => favStore.addToFavorite(e),
                                  )
                                : Container();
                          }).toList()
                      ],
                    ),
                  ),
                ),
              )
            else
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: CircularProgressIndicator(),
              )
          ],
        );
      }),
    );
  }
}
