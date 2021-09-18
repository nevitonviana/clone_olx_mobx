import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:olx_clone/stores/page_store/page_store.dart';

import '/stores/user_manager_store/user_manager_store.dart';
import '/screens/login/login_screen.dart';

class CustomDrawerHeader extends StatelessWidget {
  const CustomDrawerHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserManagerStoreController _userManagerStoreController =
        GetIt.I<UserManagerStoreController>();

    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
        if (_userManagerStoreController.isLoggedIn) {
          GetIt.I<PageStoreController>().setPage(4);
        } else {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => LoginScreen(),
          ));
        }
      },
      child: Container(
        color: Colors.purple,
        height: 95,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              Icons.person,
              color: Colors.white,
              size: 35,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _userManagerStoreController.isLoggedIn
                      ? _userManagerStoreController.user!.name!
                      : "Acess sua conta agora!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  _userManagerStoreController.isLoggedIn
                      ? _userManagerStoreController.user!.email!
                      : "Clique Aqui",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
