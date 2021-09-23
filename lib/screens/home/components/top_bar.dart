import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:olx_clone/screens/category_screen/category_screen.dart';
import 'package:olx_clone/screens/filter/filter.dart';
import 'package:olx_clone/stores/home_store/home_store.dart';

import 'BarButton.dart';

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeStoreController _homeStoreController = HomeStoreController();
    return Row(
      children: [
        Observer(builder: (context) {
          return BarButton(
            voidCallback: () async {
              final category = await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => CategoryScreen(
                    showAll: true,
                    selected: _homeStoreController.category,
                  ),
                ),
              );
              if (category != null) _homeStoreController.setCategory(category);
            },
            label: _homeStoreController.category?.description ?? 'Categoria',
            boxDecoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey[400]!,
                ),
              ),
            ),
          );
        }),
        BarButton(
          boxDecoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.grey[400]!,
              ),
              left: BorderSide(
                color: Colors.grey[400]!,
              ),
            ),
          ),
          label: "Filtros",
          voidCallback: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => FilterScreen()),
            );
          },
        ),
      ],
    );
  }
}
