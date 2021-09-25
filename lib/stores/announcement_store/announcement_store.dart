import 'package:mobx/mobx.dart';

import '/models/address/address.dart';
import '/models/category/category.dart';
import '/models/model_announcement/model_announcement.dart';
import '/repositories/announcement_repository/announcement_repository.dart';
import '/stores/cep_store/cep_store.dart';

part 'announcement_store.g.dart';

class AnnouncementStoreController = _AnnouncementStoreControllerBase
    with _$AnnouncementStoreController;

abstract class _AnnouncementStoreControllerBase with Store {
  ObservableList images = ObservableList();

  @observable
  Category? category;

  @action
  void setCategory(Category value) => category = value;

  @computed
  bool get categoryValid => category != null;

  String? get categoryError {
    if (!showErrors || categoryValid)
      return null;
    else
      return 'Campo obrigatorio';
  }

  CepStoreController cepStoreController = CepStoreController();

  @computed
  Address? get address => cepStoreController.address;

  bool get addressValid => address != null;

  String? get addressError {
    if (!showErrors || addressValid)
      return null;
    else
      return "Campo Obrigatorio";
  }

  @observable
  bool hidePhone = false;

  @action
  void setHidePhone(bool value) => hidePhone = value;

  @observable
  String title = '';

  @action
  void setTitle(String value) => title = value;

  @computed
  bool get titleValid => title.length >= 4;

  String? get titleError {
    if (!showErrors || titleValid)
      return null;
    else if (title.isEmpty)
      return "Campo obrigatorio";
    else
      return 'Titulo muito curto';
  }

  @observable
  String description = '';

  @action
  void setDescription(String value) => description = value;

  @computed
  bool get descriptionValid => description.length >= 6;

  String? get descriptionError {
    if (!showErrors || descriptionValid)
      return null;
    else if (description.isEmpty)
      return "Campo obrigatorio";
    else
      return 'Titulo muito curto';
  }

  @observable
  String priceText = "";

  @action
  void setPrice(String value) => priceText = value;

  @computed
  bool get priceValid => priceText.length >= 1 && priceText.length <= 999999;

  String? get priceError {
    if (!showErrors || priceValid)
      return null;
    else if (priceText.isEmpty)
      return 'Capom obrigatorio';
    else
      return "Preço invalido";
  }

  @computed
  bool get imagesValid => images.isNotEmpty;

  String? get imagesError {
    if (!showErrors || imagesValid) {
      return null;
    } else {
      return "Insira images";
    }
  }

  @observable
  bool showErrors = false;

  @action
  void invalidSendPressed() => showErrors = true;

  @computed
  bool get formValid =>
      imagesValid &&
      descriptionValid &&
      titleValid &&
      priceValid &&
      addressValid &&
      categoryValid;

  @computed
  dynamic get sendPressed => formValid ? _send : null;

  @observable
  bool loading = false;

  @observable
  bool saveAnnouncement = false;

  @observable
  String error = "";

  @action
  Future<void> _send() async {
    final createdAnnouncement = ModelAnnouncement();
    createdAnnouncement.title = title;
    createdAnnouncement.description = description;
    createdAnnouncement.category = category!;
    createdAnnouncement.price = priceText;
    createdAnnouncement.hidePhone = hidePhone;
    createdAnnouncement.images = images;
    createdAnnouncement.address = address!;
    // createdAnnouncement.user = GetIt.I<UserManagerStoreController>().user!;

    loading = true;
    try {
      await AnnouncementRepository()
          .save(modelAnnouncement: createdAnnouncement);
      saveAnnouncement = true;
    } catch (e) {
      error = e.toString();
    }

    loading = false;
  }
}
