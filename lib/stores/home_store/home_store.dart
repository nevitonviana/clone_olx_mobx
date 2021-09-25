import 'package:mobx/mobx.dart';

import '/models/category/category.dart';
import '/models/model_announcement/model_announcement.dart';
import '/repositories/announcement_repository/announcement_repository.dart';
import '/stores/filter_store/filter_store.dart';

part 'home_store.g.dart';

class HomeStoreController = _HomeStoreControllerBase with _$HomeStoreController;

abstract class _HomeStoreControllerBase with Store {
  _HomeStoreControllerBase() {
    autorun((_) async {
      try {
        setLoading(true);
        final newAnnouncement = await AnnouncementRepository().getHomeAdList(
          category: category,
          filter: filter,
          search: search,
        );
        adList.clear();
        adList.add(newAnnouncement);
        setLoading(false);
      } catch (e) {
        setError(e.toString());
      }
    });
  }

  ObservableList adList = ObservableList<ModelAnnouncement>();

  @observable
  String? error;

  @action
  void setError(String value) => error = value;
  @observable
  bool loading = false;

  @action
  void setLoading(bool value) => loading = value;

  @computed
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
