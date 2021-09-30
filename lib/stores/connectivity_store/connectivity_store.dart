import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mobx/mobx.dart';

part 'connectivity_store.g.dart';

class ConnectivityStoreController = _ConnectivityStoreControllerBase
    with _$ConnectivityStoreController;

abstract class _ConnectivityStoreControllerBase with Store {
  _ConnectivityStoreControllerBase() {
    _setupListener();
  }

  void _setupListener() async {
    final bool isConnected = await InternetConnectionChecker().hasConnection;

    setConnected(isConnected);
  }

  @observable
  bool connected = true;

  @action
  void setConnected(bool value) => connected = value;
}
