import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';

import '/screens/base/base_screen.dart';
import '/stores/home_store/home_store.dart';
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
  GetIt.I.registerSingleton(HomeStoreController());
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
      home: BaseScreen(),
      supportedLocales: const [
        Locale('pt', 'BR'),
      ],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
    );
  }
}
