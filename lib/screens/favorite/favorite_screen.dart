import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '/components/custom_drawer/custom_drawer.dart';
import '/components/empty_card/empty_card.dart';
import '/stores/favorite_store/favorite_store.dart';
import 'components/favorite_tile.dart';

class FavoriteScreen extends StatelessWidget {
  final bool hideDrawer;

  const FavoriteScreen({Key? key, this.hideDrawer = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FavoriteStoreController favoriteStoreController =
        GetIt.I<FavoriteStoreController>();
    return Scaffold(
      drawer: hideDrawer ? null : CustomDrawer(),
      appBar: AppBar(
        title: Text("Favorito"),
        centerTitle: true,
      ),
      body: Observer(
        builder: (_) {
          if (favoriteStoreController.favoriteList.isEmpty)
            return EmptyCard(text: "Nenhum anuncio favoriado");
          return ListView.builder(
            padding: const EdgeInsets.all(2),
            itemCount: favoriteStoreController.favoriteList.length,
            itemBuilder: (_, index) => FavoriteTile(
              favoriteStoreController: favoriteStoreController,
            ),
          );
        },
      ),
    );
  }
}
