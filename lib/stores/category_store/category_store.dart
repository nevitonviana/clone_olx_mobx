import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '/models/category/category.dart';
import '/repositories/category_repository/category_repository.dart';
import '../connectivity_store/connectivity_store.dart';

part 'category_store.g.dart';

class CategoryStoreController = _CategoryStoreControllerBase
    with _$CategoryStoreController;

abstract class _CategoryStoreControllerBase with Store {
  final ConnectivityStoreController _connectivityStoreController =
      GetIt.I<ConnectivityStoreController>();

  _CategoryStoreControllerBase() {
    autorun((_) {
      if (_connectivityStoreController.connected && categoryList.isEmpty) {
        _loadCategories();
      }
    });
  }

  ObservableList<Category> categoryList = ObservableList<Category>();

  @action
  void setCategories(List<Category> categories) {
    categoryList.clear();
    categoryList.addAll(categories);
  }

  @observable
  String? error;

  @action
  void setError(String value) => error = value;

  Future<void> _loadCategories() async {
    try {
      final categories = await CategoryRepository().getList();
      setCategories(categories!);
    } catch (e) {
      setError(e.toString());
    }
  }

  @computed
  List<Category> get allCategoryList => List.from(categoryList)
    ..insert(0, Category(id: '*', description: 'todas'));
}
