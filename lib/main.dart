import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supernova_translator/constants/enums.dart';
import 'package:supernova_translator/screens/favorite_page.dart';
import 'package:supernova_translator/screens/translation_page.dart';
import 'package:supernova_translator/services/sharedpreferences.dart';
import 'package:supernova_translator/stores/connectivity_store.dart';
import 'package:supernova_translator/stores/favorites_store.dart';
import 'package:supernova_translator/stores/pages_store.dart';
import 'package:supernova_translator/stores/translation_store.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  runApp(MyApp(sharedPreferences));
}

class MyApp extends StatelessWidget {
  final _pagesStore = PagesStore();
  final SharedPreferences sharedPreferences;

  MyApp(this.sharedPreferences, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<TranslationStore>(
          create: (_) => TranslationStore(),
        ),
        Provider<PreferencesService>(
          create: (_) => PreferencesService(sharedPreferences),
        ),
        Provider<ConnectivityStore>(
          create: (_) => ConnectivityStore(),
        ),
        ProxyProvider<PreferencesService, FavoritesStore>(
            update: (_, preferencesService, __) =>
                FavoritesStore(preferencesService))
      ],
      child: MaterialApp(
        title: 'Supernova Translator',
        theme: ThemeData(primarySwatch: Colors.blue),
        debugShowCheckedModeBanner: false,
        home: Observer(
          builder: (_) => Scaffold(
            appBar: _buildAppBar(),
            body: SafeArea(
              child: PageContainer(_pagesStore.selectedDestination),
            ),
            bottomNavigationBar: AppBottomNavigationBar(_pagesStore),
          ),
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
        return Consumer3<TranslationStore, ConnectivityStore, FavoritesStore>(
            builder:
                (_, translationStore, connectivityStore, favoriteStore, __) =>
                    TranslationPage(
                        translationStore, connectivityStore, favoriteStore));
      case Pages.Favorite:
        return Consumer<FavoritesStore>(
            builder: (_, favoriteStore, __) => FavoritePage(favoriteStore));
      default:
        return Consumer3<TranslationStore, ConnectivityStore, FavoritesStore>(
            builder:
                (_, translationStore, connectivityStore, favoriteStore, __) =>
                    TranslationPage(
                        translationStore, connectivityStore, favoriteStore));
    }
  }
}
