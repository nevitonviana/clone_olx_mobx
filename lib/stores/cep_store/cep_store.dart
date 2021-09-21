import 'package:mobx/mobx.dart';

import '/models/address/address.dart';
import '/repositories/cep_repository/cep_repository.dart';

part 'cep_store.g.dart';

class CepStoreController = _CepStoreControllerBase with _$CepStoreController;

abstract class _CepStoreControllerBase with Store {
  _CepStoreControllerBase() {
    autorun((_) {
      if (clearCep.length == 8) {
        _searchCep();
      } else {
        _reset();
      }
    });
  }

  @observable
  String cep = "";

  @action
  void setCep(String value) => cep = value;

  @computed
  String get clearCep => cep.replaceAll(RegExp('[^0-9]'), '');

  @observable
  Address? address;

  @observable
  String? error;

  @observable
  bool loading = false;

  @action
  Future<void> _searchCep() async {
    loading = true;
    try {
      address = await CepRepository().getAddressFrommAPI(clearCep);
      error = null;
    } catch (e) {
      error = e.toString();
      address = null;
    }
    loading = false;
  }

  @action
  void _reset() {
    address = null;
    error = null;
  }
}
