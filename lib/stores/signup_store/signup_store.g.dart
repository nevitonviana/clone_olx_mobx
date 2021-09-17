// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SignupStoreController on _SignupStoreControllerBase, Store {
  Computed<bool>? _$nameValidComputed;

  @override
  bool get nameValid =>
      (_$nameValidComputed ??= Computed<bool>(() => super.nameValid,
              name: '_SignupStoreControllerBase.nameValid'))
          .value;
  Computed<bool>? _$emailValidComputed;

  @override
  bool get emailValid =>
      (_$emailValidComputed ??= Computed<bool>(() => super.emailValid,
              name: '_SignupStoreControllerBase.emailValid'))
          .value;
  Computed<bool>? _$phoneValidComputed;

  @override
  bool get phoneValid =>
      (_$phoneValidComputed ??= Computed<bool>(() => super.phoneValid,
              name: '_SignupStoreControllerBase.phoneValid'))
          .value;
  Computed<bool>? _$passwordValid1Computed;

  @override
  bool get passwordValid1 =>
      (_$passwordValid1Computed ??= Computed<bool>(() => super.passwordValid1,
              name: '_SignupStoreControllerBase.passwordValid1'))
          .value;
  Computed<bool>? _$passWordValid2Computed;

  @override
  bool get passWordValid2 =>
      (_$passWordValid2Computed ??= Computed<bool>(() => super.passWordValid2,
              name: '_SignupStoreControllerBase.passWordValid2'))
          .value;
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_SignupStoreControllerBase.isFormValid'))
          .value;
  Computed<dynamic>? _$signupPressedComputed;

  @override
  dynamic get signupPressed =>
      (_$signupPressedComputed ??= Computed<dynamic>(() => super.signupPressed,
              name: '_SignupStoreControllerBase.signupPressed'))
          .value;

  final _$nameAtom = Atom(name: '_SignupStoreControllerBase.name');

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

  final _$emailAtom = Atom(name: '_SignupStoreControllerBase.email');

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

  final _$phoneAtom = Atom(name: '_SignupStoreControllerBase.phone');

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

  final _$password1Atom = Atom(name: '_SignupStoreControllerBase.password1');

  @override
  String? get password1 {
    _$password1Atom.reportRead();
    return super.password1;
  }

  @override
  set password1(String? value) {
    _$password1Atom.reportWrite(value, super.password1, () {
      super.password1 = value;
    });
  }

  final _$password2Atom = Atom(name: '_SignupStoreControllerBase.password2');

  @override
  String? get password2 {
    _$password2Atom.reportRead();
    return super.password2;
  }

  @override
  set password2(String? value) {
    _$password2Atom.reportWrite(value, super.password2, () {
      super.password2 = value;
    });
  }

  final _$loadingAtom = Atom(name: '_SignupStoreControllerBase.loading');

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

  final _$_signupAsyncAction =
      AsyncAction('_SignupStoreControllerBase._signup');

  @override
  Future<void> _signup() {
    return _$_signupAsyncAction.run(() => super._signup());
  }

  final _$_SignupStoreControllerBaseActionController =
      ActionController(name: '_SignupStoreControllerBase');

  @override
  void setName(String value) {
    final _$actionInfo = _$_SignupStoreControllerBaseActionController
        .startAction(name: '_SignupStoreControllerBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$_SignupStoreControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_SignupStoreControllerBaseActionController
        .startAction(name: '_SignupStoreControllerBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_SignupStoreControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPhone(String value) {
    final _$actionInfo = _$_SignupStoreControllerBaseActionController
        .startAction(name: '_SignupStoreControllerBase.setPhone');
    try {
      return super.setPhone(value);
    } finally {
      _$_SignupStoreControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassWord1(String value) {
    final _$actionInfo = _$_SignupStoreControllerBaseActionController
        .startAction(name: '_SignupStoreControllerBase.setPassWord1');
    try {
      return super.setPassWord1(value);
    } finally {
      _$_SignupStoreControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassWord2(String value) {
    final _$actionInfo = _$_SignupStoreControllerBaseActionController
        .startAction(name: '_SignupStoreControllerBase.setPassWord2');
    try {
      return super.setPassWord2(value);
    } finally {
      _$_SignupStoreControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$_SignupStoreControllerBaseActionController
        .startAction(name: '_SignupStoreControllerBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_SignupStoreControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
email: ${email},
phone: ${phone},
password1: ${password1},
password2: ${password2},
loading: ${loading},
nameValid: ${nameValid},
emailValid: ${emailValid},
phoneValid: ${phoneValid},
passwordValid1: ${passwordValid1},
passWordValid2: ${passWordValid2},
isFormValid: ${isFormValid},
signupPressed: ${signupPressed}
    ''';
  }
}
