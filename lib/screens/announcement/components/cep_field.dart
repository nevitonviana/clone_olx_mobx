import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '/stores/cep_store/cep_store.dart';

class CepField extends StatelessWidget {
  const CepField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CepStoreController _cepStoreController = CepStoreController();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextFormField(
          onChanged: _cepStoreController.setCep,
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            CepInputFormatter(),
          ],
          decoration: InputDecoration(
            labelText: 'CEP *',
            labelStyle: TextStyle(
                fontWeight: FontWeight.w800, color: Colors.grey, fontSize: 18),
            contentPadding: const EdgeInsets.fromLTRB(16, 10, 12, 10),
          ),
        ),
        Observer(
          builder: (context) {
            if (_cepStoreController.address == null &&
                _cepStoreController.error == null &&
                !_cepStoreController.loading)
              return Container();
            else if (_cepStoreController.address == null &&
                _cepStoreController.error == null)
              return LinearProgressIndicator();
            else if (_cepStoreController.error != null)
              return Container(
                alignment: Alignment.center,
                color: Colors.red.withAlpha(100),
                height: 50,
                padding: const EdgeInsets.all(8),
                child: Text(
                  _cepStoreController.error.toString(),
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
                  "Localidade: ${_cepStoreController.address!.district}, Cidade: "
                  "${_cepStoreController.address!.city.name}, Uf: ${_cepStoreController.address!.uf.initials}",
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
