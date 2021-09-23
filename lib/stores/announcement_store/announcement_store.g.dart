// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'announcement_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AnnouncementStoreController on _AnnouncementStoreControllerBase, Store {
  Computed<bool>? _$categoryValidComputed;

  @override
  bool get categoryValid =>
      (_$categoryValidComputed ??= Computed<bool>(() => super.categoryValid,
              name: '_AnnouncementStoreControllerBase.categoryValid'))
          .value;
  Computed<Address?>? _$addressComputed;

  @override
  Address? get address =>
      (_$addressComputed ??= Computed<Address?>(() => super.address,
              name: '_AnnouncementStoreControllerBase.address'))
          .value;
  Computed<bool>? _$titleValidComputed;

  @override
  bool get titleValid =>
      (_$titleValidComputed ??= Computed<bool>(() => super.titleValid,
              name: '_AnnouncementStoreControllerBase.titleValid'))
          .value;
  Computed<bool>? _$descriptionValidComputed;

  @override
  bool get descriptionValid => (_$descriptionValidComputed ??= Computed<bool>(
          () => super.descriptionValid,
          name: '_AnnouncementStoreControllerBase.descriptionValid'))
      .value;
  Computed<bool>? _$priceValidComputed;

  @override
  bool get priceValid =>
      (_$priceValidComputed ??= Computed<bool>(() => super.priceValid,
              name: '_AnnouncementStoreControllerBase.priceValid'))
          .value;
  Computed<bool>? _$imagesValidComputed;

  @override
  bool get imagesValid =>
      (_$imagesValidComputed ??= Computed<bool>(() => super.imagesValid,
              name: '_AnnouncementStoreControllerBase.imagesValid'))
          .value;
  Computed<bool>? _$formValidComputed;

  @override
  bool get formValid =>
      (_$formValidComputed ??= Computed<bool>(() => super.formValid,
              name: '_AnnouncementStoreControllerBase.formValid'))
          .value;
  Computed<dynamic>? _$sendPressedComputed;

  @override
  dynamic get sendPressed =>
      (_$sendPressedComputed ??= Computed<dynamic>(() => super.sendPressed,
              name: '_AnnouncementStoreControllerBase.sendPressed'))
          .value;

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

  final _$titleAtom = Atom(name: '_AnnouncementStoreControllerBase.title');

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  final _$descriptionAtom =
      Atom(name: '_AnnouncementStoreControllerBase.description');

  @override
  String get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  final _$priceTextAtom =
      Atom(name: '_AnnouncementStoreControllerBase.priceText');

  @override
  String get priceText {
    _$priceTextAtom.reportRead();
    return super.priceText;
  }

  @override
  set priceText(String value) {
    _$priceTextAtom.reportWrite(value, super.priceText, () {
      super.priceText = value;
    });
  }

  final _$showErrorsAtom =
      Atom(name: '_AnnouncementStoreControllerBase.showErrors');

  @override
  bool get showErrors {
    _$showErrorsAtom.reportRead();
    return super.showErrors;
  }

  @override
  set showErrors(bool value) {
    _$showErrorsAtom.reportWrite(value, super.showErrors, () {
      super.showErrors = value;
    });
  }

  final _$loadingAtom = Atom(name: '_AnnouncementStoreControllerBase.loading');

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

  final _$saveAnnouncementAtom =
      Atom(name: '_AnnouncementStoreControllerBase.saveAnnouncement');

  @override
  bool get saveAnnouncement {
    _$saveAnnouncementAtom.reportRead();
    return super.saveAnnouncement;
  }

  @override
  set saveAnnouncement(bool value) {
    _$saveAnnouncementAtom.reportWrite(value, super.saveAnnouncement, () {
      super.saveAnnouncement = value;
    });
  }

  final _$errorAtom = Atom(name: '_AnnouncementStoreControllerBase.error');

  @override
  String get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  final _$_sendAsyncAction =
      AsyncAction('_AnnouncementStoreControllerBase._send');

  @override
  Future<void> _send() {
    return _$_sendAsyncAction.run(() => super._send());
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
  void setTitle(String value) {
    final _$actionInfo = _$_AnnouncementStoreControllerBaseActionController
        .startAction(name: '_AnnouncementStoreControllerBase.setTitle');
    try {
      return super.setTitle(value);
    } finally {
      _$_AnnouncementStoreControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setDescription(String value) {
    final _$actionInfo = _$_AnnouncementStoreControllerBaseActionController
        .startAction(name: '_AnnouncementStoreControllerBase.setDescription');
    try {
      return super.setDescription(value);
    } finally {
      _$_AnnouncementStoreControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setPrice(String value) {
    final _$actionInfo = _$_AnnouncementStoreControllerBaseActionController
        .startAction(name: '_AnnouncementStoreControllerBase.setPrice');
    try {
      return super.setPrice(value);
    } finally {
      _$_AnnouncementStoreControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void invalidSendPressed() {
    final _$actionInfo =
        _$_AnnouncementStoreControllerBaseActionController.startAction(
            name: '_AnnouncementStoreControllerBase.invalidSendPressed');
    try {
      return super.invalidSendPressed();
    } finally {
      _$_AnnouncementStoreControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
category: ${category},
hidePhone: ${hidePhone},
title: ${title},
description: ${description},
priceText: ${priceText},
showErrors: ${showErrors},
loading: ${loading},
saveAnnouncement: ${saveAnnouncement},
error: ${error},
categoryValid: ${categoryValid},
address: ${address},
titleValid: ${titleValid},
descriptionValid: ${descriptionValid},
priceValid: ${priceValid},
imagesValid: ${imagesValid},
formValid: ${formValid},
sendPressed: ${sendPressed}
    ''';
  }
}
