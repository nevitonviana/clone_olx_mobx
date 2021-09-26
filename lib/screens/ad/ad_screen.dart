import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';

import '/stores/announcement_store/announcement_store.dart';
import 'components/bottoms_bar.dart';
import 'components/description_panel.dart';
import 'components/location_panel.dart';
import 'components/main_panel.dart';
import 'components/user_panel.dart';

class AdScreen extends StatelessWidget {
  final AnnouncementStoreController announcementStoreController;

  const AdScreen({Key? key, required this.announcementStoreController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Anuncios"),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              Container(
                height: 280,
                child: CarouselSlider.builder(
                    slideBuilder: (index) {
                      return Container(
                        child: Image.network(
                          announcementStoreController.images[index],
                        ),
                      );
                    },
                    itemCount: announcementStoreController.images.length),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    MainPanel(
                        announcementStoreController:
                            announcementStoreController),
                    Divider(color: Colors.grey),
                    DescriptionPanel(
                        announcementStoreController:
                            announcementStoreController),
                    Divider(color: Colors.grey),
                    LocationPanel(
                        announcementStoreController:
                            announcementStoreController),
                    Divider(color: Colors.grey),
                    UserPanel(
                        announcementStoreController:
                            announcementStoreController),
                    SizedBox(height: 120),
                  ],
                ),
              ),
            ],
          ),
          BottomsBar(
            announcementStoreController: announcementStoreController,
          ),
        ],
      ),
    );
  }
}
