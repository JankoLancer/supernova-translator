import 'package:connectivity/connectivity.dart';
import 'package:mobx/mobx.dart';

part 'connectivity_store.g.dart';

class ConnectivityStore = _ConnectivityStore with _$ConnectivityStore;

abstract class _ConnectivityStore with Store {
  @observable
  ObservableStream<ConnectivityResult> connectivityStream =
      ObservableStream(Connectivity().onConnectivityChanged);

  @computed
  bool get isConnected {
    return connectivityStream.status == StreamStatus.active &&
        connectivityStream.value != ConnectivityResult.none;
  }

  void dispose() {}
}
