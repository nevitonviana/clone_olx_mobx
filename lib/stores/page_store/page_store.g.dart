// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PageStoreController on _PageStoreControllerBase, Store {
  final _$pageAtom = Atom(name: '_PageStoreControllerBase.page');

  @override
  int get page {
    _$pageAtom.reportRead();
    return super.page;
  }

  @override
  set page(int value) {
    _$pageAtom.reportWrite(value, super.page, () {
      super.page = value;
    });
  }

  final _$_PageStoreControllerBaseActionController =
      ActionController(name: '_PageStoreControllerBase');

  @override
  void setPage(int value) {
    final _$actionInfo = _$_PageStoreControllerBaseActionController.startAction(
        name: '_PageStoreControllerBase.setPage');
    try {
      return super.setPage(value);
    } finally {
      _$_PageStoreControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
page: ${page}
    ''';
  }
}
