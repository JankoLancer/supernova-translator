// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pages_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PagesStore on PagesStoreBase, Store {
  Computed<Pages>? _$selectedDestinationComputed;

  @override
  Pages get selectedDestination => (_$selectedDestinationComputed ??=
          Computed<Pages>(() => super.selectedDestination,
              name: 'PagesStoreBase.selectedDestination'))
      .value;

  final _$selectedDestinationIndexAtom =
      Atom(name: 'PagesStoreBase.selectedDestinationIndex');

  @override
  int get selectedDestinationIndex {
    _$selectedDestinationIndexAtom.reportRead();
    return super.selectedDestinationIndex;
  }

  @override
  set selectedDestinationIndex(int value) {
    _$selectedDestinationIndexAtom
        .reportWrite(value, super.selectedDestinationIndex, () {
      super.selectedDestinationIndex = value;
    });
  }

  final _$PagesStoreBaseActionController =
      ActionController(name: 'PagesStoreBase');

  @override
  void selectPage(int index) {
    final _$actionInfo = _$PagesStoreBaseActionController.startAction(
        name: 'PagesStoreBase.selectPage');
    try {
      return super.selectPage(index);
    } finally {
      _$PagesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedDestinationIndex: ${selectedDestinationIndex},
selectedDestination: ${selectedDestination}
    ''';
  }
}
