import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '/stores/page_store/page_store.dart';
import '../account/account_screen.dart';
import '../announcement/announcement_screen.dart';
import '../favorite/favorite_screen.dart';
import '../home/home_screen.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({Key? key}) : super(key: key);

  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  final PageController _pageController = PageController();
  final PageStoreController _pageStoreController =
      GetIt.I<PageStoreController>();

  @override
  void initState() {
    super.initState();
    reaction((_) => _pageStoreController.page,
        (page) => _pageController.jumpToPage(page.hashCode));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          HomeScreen(),
          AnnouncementScreen(),
          Container(color: Colors.yellowAccent),
          FavoriteScreen(),
          AccountScreen(),
        ],
      ),
    );
  }
}
