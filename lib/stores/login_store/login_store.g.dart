// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginStoreController on _LoginStoreControllerBase, Store {
  Computed<bool>? _$emailValidComputed;

  @override
  bool get emailValid =>
      (_$emailValidComputed ??= Computed<bool>(() => super.emailValid,
              name: '_LoginStoreControllerBase.emailValid'))
          .value;
  Computed<bool>? _$passwordValidComputed;

  @override
  bool get passwordValid =>
      (_$passwordValidComputed ??= Computed<bool>(() => super.passwordValid,
              name: '_LoginStoreControllerBase.passwordValid'))
          .value;
  Computed<dynamic>? _$loginPressedComputed;

  @override
  dynamic get loginPressed =>
      (_$loginPressedComputed ??= Computed<dynamic>(() => super.loginPressed,
              name: '_LoginStoreControllerBase.loginPressed'))
          .value;

  final _$emailAtom = Atom(name: '_LoginStoreControllerBase.email');

  @override
  String? get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String? value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$passwordAtom = Atom(name: '_LoginStoreControllerBase.password');

  @override
  String? get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String? value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$loadingAtom = Atom(name: '_LoginStoreControllerBase.loading');

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

  final _$_LoginStoreControllerBaseActionController =
      ActionController(name: '_LoginStoreControllerBase');

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_LoginStoreControllerBaseActionController
        .startAction(name: '_LoginStoreControllerBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_LoginStoreControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassWord(String value) {
    final _$actionInfo = _$_LoginStoreControllerBaseActionController
        .startAction(name: '_LoginStoreControllerBase.setPassWord');
    try {
      return super.setPassWord(value);
    } finally {
      _$_LoginStoreControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
password: ${password},
loading: ${loading},
emailValid: ${emailValid},
passwordValid: ${passwordValid},
loginPressed: ${loginPressed}
    ''';
  }
}
