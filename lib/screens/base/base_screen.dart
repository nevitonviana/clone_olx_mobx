import 'package:flutter/material.dart';
import 'package:olx_clone/screens/home/home_screen.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageController _pageController = PageController();
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          HomeScreen(),
          Container(color: Colors.blue),
          Container(color: Colors.yellowAccent),
          Container(color: Colors.purple),
          Container(color: Colors.grey),
        ],
      ),
    );
  }
}
