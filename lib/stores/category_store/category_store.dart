import 'package:mobx/mobx.dart';
import 'package:olx_clone/models/category/category.dart';
import 'package:olx_clone/repositories/category_repository/category_repository.dart';

part 'category_store.g.dart';

class CategoryStoreController = _CategoryStoreControllerBase
    with _$CategoryStoreController;

abstract class _CategoryStoreControllerBase with Store {
  _CategoryStoreControllerBase() {
    _loadCategories();
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
      setCategories(categories);
    } catch (e) {
      setError(e.toString());
    }
  }

  @computed
  List<Category> get allCategoryList => List.from(categoryList)
    ..insert(0, Category(id: '*', description: 'todas'));
}
