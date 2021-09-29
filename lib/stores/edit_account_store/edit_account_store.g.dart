// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_account_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EditAccountStoreController on _EditAccountStoreControllerBase, Store {
  Computed<bool>? _$nameValidComputed;

  @override
  bool get nameValid =>
      (_$nameValidComputed ??= Computed<bool>(() => super.nameValid,
              name: '_EditAccountStoreControllerBase.nameValid'))
          .value;
  Computed<bool>? _$phoneValidComputed;

  @override
  bool get phoneValid =>
      (_$phoneValidComputed ??= Computed<bool>(() => super.phoneValid,
              name: '_EditAccountStoreControllerBase.phoneValid'))
          .value;
  Computed<bool>? _$passwordValidComputed;

  @override
  bool get passwordValid =>
      (_$passwordValidComputed ??= Computed<bool>(() => super.passwordValid,
              name: '_EditAccountStoreControllerBase.passwordValid'))
          .value;
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_EditAccountStoreControllerBase.isFormValid'))
          .value;
  Computed<dynamic>? _$savaPressedComputed;

  @override
  dynamic get savaPressed =>
      (_$savaPressedComputed ??= Computed<dynamic>(() => super.savaPressed,
              name: '_EditAccountStoreControllerBase.savaPressed'))
          .value;

  final _$userTypeAtom = Atom(name: '_EditAccountStoreControllerBase.userType');

  @override
  UserType? get userType {
    _$userTypeAtom.reportRead();
    return super.userType;
  }

  @override
  set userType(UserType? value) {
    _$userTypeAtom.reportWrite(value, super.userType, () {
      super.userType = value;
    });
  }

  final _$nameAtom = Atom(name: '_EditAccountStoreControllerBase.name');

  @override
  String? get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String? value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$phoneAtom = Atom(name: '_EditAccountStoreControllerBase.phone');

  @override
  String? get phone {
    _$phoneAtom.reportRead();
    return super.phone;
  }

  @override
  set phone(String? value) {
    _$phoneAtom.reportWrite(value, super.phone, () {
      super.phone = value;
    });
  }

  final _$password1Atom =
      Atom(name: '_EditAccountStoreControllerBase.password1');

  @override
  String get password1 {
    _$password1Atom.reportRead();
    return super.password1;
  }

  @override
  set password1(String value) {
    _$password1Atom.reportWrite(value, super.password1, () {
      super.password1 = value;
    });
  }

  final _$password2Atom =
      Atom(name: '_EditAccountStoreControllerBase.password2');

  @override
  String get password2 {
    _$password2Atom.reportRead();
    return super.password2;
  }

  @override
  set password2(String value) {
    _$password2Atom.reportWrite(value, super.password2, () {
      super.password2 = value;
    });
  }

  final _$loadingAtom = Atom(name: '_EditAccountStoreControllerBase.loading');

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

  final _$_saveAsyncAction =
      AsyncAction('_EditAccountStoreControllerBase._save');

  @override
  Future<void> _save() {
    return _$_saveAsyncAction.run(() => super._save());
  }

  final _$_EditAccountStoreControllerBaseActionController =
      ActionController(name: '_EditAccountStoreControllerBase');

  @override
  void setUserType(int value) {
    final _$actionInfo = _$_EditAccountStoreControllerBaseActionController
        .startAction(name: '_EditAccountStoreControllerBase.setUserType');
    try {
      return super.setUserType(value);
    } finally {
      _$_EditAccountStoreControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setName(String value) {
    final _$actionInfo = _$_EditAccountStoreControllerBaseActionController
        .startAction(name: '_EditAccountStoreControllerBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$_EditAccountStoreControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPhone(String value) {
    final _$actionInfo = _$_EditAccountStoreControllerBaseActionController
        .startAction(name: '_EditAccountStoreControllerBase.setPhone');
    try {
      return super.setPhone(value);
    } finally {
      _$_EditAccountStoreControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword1(String value) {
    final _$actionInfo = _$_EditAccountStoreControllerBaseActionController
        .startAction(name: '_EditAccountStoreControllerBase.setPassword1');
    try {
      return super.setPassword1(value);
    } finally {
      _$_EditAccountStoreControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword2(String value) {
    final _$actionInfo = _$_EditAccountStoreControllerBaseActionController
        .startAction(name: '_EditAccountStoreControllerBase.setPassword2');
    try {
      return super.setPassword2(value);
    } finally {
      _$_EditAccountStoreControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userType: ${userType},
name: ${name},
phone: ${phone},
password1: ${password1},
password2: ${password2},
loading: ${loading},
nameValid: ${nameValid},
phoneValid: ${phoneValid},
passwordValid: ${passwordValid},
isFormValid: ${isFormValid},
savaPressed: ${savaPressed}
    ''';
  }
}
