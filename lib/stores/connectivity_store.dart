import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:mobx/mobx.dart';

part 'connectivity_store.g.dart';

class ConnectivityStore = _ConnectivityStore with _$ConnectivityStore;

abstract class _ConnectivityStore with Store {
  List<ReactionDisposer> _disposers = [];

  _ConnectivityStore() {
    _disposers = [
      reaction<ConnectivityResult?>(
        (_) => connectivityStream.value,
        (result) {
          lastStatus = result ?? ConnectivityResult.none;
        },
      ),
    ];

    ckeckConnection();
  }

  @observable
  ConnectivityResult lastStatus = ConnectivityResult.none;

  @observable
  ObservableStream<ConnectivityResult> connectivityStream =
      ObservableStream(Connectivity().onConnectivityChanged);

  @computed
  bool get isConnected {
    return lastStatus != ConnectivityResult.none;
  }

  @action
  Future<void> ckeckConnection() async {
    lastStatus = await Connectivity().checkConnectivity();
  }

  @action
  dynamic dispose() async {
    for (final d in _disposers) {
      d();
    }
  }
}
