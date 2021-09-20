import 'package:mobx/mobx.dart';

part 'announcement_store.g.dart';

class AnnouncementStoreController = _AnnouncementStoreControllerBase
    with _$AnnouncementStoreController;

abstract class _AnnouncementStoreControllerBase with Store {
  ObservableList images = ObservableList();
}
