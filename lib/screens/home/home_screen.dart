import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '/components/empty_card/empty_card.dart';
import '/components/custom_drawer/custom_drawer.dart';
import '/stores/home_store/home_store.dart';
import 'components/ad_tile.dart';
import 'components/createAd_button.dart';
import 'components/search_dialog.dart';
import 'components/top_bar.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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

  final ScrollController scrollController = ScrollController();

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
      body: Column(
        children: [
          TopBar(),
          Expanded(
            child: Stack(
              children: [
                Observer(
                  builder: (context) {
                    if (_homeStoreController.error != null) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Icon(
                              Icons.error,
                              color: Colors.white,
                              size: 100,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              "Ocorreu um error",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                    if (_homeStoreController.showProgress) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      );
                    }
                    if (_homeStoreController.adList.isEmpty) {
                      return EmptyCard(text: "nenhum anuncio encontrado ");
                    }
                    return ListView.builder(
                      controller: scrollController,
                      itemCount: _homeStoreController.itemCount,
                      itemBuilder: (context, index) {
                        if (index < _homeStoreController.adList.length)
                          return AdTile(
                            announcementStoreController:
                                _homeStoreController.adList[index],
                          );
                        return Container(
                          height: 10,
                          child: LinearProgressIndicator(
                            color: Colors.white,
                          ),
                        );
                      },
                    );
                  },
                ),
                Positioned(
                  bottom: -50,
                  left: 0,
                  right: 0,
                  child: CreateAdButton(
                    scrollController: scrollController,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
