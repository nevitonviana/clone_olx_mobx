import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import 'screens/base/base_screen.dart';
import 'stores/page_store/page_store.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeParse();
  setupLocators();
  runApp(MyApp());
}

void setupLocators() {
  GetIt.I.registerSingleton(PageStoreController());
}

Future<void> initializeParse() async {
  await Parse().initialize(
    "JGDuC8xZFjChAX1OObHXYjNDXZ1llaoIqcU7ACT5",
    "https://parseapi.back4app.com/",
    clientKey: "sh6XbjF0hopF8nCPOy3fMleFQyV2kkuts1wpABOa",
    autoSendSessionId: true,
    debug: true,
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OLX Clone',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        scaffoldBackgroundColor: Colors.purple,
        appBarTheme: AppBarTheme(
          elevation: 0,
        ),
        primaryColor: Colors.purple,
      ),
      home: BaseScreen(),
    );
  }
}
