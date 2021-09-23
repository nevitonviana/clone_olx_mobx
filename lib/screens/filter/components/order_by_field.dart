import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:olx_clone/stores/filter_store/filter_store.dart';

import 'section_title.dart';

class OrderByField extends StatelessWidget {
  final FilterStoreController filterStoreController;

  const OrderByField({Key? key, required this.filterStoreController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buildOption(String title, OrderBy orderBy) {
      return GestureDetector(
        onTap: () {
          filterStoreController.setOrderBy(orderBy);
        },
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          height: 50,
          decoration: BoxDecoration(
            color: filterStoreController.orderBy == orderBy
                ? Colors.purple
                : Colors.transparent,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(
              color: filterStoreController.orderBy == orderBy
                  ? Colors.purple
                  : Colors.grey,
            ),
          ),
          child: Text(
            title,
            style: TextStyle(
              color: filterStoreController.orderBy == orderBy
                  ? Colors.white
                  : Colors.black,
            ),
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(title: "Ordenar Por"),
        Observer(builder: (_) {
          return Row(
            children: [
              buildOption("Data", OrderBy.DATE),
              const SizedBox(
                width: 12,
              ),
              buildOption("Preço", OrderBy.PRICE),
            ],
          );
        }),
      ],
    );
  }
}
