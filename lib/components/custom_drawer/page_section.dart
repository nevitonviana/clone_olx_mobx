import 'package:flutter/material.dart';
import 'package:olx_clone/components/custom_drawer/page_tile.dart';

class PageSection extends StatelessWidget {
  const PageSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PageTile(
          label: ("anucios"),
          iconData: (Icons.list),
          highLighted: true,
        ),
        PageTile(
          label: ("Inserir Anúncio"),
          iconData: (Icons.edit),
        ),
        PageTile(
          label: ("Chat"),
          iconData: (Icons.chat),
        ),
        PageTile(
          label: ("Favoritos"),
          iconData: (Icons.favorite),
        ),
        PageTile(
          label: ("Minha Conta"),
          iconData: (Icons.person),
        ),
      ],
    );
  }
}
