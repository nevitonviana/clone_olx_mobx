import 'package:mobx/mobx.dart';
import 'package:olx_clone/models/category/category.dart';

part 'announcement_store.g.dart';

class AnnouncementStoreController = _AnnouncementStoreControllerBase
    with _$AnnouncementStoreController;

abstract class _AnnouncementStoreControllerBase with Store {
  ObservableList images = ObservableList();

  @observable
  Category? category;

  @action
  void setCategory(Category value) => category = value;
}
