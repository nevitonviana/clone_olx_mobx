import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '/stores/filter_store/filter_store.dart';
import 'price_field.dart';
import 'section_title.dart';

class PriceRangeField extends StatelessWidget {
  final FilterStoreController filterStoreController;

  const PriceRangeField({Key? key, required this.filterStoreController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(title: "Preço"),
        Row(
          children: [
            PriceField(
              initialValue: filterStoreController.minPrice,
              onChanged: filterStoreController.setMinPrice,
              label: "min",
            ),
            const SizedBox(
              width: 12,
            ),
            PriceField(
              initialValue: filterStoreController.maxPrice,
              label: "maix",
              onChanged: filterStoreController.setMaxPrice,
            ),
            Observer(builder: (_) {
              if (filterStoreController.priceError != null)
                return Text(
                  filterStoreController.priceError!,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.red,
                  ),
                );
              return Container();
            }),
          ],
        ),
      ],
    );
  }
}
