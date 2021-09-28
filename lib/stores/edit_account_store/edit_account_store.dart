import 'package:mobx/mobx.dart';
import 'package:olx_clone/models/user/user.dart';

part 'edit_account_store.g.dart';

class EditAccountStoreController = _EditAccountStoreControllerBase
    with _$EditAccountStoreController;

abstract class _EditAccountStoreControllerBase with Store {
  @observable
  UserType? userType;

  @action
  void setUserType(int value) => userType = UserType.values[value];

  @observable
  String? name;

  @action
  void setName(String value) => name = value;

  @computed
  bool get nameValid => name != null && name!.length >= 4;

  String? get nameError =>
      nameValid || name == null ? null : "campo Obrigatorio";

  @observable
  String? phone;

  @action
  void setPhone(String value) => phone = value;

  @computed
  bool get phoneValid => phone != null && phone!.length >= 14;

  String? get phoneError =>
      phoneValid || phone == null ? null : "campo Obrigatorio";

  @observable
  String password1 = '';

  @action
  void setPassword1(String value) => password1 = value;

  @observable
  String password2 = '';

  @action
  void setPassword2(String value) => password2 = value;

  @computed
  bool get passwordValid =>
      password1 == password2 && (password1.length >= 5 || password1.isEmpty);

  String? get passwordError {
    if (password1.isNotEmpty && password1.length < 6)
      return "senha muito curta";
    else if (password1 != password2) return "Senha nao coincidem";
    return null;
  }

  @computed
  bool get isFormValid => nameValid && passwordValid && phoneValid;
}
