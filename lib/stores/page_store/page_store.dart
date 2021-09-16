import 'package:mobx/mobx.dart';

part 'page_store.g.dart';

class PageStoreController = _PageStoreControllerBase with _$PageStoreController;

abstract class _PageStoreControllerBase with Store {
  @observable
  int page = 0;

  @action
  void setPage(int value) => page = value;
}
