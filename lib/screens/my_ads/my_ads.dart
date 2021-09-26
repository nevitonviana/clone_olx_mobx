import 'package:flutter/material.dart';

class MyAdsScreen extends StatefulWidget {
  const MyAdsScreen({Key? key}) : super(key: key);

  @override
  State<MyAdsScreen> createState() => _MyAdsScreenState();
}

class _MyAdsScreenState extends State<MyAdsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

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
