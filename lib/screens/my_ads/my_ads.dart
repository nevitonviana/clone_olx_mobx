import 'package:flutter/material.dart';
import 'package:olx_clone/stores/myads_Store/myads_Store.dart';

class MyAdsScreen extends StatefulWidget {
  const MyAdsScreen({Key? key}) : super(key: key);

  @override
  State<MyAdsScreen> createState() => _MyAdsScreenState();
}

class _MyAdsScreenState extends State<MyAdsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final MyAdsStoreController _myAdsStoreController = MyAdsStoreController();

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
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
      body: TabBarView(
        controller: _tabController,
        children: [
          Container(
            color: Colors.orangeAccent,
          ),
          Container(
            color: Colors.orangeAccent,
          ),
          Container(
            color: Colors.orangeAccent,
          ),
        ],
      ),
    );
  }
}
