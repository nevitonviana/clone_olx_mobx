import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '/components/empty_card/empty_card.dart';
import '/stores/myads_Store/myads_Store.dart';
import 'components/active_tile.dart';
import 'components/pending_tile.dart';
import 'components/sold_tile.dart';

class MyAdsScreen extends StatefulWidget {
  final int initialPage;

  const MyAdsScreen({Key? key, this.initialPage = 0}) : super(key: key);

  @override
  State<MyAdsScreen> createState() => _MyAdsScreenState();
}

class _MyAdsScreenState extends State<MyAdsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final MyAdsStoreController _myAdsStoreController = MyAdsStoreController();

  @override
  void initState() {
    _tabController =
        TabController(length: 3, vsync: this, initialIndex: widget.initialPage);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "meus Anuncios",
        ),
        centerTitle: true,
        bottom: TabBar(
          indicatorColor: Colors.orangeAccent,
          controller: _tabController,
          tabs: [
            Tab(child: Text("ATIVOS")),
            Tab(child: Text("PANDENTES")),
            Tab(child: Text("VENDIOS")),
          ],
        ),
      ),
      body: Observer(builder: (context) {
        if (_myAdsStoreController.loading)
          return Center(
            child: CircularProgressIndicator(),
          );
        else
          return TabBarView(
            controller: _tabController,
            children: [
              Observer(builder: (_) {
                if (_myAdsStoreController.activeAds.isEmpty)
                  return EmptyCard(text: "Você não possui num anuncio ativo");
                return ListView.builder(
                  itemCount: _myAdsStoreController.activeAds.length,
                  itemBuilder: (_, index) => ActiveTile(
                    modelAnnouncement: _myAdsStoreController.allAds![index],
                    myAdsStoreController: _myAdsStoreController,
                  ),
                );
              }),
              Observer(builder: (_) {
                if (_myAdsStoreController.pendingAds.isEmpty)
                  return EmptyCard(
                      text: "Você não possui num anuncio pendente");
                return ListView.builder(
                  itemCount: _myAdsStoreController.pendingAds.length,
                  itemBuilder: (_, index) => PendingTile(
                    modelAnnouncement: _myAdsStoreController.allAds![index],
                  ),
                );
              }),
              Observer(builder: (_) {
                if (_myAdsStoreController.soldAds.isEmpty)
                  return EmptyCard(text: "Você não possui num anuncio Vendio");
                return ListView.builder(
                  itemCount: _myAdsStoreController.soldAds.length,
                  itemBuilder: (_, index) => SoldTile(
                    modelAnnouncement: _myAdsStoreController.allAds![index],
                    myAdsStoreController: _myAdsStoreController,
                  ),
                );
              }),
            ],
          );
      }),
    );
  }
}
