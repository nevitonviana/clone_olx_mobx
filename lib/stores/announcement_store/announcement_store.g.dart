// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'announcement_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AnnouncementStoreController on _AnnouncementStoreControllerBase, Store {
  final _$categoryAtom =
      Atom(name: '_AnnouncementStoreControllerBase.category');

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

  final _$hidePhoneAtom =
      Atom(name: '_AnnouncementStoreControllerBase.hidePhone');

  @override
  bool get hidePhone {
    _$hidePhoneAtom.reportRead();
    return super.hidePhone;
  }

  @override
  set hidePhone(bool value) {
    _$hidePhoneAtom.reportWrite(value, super.hidePhone, () {
      super.hidePhone = value;
    });
  }

  final _$_AnnouncementStoreControllerBaseActionController =
      ActionController(name: '_AnnouncementStoreControllerBase');

  @override
  void setCategory(Category value) {
    final _$actionInfo = _$_AnnouncementStoreControllerBaseActionController
        .startAction(name: '_AnnouncementStoreControllerBase.setCategory');
    try {
      return super.setCategory(value);
    } finally {
      _$_AnnouncementStoreControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setHidePhone(bool value) {
    final _$actionInfo = _$_AnnouncementStoreControllerBaseActionController
        .startAction(name: '_AnnouncementStoreControllerBase.setHidePhone');
    try {
      return super.setHidePhone(value);
    } finally {
      _$_AnnouncementStoreControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
category: ${category},
hidePhone: ${hidePhone}
    ''';
  }
}
