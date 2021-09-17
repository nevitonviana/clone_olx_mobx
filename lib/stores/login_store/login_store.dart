import 'package:mobx/mobx.dart';

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

  @computed
  dynamic get loginPressed =>
      (emailValid && passwordValid && !loading) ? _login : null;

  Future<void> _login() async {
    loading = true;
    await Future.delayed(Duration(seconds: 3));
    loading = false;
  }
}
