import 'package:flutter/material.dart';

import '/components/custom_drawer/custom_drawer.dart';
import 'components/search_dialog.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  _openSearch({required BuildContext context}) async {
    final search = await showDialog(
      context: context,
      builder: (_) => SearchDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              _openSearch(context: context);
            },
            icon: Icon(
              Icons.search_sharp,
            ),
          ),
        ],
      ),
    );
  }
}
