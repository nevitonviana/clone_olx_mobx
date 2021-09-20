import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:olx_clone/screens/category_screen/category_screen.dart';

import 'initializeParse.dart';
import 'stores/category_store/category_store.dart';
import 'stores/page_store/page_store.dart';
import 'stores/user_manager_store/user_manager_store.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await InitializeParse().initializeParse();
  setupLocators();
  runApp(MyApp());
}

void setupLocators() {
  GetIt.I.registerSingleton(PageStoreController());
  GetIt.I.registerSingleton(UserManagerStoreController());
  GetIt.I.registerSingleton(CategoryStoreController());
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
      home: CategoryScreen(),
    );
  }
}
