import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '/components/custom_drawer/custom_drawer.dart';
import '/stores/user_manager_store/user_manager_store.dart';
import '../edit_account/edit_account_screen.dart';
import '../favorite/favorite_screen.dart';
import '../my_ads/my_ads_screen.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text("Minha conta"),
      ),
      body: Center(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 9,
          margin: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 140,
                child: Stack(
                  children: [
                    Observer(builder: (context) {
                      return Align(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "${GetIt.I<UserManagerStoreController>().user!.name!.toString()}",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.purple,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            Text(
                              "neviotnDev@hotmail.com", //
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[700],
                              ),
                            )
                          ],
                        ),
                      );
                    }),
                    Align(
                      alignment: Alignment.topRight,
                      child: TextButton(
                        onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (_) => EditAccountScreen())),
                        child: Text(
                          "EDITAR",
                          style: TextStyle(
                            color: Colors.purple,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Divider(),
              ListTile(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => MyAdsScreen(),
                )),
                title: Text(
                  "menus Anuncios",
                  style: TextStyle(
                      color: Colors.purple, fontWeight: FontWeight.w600),
                ),
                trailing: Icon(
                  Icons.keyboard_arrow_right_rounded,
                ),
              ),
              ListTile(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => FavoriteScreen(hideDrawer: false),
                )),
                title: Text(
                  "Favoritos",
                  style: TextStyle(
                      color: Colors.purple, fontWeight: FontWeight.w600),
                ),
                trailing: Icon(
                  Icons.keyboard_arrow_right_rounded,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
