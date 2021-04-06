import 'package:mobx/mobx.dart';

part 'error_store.g.dart';

class ErrorStore = _ErrorStore with _$ErrorStore;

abstract class _ErrorStore with Store {
  List<ReactionDisposer> _disposers = [];

  _ErrorStore() {
    _disposers = [
      reaction((_) => errorMessage, reset, delay: 200),
    ];
  }

  @observable
  String errorMessage = '';

  @action
  void setErrorMessage(String message) {
    errorMessage = message;
  }

  @action
  void reset(String value) {
    errorMessage = '';
  }

  @action
  dynamic dispose() async {
    for (final d in _disposers) {
      d();
    }
  }
}
