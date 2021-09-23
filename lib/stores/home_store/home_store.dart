import 'package:mobx/mobx.dart';
import 'package:olx_clone/models/category/category.dart';

part 'home_store.g.dart';

class HomeStoreController = _HomeStoreControllerBase with _$HomeStoreController;

abstract class _HomeStoreControllerBase with Store {
  @observable
  String search = '';

  @action
  void setSearch(String value) => search = value;

  @observable
  Category? category;

  @action
  void setCategory(Category value) => category = value;
}
