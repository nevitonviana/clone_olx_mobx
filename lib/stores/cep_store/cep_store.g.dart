// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cep_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CepStoreController on _CepStoreControllerBase, Store {
  Computed<String>? _$clearCepComputed;

  @override
  String get clearCep =>
      (_$clearCepComputed ??= Computed<String>(() => super.clearCep,
              name: '_CepStoreControllerBase.clearCep'))
          .value;

  final _$cepAtom = Atom(name: '_CepStoreControllerBase.cep');

  @override
  String get cep {
    _$cepAtom.reportRead();
    return super.cep;
  }

  @override
  set cep(String value) {
    _$cepAtom.reportWrite(value, super.cep, () {
      super.cep = value;
    });
  }

  final _$addressAtom = Atom(name: '_CepStoreControllerBase.address');

  @override
  Address? get address {
    _$addressAtom.reportRead();
    return super.address;
  }

  @override
  set address(Address? value) {
    _$addressAtom.reportWrite(value, super.address, () {
      super.address = value;
    });
  }

  final _$errorAtom = Atom(name: '_CepStoreControllerBase.error');

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

  final _$loadingAtom = Atom(name: '_CepStoreControllerBase.loading');

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

  final _$_searchCepAsyncAction =
      AsyncAction('_CepStoreControllerBase._searchCep');

  @override
  Future<void> _searchCep() {
    return _$_searchCepAsyncAction.run(() => super._searchCep());
  }

  final _$_CepStoreControllerBaseActionController =
      ActionController(name: '_CepStoreControllerBase');

  @override
  void setCep(String value) {
    final _$actionInfo = _$_CepStoreControllerBaseActionController.startAction(
        name: '_CepStoreControllerBase.setCep');
    try {
      return super.setCep(value);
    } finally {
      _$_CepStoreControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _reset() {
    final _$actionInfo = _$_CepStoreControllerBaseActionController.startAction(
        name: '_CepStoreControllerBase._reset');
    try {
      return super._reset();
    } finally {
      _$_CepStoreControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cep: ${cep},
address: ${address},
error: ${error},
loading: ${loading},
clearCep: ${clearCep}
    ''';
  }
}
