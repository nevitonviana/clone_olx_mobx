import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '/models/user/user.dart';
import '/repositories/user_repositories/user_repository.dart';
import '/stores/user_manager_store/user_manager_store.dart';

part 'edit_account_store.g.dart';

class EditAccountStoreController = _EditAccountStoreControllerBase
    with _$EditAccountStoreController;

abstract class _EditAccountStoreControllerBase with Store {
  final UserManagerStoreController userManagerStoreController =
      GetIt.I<UserManagerStoreController>();

  _EditAccountStoreControllerBase() {
    user = userManagerStoreController.user;
    userType = user?.type;
    name = user?.name;
    phone = user?.phone;
  }

  User? user;

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

  @computed
  dynamic get savaPressed => (isFormValid && !loading) ? _save : null;

  @observable
  bool loading = false;

  @action
  Future<void> _save() async {
    loading = true;
    user!.name = name;
    user!.phone = phone;
    user!.type = userType;

    if (password1.isNotEmpty)
      user!.password = password1;
    else
      user!.password = null;
    try {
      await UserSignUpRepositories().save(user!);
      userManagerStoreController.setUser(user!);
    } catch (e) {
      print(e);
    }
    loading = false;
  }

  void logout() => userManagerStoreController.logout();
}
