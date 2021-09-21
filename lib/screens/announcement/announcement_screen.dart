import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '/components/custom_drawer/custom_drawer.dart';
import '/stores/announcement_store/announcement_store.dart';
import 'components/category_field.dart';
import 'components/cep_field.dart';
import 'components/hide_phone_field.dart';
import 'components/images_field.dart';

class AnnouncementScreen extends StatelessWidget {
  const AnnouncementScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AnnouncementStoreController _announcementStoreController =
        AnnouncementStoreController();

    final labelStyle = TextStyle(
      fontWeight: FontWeight.w800,
      color: Colors.grey,
      fontSize: 18,
    );
    final contentPadding = const EdgeInsets.fromLTRB(16, 10, 12, 10);
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text("Criar Anuncio"),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Card(
            clipBehavior: Clip.antiAlias,
            margin: const EdgeInsets.symmetric(horizontal: 32),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                ImagesField(
                  announcementStoreController: _announcementStoreController,
                ),
                Observer(
                  builder: (_) => TextFormField(
                    onChanged: _announcementStoreController.setTitle,
                    decoration: InputDecoration(
                      errorText: _announcementStoreController.titleError,
                      labelText: "Titulo *",
                      labelStyle: labelStyle,
                      contentPadding: contentPadding,
                    ),
                  ),
                ),
                Observer(
                  builder: (_) => TextFormField(
                    onChanged: _announcementStoreController.setDescription,
                    decoration: InputDecoration(
                      errorText: _announcementStoreController.descriptionError,
                      labelText: "Descriçaõ *",
                      labelStyle: labelStyle,
                      contentPadding: contentPadding,
                    ),
                    maxLines: null,
                  ),
                ),
                CategoryField(
                    announcementStoreController: _announcementStoreController),
                CepField(
                  announcementStoreController: _announcementStoreController,
                ),
                Observer(builder: (_) {
                  return TextFormField(
                    onChanged: _announcementStoreController.setPrice,
                    decoration: InputDecoration(
                      errorText: _announcementStoreController.priceError,
                      labelText: "Preço *",
                      labelStyle: labelStyle,
                      contentPadding: contentPadding,
                      prefixText: 'R\$ ',
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      RealInputFormatter(centavos: true),
                    ],
                  );
                }),
                HidePhoneField(
                  announcementStoreController: _announcementStoreController,
                ),
                Observer(builder: (_) {
                  return GestureDetector(
                    onTap: _announcementStoreController.invalidSendPressed,
                    child: MaterialButton(
                      onPressed: _announcementStoreController.sendPressed,
                      child: Text(
                        "Enviar",
                        style: TextStyle(fontSize: 18),
                      ),
                      height: 50,
                      textColor: Colors.white,
                      disabledColor: Colors.orange.withAlpha(120),
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      color: Colors.orange,
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
