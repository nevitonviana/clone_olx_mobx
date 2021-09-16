import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '/components/custom_drawer/page_tile.dart';
import '/stores/page_store/page_store.dart';

class PageSection extends StatelessWidget {
  const PageSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageStoreController _pageStoreController =
        GetIt.I<PageStoreController>();
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
          onTap: () => _pageStoreController.setPage(1),
        ),
        PageTile(
          label: ("Chat"),
          iconData: (Icons.chat),
          highLighted: _pageStoreController.page == 2,
          onTap: () => _pageStoreController.setPage(2),
        ),
        PageTile(
          label: ("Favoritos"),
          iconData: (Icons.favorite),
          highLighted: _pageStoreController.page == 3,
          onTap: () => _pageStoreController.setPage(3),
        ),
        PageTile(
          label: ("Minha Conta"),
          iconData: (Icons.person),
          highLighted: _pageStoreController.page == 4,
          onTap: () => _pageStoreController.setPage(4),
        ),
      ],
    );
  }
}
