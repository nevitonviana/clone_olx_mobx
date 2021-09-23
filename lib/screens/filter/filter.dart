import 'package:flutter/material.dart';
import 'package:olx_clone/stores/filter_store/filter_store.dart';

import 'components/order_by_field.dart';
import 'components/price_range_field.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FilterStoreController _filterStoreController =
        FilterStoreController();
    return Scaffold(
      appBar: AppBar(
        title: Text("Filtrar Buscas"),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 32),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 9,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                OrderByField(
                  filterStoreController: _filterStoreController,
                ),
                PriceRangeField(
                  filterStoreController: _filterStoreController,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
