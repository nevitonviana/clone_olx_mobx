import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '/stores/user_manager_store/user_manager_store.dart';
import '/repositories/user_repositories/user_repository.dart';
import '../../helpers/extensions.dart';

part 'login_store.g.dart';

class LoginStoreController = _LoginStoreControllerBase
    with _$LoginStoreController;

abstract class _LoginStoreControllerBase with Store {
  @observable
  String? email;

  @action
  void setEmail(String value) => email = value;

  @computed
  bool get emailValid => email != null && email!.isEmailValid();

  String? get emailError =>
      email == null || emailValid ? null : "E-mail invalid";

  @observable
  String? password;

  @action
  void setPassWord(String value) => password = value;

  @computed
  bool get passwordValid => password != null && password!.length >= 6;

  String? get passwordError =>
      password == null || passwordValid ? null : "Senha Invalida";

  @observable
  bool loading = false;

  @observable
  String? error;

  @computed
  dynamic get loginPressed =>
      (emailValid && passwordValid && !loading) ? _login : null;

  Future<void> _login() async {
    loading = true;
    try {
      final user = await UserSignUpRepositories()
          .loginWithToUser(email: email!, password: password!);
      GetIt.I<UserManagerStoreController>().setUser(user);
    } catch (e) {
      error = e.toString();
    }
    loading = false;
  }
}
