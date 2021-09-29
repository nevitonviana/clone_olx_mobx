import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '/components/custom_drawer/page_tile.dart';
import '/screens/login/login_screen.dart';
import '/stores/page_store/page_store.dart';
import '/stores/user_manager_store/user_manager_store.dart';

class PageSection extends StatelessWidget {
  final PageStoreController _pageStoreController =
      GetIt.I<PageStoreController>();
  final UserManagerStoreController userManagerStoreController =
      GetIt.I<UserManagerStoreController>();

  @override
  Widget build(BuildContext context) {
    Future<void> verifyLoginAndSetPage(int page) async {
      if (userManagerStoreController.isLoggedIn) {
        _pageStoreController.setPage(page);
      } else {
        final result = await Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ));
        if (result != null && result) _pageStoreController.setPage(page);
      }
    }

    return Column(
      children: [
        PageTile(
          label: ("anucios"),
          iconData: (Icons.list),
          highLighted: _pageStoreController.page == 0,
          onTap: () => _pageStoreController.setPage(0),
        ),
        PageTile(
          label: ("Inserir Anúncio"),
          iconData: (Icons.edit),
          highLighted: _pageStoreController.page == 1,
          onTap: () => verifyLoginAndSetPage(1),
        ),
        PageTile(
          label: ("Chat"),
          iconData: (Icons.chat),
          highLighted: _pageStoreController.page == 2,
          onTap: () => verifyLoginAndSetPage(2),
        ),
        PageTile(
          label: ("Favoritos"),
          iconData: (Icons.favorite),
          highLighted: _pageStoreController.page == 3,
          onTap: () => verifyLoginAndSetPage(3),
        ),
        PageTile(
          label: ("Minha Conta"),
          iconData: (Icons.person),
          highLighted: _pageStoreController.page == 4,
          onTap: () => verifyLoginAndSetPage(4),
        ),
      ],
    );
  }
}
