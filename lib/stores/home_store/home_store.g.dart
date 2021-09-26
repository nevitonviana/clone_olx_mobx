// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStoreController on _HomeStoreControllerBase, Store {
  Computed<int>? _$itemCountComputed;

  @override
  int get itemCount =>
      (_$itemCountComputed ??= Computed<int>(() => super.itemCount,
              name: '_HomeStoreControllerBase.itemCount'))
          .value;
  Computed<bool>? _$showProgressComputed;

  @override
  bool get showProgress =>
      (_$showProgressComputed ??= Computed<bool>(() => super.showProgress,
              name: '_HomeStoreControllerBase.showProgress'))
          .value;

  final _$errorAtom = Atom(name: '_HomeStoreControllerBase.error');

  @override
  String? get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String? value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  final _$loadingAtom = Atom(name: '_HomeStoreControllerBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

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

  final _$pageAtom = Atom(name: '_HomeStoreControllerBase.page');

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

  final _$lastPageAtom = Atom(name: '_HomeStoreControllerBase.lastPage');

  @override
  bool get lastPage {
    _$lastPageAtom.reportRead();
    return super.lastPage;
  }

  @override
  set lastPage(bool value) {
    _$lastPageAtom.reportWrite(value, super.lastPage, () {
      super.lastPage = value;
    });
  }

  final _$_HomeStoreControllerBaseActionController =
      ActionController(name: '_HomeStoreControllerBase');

  @override
  void setError(String value) {
    final _$actionInfo = _$_HomeStoreControllerBaseActionController.startAction(
        name: '_HomeStoreControllerBase.setError');
    try {
      return super.setError(value);
    } finally {
      _$_HomeStoreControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$_HomeStoreControllerBaseActionController.startAction(
        name: '_HomeStoreControllerBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_HomeStoreControllerBaseActionController.endAction(_$actionInfo);
    }
  }

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
  void loadNextPage() {
    final _$actionInfo = _$_HomeStoreControllerBaseActionController.startAction(
        name: '_HomeStoreControllerBase.loadNextPage');
    try {
      return super.loadNextPage();
    } finally {
      _$_HomeStoreControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addNewAds(List<ModelAnnouncement>? newAds) {
    final _$actionInfo = _$_HomeStoreControllerBaseActionController.startAction(
        name: '_HomeStoreControllerBase.addNewAds');
    try {
      return super.addNewAds(newAds);
    } finally {
      _$_HomeStoreControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
error: ${error},
loading: ${loading},
search: ${search},
category: ${category},
filter: ${filter},
page: ${page},
lastPage: ${lastPage},
itemCount: ${itemCount},
showProgress: ${showProgress}
    ''';
  }
}
