import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStoreController = _HomeStoreControllerBase with _$HomeStoreController;

abstract class _HomeStoreControllerBase with Store {
  @observable
  String search = '';

  @action
  void setSearch(String value) => search = value;
}
