// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_manager_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserManagerStoreController on _UserManagerStoreControllerBase, Store {
  Computed<bool>? _$isLoggedInComputed;

  @override
  bool get isLoggedIn =>
      (_$isLoggedInComputed ??= Computed<bool>(() => super.isLoggedIn,
              name: '_UserManagerStoreControllerBase.isLoggedIn'))
          .value;

  final _$userAtom = Atom(name: '_UserManagerStoreControllerBase.user');

  @override
  User? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(User? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$_UserManagerStoreControllerBaseActionController =
      ActionController(name: '_UserManagerStoreControllerBase');

  @override
  void setUser(User value) {
    final _$actionInfo = _$_UserManagerStoreControllerBaseActionController
        .startAction(name: '_UserManagerStoreControllerBase.setUser');
    try {
      return super.setUser(value);
    } finally {
      _$_UserManagerStoreControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user},
isLoggedIn: ${isLoggedIn}
    ''';
  }
}
