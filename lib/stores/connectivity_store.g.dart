// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connectivity_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ConnectivityStore on _ConnectivityStore, Store {
  Computed<bool>? _$isConnectedComputed;

  @override
  bool get isConnected =>
      (_$isConnectedComputed ??= Computed<bool>(() => super.isConnected,
              name: '_ConnectivityStore.isConnected'))
          .value;

  final _$lastStatusAtom = Atom(name: '_ConnectivityStore.lastStatus');

  @override
  ConnectivityResult get lastStatus {
    _$lastStatusAtom.reportRead();
    return super.lastStatus;
  }

  @override
  set lastStatus(ConnectivityResult value) {
    _$lastStatusAtom.reportWrite(value, super.lastStatus, () {
      super.lastStatus = value;
    });
  }

  final _$connectivityStreamAtom =
      Atom(name: '_ConnectivityStore.connectivityStream');

  @override
  ObservableStream<ConnectivityResult> get connectivityStream {
    _$connectivityStreamAtom.reportRead();
    return super.connectivityStream;
  }

  @override
  set connectivityStream(ObservableStream<ConnectivityResult> value) {
    _$connectivityStreamAtom.reportWrite(value, super.connectivityStream, () {
      super.connectivityStream = value;
    });
  }

  final _$ckeckConnectionAsyncAction =
      AsyncAction('_ConnectivityStore.ckeckConnection');

  @override
  Future<void> ckeckConnection() {
    return _$ckeckConnectionAsyncAction.run(() => super.ckeckConnection());
  }

  final _$disposeAsyncAction = AsyncAction('_ConnectivityStore.dispose');

  @override
  Future dispose() {
    return _$disposeAsyncAction.run(() => super.dispose());
  }

  @override
  String toString() {
    return '''
lastStatus: ${lastStatus},
connectivityStream: ${connectivityStream},
isConnected: ${isConnected}
    ''';
  }
}
