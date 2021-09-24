import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '/stores/filter_store/filter_store.dart';
import 'section_title.dart';

class VendorTypeField extends StatelessWidget {
  final FilterStoreController filterStoreController;

  const VendorTypeField({Key? key, required this.filterStoreController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SectionTitle(title: "Tipo de anuncios"),
        Observer(builder: (_) {
          return Wrap(
            children: [
              GestureDetector(
                onTap: () {
                  if (filterStoreController.isTypeParticular) {
                    if (filterStoreController.isTypeProfessional) {
                      filterStoreController
                          .resetVendorType(VENDOR_TYPE_PARTICULAR);
                    } else {
                      filterStoreController
                          .selectVendorType(VENDOR_TYPE_PROFESSIONAL);
                    }
                  } else {
                    filterStoreController.setVendorType(VENDOR_TYPE_PARTICULAR);
                  }
                },
                child: Container(
                  width: 120,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: filterStoreController.isTypeParticular
                          ? Colors.purple
                          : Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(25),
                    color: filterStoreController.isTypeParticular
                        ? Colors.purple
                        : Colors.transparent,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "Particular",
                    style: TextStyle(
                        color: filterStoreController.isTypeParticular
                            ? Colors.white
                            : Colors.black),
                  ),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              GestureDetector(
                onTap: () {
                  if (filterStoreController.isTypeProfessional) {
                    if (filterStoreController.isTypeParticular) {
                      filterStoreController
                          .resetVendorType(VENDOR_TYPE_PROFESSIONAL);
                    } else {
                      filterStoreController
                          .selectVendorType(VENDOR_TYPE_PARTICULAR);
                    }
                  } else {
                    filterStoreController
                        .setVendorType(VENDOR_TYPE_PROFESSIONAL);
                  }
                },
                child: Container(
                  width: 120,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: filterStoreController.isTypeProfessional
                          ? Colors.purple
                          : Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(25),
                    color: filterStoreController.isTypeProfessional
                        ? Colors.purple
                        : Colors.transparent,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "Profissional",
                    style: TextStyle(
                        color: filterStoreController.isTypeProfessional
                            ? Colors.white
                            : Colors.black),
                  ),
                ),
              ),
            ],
          );
        }),
      ],
    );
  }
}
