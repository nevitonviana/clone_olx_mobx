import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '/stores/announcement_store/announcement_store.dart';
import '/stores/cep_store/cep_store.dart';

class CepField extends StatelessWidget {
  final AnnouncementStoreController announcementStoreController;

  CepField({required this.announcementStoreController})
      : cepStoreController = announcementStoreController.cepStoreController;

  final CepStoreController cepStoreController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Observer(
          builder: (context) => TextFormField(
            onChanged: cepStoreController.setCep,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              CepInputFormatter(),
            ],
            decoration: InputDecoration(
              errorText: announcementStoreController.addressError,
              labelText: 'CEP *',
              labelStyle: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Colors.grey,
                  fontSize: 18),
              contentPadding: const EdgeInsets.fromLTRB(16, 10, 12, 10),
            ),
          ),
        ),
        Observer(
          builder: (context) {
            if (cepStoreController.address == null &&
                cepStoreController.error == null &&
                !cepStoreController.loading)
              return Container();
            else if (cepStoreController.address == null &&
                cepStoreController.error == null)
              return LinearProgressIndicator();
            else if (cepStoreController.error != null)
              return Container(
                alignment: Alignment.center,
                color: Colors.red.withAlpha(100),
                height: 50,
                padding: const EdgeInsets.all(8),
                child: Text(
                  cepStoreController.error.toString(),
                  style:
                      TextStyle(fontWeight: FontWeight.w600, color: Colors.red),
                ),
              );
            else
              return Container(
                alignment: Alignment.center,
                color: Colors.purple.withAlpha(150),
                height: 50,
                padding: const EdgeInsets.all(8),
                child: Text(
                  "Localidade: ${cepStoreController.address!.district}, Cidade: "
                  "${cepStoreController.address!.city.name}, Uf: ${cepStoreController.address!.uf.initials}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              );
          },
        ),
      ],
    );
  }
}
