import 'package:mobx/mobx.dart';

import '../constants/enums.dart';

part 'pages_store.g.dart';

class PagesStore = PagesStoreBase with _$PagesStore;

abstract class PagesStoreBase with Store {
  static const List<Pages> pages = Pages.values;

  @observable
  int selectedDestinationIndex = pages.indexOf(Pages.Home);

  @computed
  Pages get selectedDestination => pages[selectedDestinationIndex];

  @action
  void selectPage(int index) {
    selectedDestinationIndex = index;
  }
}
