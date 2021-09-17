import 'package:mobx/mobx.dart';

import '../../helpers/extensions.dart';

part 'signup_store.g.dart';

class SignupStoreController = _SignupStoreControllerBase
    with _$SignupStoreController;

abstract class _SignupStoreControllerBase with Store {
  @observable
  String? name;

  @action
  void setName(String value) => name = value;

  @computed
  bool get nameValid => name != null && name!.length > 6;

  String? get nameError {
    if (name == null || nameValid) {
      return null;
    } else if (name!.isEmpty) {
      return "Campo Obrigatorio";
    } else {
      return "name muito curto";
    }
  }

  @observable
  String? email;

  @action
  void setEmail(String value) => email = value;

  @computed
  bool get emailValid => email != null && email!.isEmailValid();

  String? get emailError {
    if (email == null || emailValid)
      return null;
    else if (email!.isEmpty) return "compo Obrigatorio";
  }

  @observable
  String? phone;

  @action
  void setPhone(String value) => phone = value;

  @computed
  bool get phoneValid => phone != null && phone!.length >= 14;

  String? get phoneError {
    if (phone == null || phoneValid)
      return null;
    else if (phone!.isEmpty) return "Celular invalido";
  }

  @observable
  String? password1;

  @action
  void setPassWord1(String value) => password1 = value;

  @computed
  bool get passwordValid1 => password1 != null && password1!.length >= 6;

  String? get passWordError1 {
    if (password1 == null || passwordValid1)
      return null;
    else if (password1!.isEmpty)
      return "Compo Obrigatorio";
    else
      return "Senha muito curta";
  }

  @observable
  String? password2;

  @action
  void setPassWord2(String value) => password2 = value;

  @computed
  bool get passWordValid2 => password2 != null && password1 == password2;

  String? get passwordError2 {
    if (password2 == null || passWordValid2)
      return null;
    else
      return "Senha não coincidem";
  }

  @computed
  bool get isFormValid =>
      nameValid && emailValid && phoneValid && passWordValid2 && passwordValid1;

  @computed
  dynamic get signupPressed => (isFormValid && !loading) ? _signup : null;

  @observable
  bool loading = false;

  @action
  void setLoading(bool value) => loading = value;

  @action
  Future<void> _signup() async {
    loading = true;
    await Future.delayed(Duration(seconds: 3));
    loading = false;
  }
}
