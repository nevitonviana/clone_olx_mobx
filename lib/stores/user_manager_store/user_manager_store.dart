import 'package:mobx/mobx.dart';

import '/models/user/user.dart';
import '/repositories/user_repositories/user_repository.dart';

part 'user_manager_store.g.dart';

class UserManagerStoreController = _UserManagerStoreControllerBase
    with _$UserManagerStoreController;

abstract class _UserManagerStoreControllerBase with Store {
  _UserManagerStoreControllerBase() {
    _getCurrentUSer();
  }

  @observable
  User? user;

  @action
  void setUser(User? value) => user = value;

  @computed
  bool get isLoggedIn => user != null;

  Future<void> _getCurrentUSer() async {
    final user = await UserSignUpRepositories().currentUser();
    setUser(user!);
  }

  Future<void> logout() async {
    UserSignUpRepositories().logout();
    setUser(null);
  }
}
