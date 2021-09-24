import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '/stores/filter_store/filter_store.dart';
import '/stores/home_store/home_store.dart';
import 'components/order_by_field.dart';
import 'components/price_range_field.dart';
import 'components/vendor_type_field.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FilterStoreController _filterStoreController =
        GetIt.I<HomeStoreController>().cloneFilter;
    return Scaffold(
      appBar: AppBar(
        title: Text("Filtrar Buscas"),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
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
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  OrderByField(
                    filterStoreController: _filterStoreController,
                  ),
                  PriceRangeField(
                    filterStoreController: _filterStoreController,
                  ),
                  VendorTypeField(
                    filterStoreController: _filterStoreController,
                  ),
                  Observer(builder: (_) {
                    return Container(
                      height: 50,
                      margin: const EdgeInsets.symmetric(vertical: 16),
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                        textColor: Colors.white,
                        disabledColor: Colors.orange[200],
                        onPressed: _filterStoreController.isFormValid
                            ? () {
                                _filterStoreController.save();
                                Navigator.of(context).pop();
                              }
                            : null,
                        color: Colors.orangeAccent,
                        child: Text(
                          "FILTRAR",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
