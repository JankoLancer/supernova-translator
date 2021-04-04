import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:supernova_translator/constants/enums.dart';
import 'package:supernova_translator/screens/favorite_page.dart';
import 'package:supernova_translator/screens/translation_page.dart';
import 'package:supernova_translator/stores/pages_store.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _pagesStore = PagesStore(); // Instantiate the store

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Observer(
        builder: (_) => Scaffold(
          appBar: _buildAppBar(),
          body: SafeArea(
            child: PageContainer(
              _pagesStore.selectedDestination,
            ),
          ),
          bottomNavigationBar: AppBottomNavigationBar(_pagesStore),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(title: Text('Supernova Translator'));
  }
}

class AppBottomNavigationBar extends StatelessWidget {
  final PagesStore store;

  const AppBottomNavigationBar(
    this.store, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      key: const Key('bottomNavigationBar'),
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      currentIndex: store.selectedDestinationIndex,
      items: PagesStoreBase.pages.map(
        (option) {
          switch (option) {
            case Pages.Home:
              return const BottomNavigationBarItem(
                icon: Icon(Icons.translate),
                label: 'Translate',
              );
            case Pages.Favorite:
              return const BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Favorite',
              );
            default:
              return const BottomNavigationBarItem(
                icon: Icon(Icons.translate),
                label: 'Translate',
              );
          }
        },
      ).toList(),
      onTap: (index) => store.selectPage(index),
    );
  }
}

class PageContainer extends StatelessWidget {
  const PageContainer(this.destination, {Key? key}) : super(key: key);

  final Pages destination;

  @override
  Widget build(BuildContext context) {
    switch (destination) {
      case Pages.Home:
        return TranslationPage();
      case Pages.Favorite:
        return FavoritePage();
      default:
        return TranslationPage();
    }
  }
}
