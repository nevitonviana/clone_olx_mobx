// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FilterStoreController on _FilterStoreControllerBase, Store {
  Computed<String?>? _$priceErrorComputed;

  @override
  String? get priceError =>
      (_$priceErrorComputed ??= Computed<String?>(() => super.priceError,
              name: '_FilterStoreControllerBase.priceError'))
          .value;

  final _$orderByAtom = Atom(name: '_FilterStoreControllerBase.orderBy');

  @override
  OrderBy get orderBy {
    _$orderByAtom.reportRead();
    return super.orderBy;
  }

  @override
  set orderBy(OrderBy value) {
    _$orderByAtom.reportWrite(value, super.orderBy, () {
      super.orderBy = value;
    });
  }

  final _$minPriceAtom = Atom(name: '_FilterStoreControllerBase.minPrice');

  @override
  String? get minPrice {
    _$minPriceAtom.reportRead();
    return super.minPrice;
  }

  @override
  set minPrice(String? value) {
    _$minPriceAtom.reportWrite(value, super.minPrice, () {
      super.minPrice = value;
    });
  }

  final _$maxPriceAtom = Atom(name: '_FilterStoreControllerBase.maxPrice');

  @override
  String? get maxPrice {
    _$maxPriceAtom.reportRead();
    return super.maxPrice;
  }

  @override
  set maxPrice(String? value) {
    _$maxPriceAtom.reportWrite(value, super.maxPrice, () {
      super.maxPrice = value;
    });
  }

  final _$_FilterStoreControllerBaseActionController =
      ActionController(name: '_FilterStoreControllerBase');

  @override
  void setOrderBy(OrderBy value) {
    final _$actionInfo = _$_FilterStoreControllerBaseActionController
        .startAction(name: '_FilterStoreControllerBase.setOrderBy');
    try {
      return super.setOrderBy(value);
    } finally {
      _$_FilterStoreControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMinPrice(String value) {
    final _$actionInfo = _$_FilterStoreControllerBaseActionController
        .startAction(name: '_FilterStoreControllerBase.setMinPrice');
    try {
      return super.setMinPrice(value);
    } finally {
      _$_FilterStoreControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMaxPrice(String value) {
    final _$actionInfo = _$_FilterStoreControllerBaseActionController
        .startAction(name: '_FilterStoreControllerBase.setMaxPrice');
    try {
      return super.setMaxPrice(value);
    } finally {
      _$_FilterStoreControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
orderBy: ${orderBy},
minPrice: ${minPrice},
maxPrice: ${maxPrice},
priceError: ${priceError}
    ''';
  }
}
