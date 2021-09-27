import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:olx_clone/models/model_announcement/model_announcement.dart';
import 'package:olx_clone/screens/my_ads/my_ads_screen.dart';

import '/components/custom_drawer/custom_drawer.dart';
import '/components/error_box/error_box.dart';
import '/stores/announcement_store/announcement_store.dart';
import '/stores/page_store/page_store.dart';
import 'components/category_field.dart';
import 'components/cep_field.dart';
import 'components/hide_phone_field.dart';
import 'components/images_field.dart';

class AnnouncementScreen extends StatefulWidget {
  final ModelAnnouncement? modelAnnouncement;

  const AnnouncementScreen({Key? key, this.modelAnnouncement})
      : super(key: key);

  @override
  State<AnnouncementScreen> createState() => _AnnouncementScreenState();
}

class _AnnouncementScreenState extends State<AnnouncementScreen> {
  _AnnouncementScreenState({ModelAnnouncement? modelAnnouncement})
      : _announcementStoreController = AnnouncementStoreController(
            modelAnnouncement: modelAnnouncement ?? ModelAnnouncement());

  final AnnouncementStoreController _announcementStoreController;

  bool editing = false;

  @override
  void initState() {
    super.initState();
    when((_) => _announcementStoreController.saveAnnouncement, () {
      if (editing)
        Navigator.of(context).pop(true);
      else {
        GetIt.I<PageStoreController>().setPage(0);
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => MyAdsScreen(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
            child: Observer(
              builder: (context) {
                if (_announcementStoreController.loading) {
                  return Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircularProgressIndicator(
                          color: Colors.green,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Salvando Anúncio",
                          style: TextStyle(fontSize: 18),
                        )
                      ],
                    ),
                  );
                } else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ImagesField(
                        announcementStoreController:
                            _announcementStoreController,
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
                          onChanged:
                              _announcementStoreController.setDescription,
                          decoration: InputDecoration(
                            errorText:
                                _announcementStoreController.descriptionError,
                            labelText: "Descriçaõ *",
                            labelStyle: labelStyle,
                            contentPadding: contentPadding,
                          ),
                          maxLines: null,
                        ),
                      ),
                      CategoryField(
                          announcementStoreController:
                              _announcementStoreController),
                      CepField(
                        announcementStoreController:
                            _announcementStoreController,
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
                        announcementStoreController:
                            _announcementStoreController,
                      ),
                      Observer(builder: (_) {
                        return ErrorBox();
                      }),
                      Observer(builder: (_) {
                        return GestureDetector(
                          onTap:
                              _announcementStoreController.invalidSendPressed,
                          child: MaterialButton(
                            onPressed: _announcementStoreController.sendPressed,
                            child: Text(
                              "Enviar",
                              style: TextStyle(fontSize: 18),
                            ),
                            height: 50,
                            textColor: Colors.white,
                            disabledColor: Colors.orange.withAlpha(120),
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            color: Colors.orange,
                          ),
                        );
                      }),
                    ],
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
