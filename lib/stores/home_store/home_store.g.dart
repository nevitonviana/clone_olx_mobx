// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStoreController on _HomeStoreControllerBase, Store {
  final _$searchAtom = Atom(name: '_HomeStoreControllerBase.search');

  @override
  String get search {
    _$searchAtom.reportRead();
    return super.search;
  }

  @override
  set search(String value) {
    _$searchAtom.reportWrite(value, super.search, () {
      super.search = value;
    });
  }

  final _$categoryAtom = Atom(name: '_HomeStoreControllerBase.category');

  @override
  Category? get category {
    _$categoryAtom.reportRead();
    return super.category;
  }

  @override
  set category(Category? value) {
    _$categoryAtom.reportWrite(value, super.category, () {
      super.category = value;
    });
  }

  final _$filterAtom = Atom(name: '_HomeStoreControllerBase.filter');

  @override
  FilterStoreController get filter {
    _$filterAtom.reportRead();
    return super.filter;
  }

  @override
  set filter(FilterStoreController value) {
    _$filterAtom.reportWrite(value, super.filter, () {
      super.filter = value;
    });
  }

  final _$_HomeStoreControllerBaseActionController =
      ActionController(name: '_HomeStoreControllerBase');

  @override
  void setSearch(String value) {
    final _$actionInfo = _$_HomeStoreControllerBaseActionController.startAction(
        name: '_HomeStoreControllerBase.setSearch');
    try {
      return super.setSearch(value);
    } finally {
      _$_HomeStoreControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCategory(Category value) {
    final _$actionInfo = _$_HomeStoreControllerBaseActionController.startAction(
        name: '_HomeStoreControllerBase.setCategory');
    try {
      return super.setCategory(value);
    } finally {
      _$_HomeStoreControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFilter(FilterStoreController value) {
    final _$actionInfo = _$_HomeStoreControllerBaseActionController.startAction(
        name: '_HomeStoreControllerBase.setFilter');
    try {
      return super.setFilter(value);
    } finally {
      _$_HomeStoreControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
search: ${search},
category: ${category},
filter: ${filter}
    ''';
  }
}
