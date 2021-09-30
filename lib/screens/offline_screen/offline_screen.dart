import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '/stores/connectivity_store/connectivity_store.dart';

class OfflineScreen extends StatefulWidget {
  const OfflineScreen({Key? key}) : super(key: key);

  @override
  State<OfflineScreen> createState() => _OfflineScreenState();
}

class _OfflineScreenState extends State<OfflineScreen> {
  final ConnectivityStoreController _connectivityStoreController =
      GetIt.I<ConnectivityStoreController>();

  @override
  void initState() {
    super.initState();
    when((_) => _connectivityStoreController.connected, () {
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        appBar: AppBar(
          title: Text("OLX"),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Center(
                child: Text(
                  "Sem conexão com a internet",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            Icon(
              Icons.cloud_off_outlined,
              color: Colors.white,
              size: 150,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Por favor, verifique a sua conexão com a internet paracontinuar a usar o app.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
