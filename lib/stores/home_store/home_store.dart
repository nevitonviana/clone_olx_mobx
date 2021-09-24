import 'package:mobx/mobx.dart';

import '/models/category/category.dart';
import '/stores/filter_store/filter_store.dart';

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

  FilterStoreController get cloneFilter => filter.clone();

  @observable
  FilterStoreController filter = FilterStoreController();

  @action
  void setFilter(FilterStoreController value) => filter = value;
}
