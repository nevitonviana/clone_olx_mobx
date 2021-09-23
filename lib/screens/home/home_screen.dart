import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:olx_clone/stores/home_store/home_store.dart';

import '/components/custom_drawer/custom_drawer.dart';
import 'components/search_dialog.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  _openSearch({required BuildContext context}) async {
    final search = await showDialog(
      context: context,
      builder: (_) => SearchDialog(
        currentSearch: _homeStoreController.search,
      ),
    );
    if (search != null) {
      _homeStoreController.setSearch(search);
    }
  }

  final HomeStoreController _homeStoreController =
      GetIt.I<HomeStoreController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Observer(
          builder: (_) {
            if (_homeStoreController.search.isEmpty) return Text('');
            return GestureDetector(
              onTap: () => _openSearch(
                context: _openSearch(context: context),
              ),
              child: LayoutBuilder(
                builder: (_, constraints) {
                  return Container(
                    width: constraints.biggest.width,
                    child: Text(_homeStoreController.search),
                  );
                },
              ),
            );
          },
        ),
        actions: [
          Observer(builder: (context) {
            if (_homeStoreController.search.isEmpty)
              return IconButton(
                onPressed: () {
                  _openSearch(context: context);
                },
                icon: Icon(
                  Icons.search_sharp,
                ),
              );
            return IconButton(
              onPressed: () {
                _homeStoreController.setSearch("");
              },
              icon: Icon(
                Icons.clear,
              ),
            );
          }),
        ],
      ),
    );
  }
}
