import 'package:mobx/mobx.dart';
import '/models/user/user.dart';

part 'user_manager_store.g.dart';


class UserManagerStoreController = _UserManagerStoreControllerBase
    with _$UserManagerStoreController;

abstract class _UserManagerStoreControllerBase with Store {

  @observable
  User? user;

  @action
  void setUser(User value) => user = value;

  @computed
  bool get isLoggedIn => user != null;

}