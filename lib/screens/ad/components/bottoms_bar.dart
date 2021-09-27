import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '/stores/announcement_store/announcement_store.dart';

class BottomsBar extends StatelessWidget {
  final AnnouncementStoreController announcementStoreController;

  const BottomsBar({Key? key, required this.announcementStoreController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // if(announcementStoreController.)
    //desativar button
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 26,
            ),
            height: 38,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(19),
              color: Colors.orange,
            ),
            child: Row(
              children: [
                if (announcementStoreController.hidePhone)
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        final phone = 'announcementStoreController';
                        launch('tel:$phone');
                      },
                      child: Container(
                        height: 25,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border(
                            left: BorderSide(
                              color: Colors.white24,
                            ),
                          ),
                        ),
                        child: Text(
                          "Logar",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      alignment: Alignment.center,
                      height: 25,
                      child: Text(
                        "Chat",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Container(
            height: 38,
            alignment: Alignment.center,
            color: const Color.fromRGBO(249, 249, 249, 1),
            child: Text(
              "{announcementStoreController.user.name} (anunciamente)",
              style: TextStyle(
                fontWeight: FontWeight.w300,
              ),
            ),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
