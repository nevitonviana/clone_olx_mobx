import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import '/repositories/table_keys.dart';
import '/repositories/user_repositories/user_repository.dart';
import '../address/address.dart';
import '../category/category.dart';
import '../city/city.dart';
import '../uf/uf.dart';
import '../user/user.dart';

enum AnnouncementStatus { PENDING, ACTIVE, SOLD, DELETE }

class ModelAnnouncement {
  String? id;
  List? images;
  String? title;
  String? description;
  Category? category;
  Address? address;
  String? price;
  bool? hidePhone;
  AnnouncementStatus announcementStatus = AnnouncementStatus.PENDING;
  DateTime? createdDate;
  User? user;
  int? views;

  ModelAnnouncement(
      {this.id,
      this.images,
      this.title,
      this.description,
      this.category,
      this.address,
      this.price,
      this.hidePhone,
      this.announcementStatus = AnnouncementStatus.PENDING,
      this.createdDate,
      this.user,
      this.views});

  ModelAnnouncement.fromParse({required ParseObject parseObject}) {
    id = parseObject.objectId;
    images = parseObject.get<List>(keyAdImages)!.map((e) => e.url).toList();
    title = parseObject.get<String>(keyAdTitle);
    description = parseObject.get<String>(keyAdDescription);
    address = Address(
      uf: UF(initials: parseObject.get<String>(keyAdFederativeUnit)),
      city: City(name: parseObject.get<String>(keyAdCity)),
      cep: parseObject.get<String>(keyAdPostalCode)!,
      district: parseObject.get<String>(keyAdFederativeUnit)!,
    );
    category = Category.fromParse(parseObject.get<ParseObject>(keyAdCategory)!);
    price = parseObject.get<String>(keyAdPrice);
    hidePhone = parseObject.get<bool>(keyAdHidePhone);
    announcementStatus =
        AnnouncementStatus.values[parseObject.get<int>(keyAdStatus)!];
    createdDate = parseObject.createdAt;
    user = UserSignUpRepositories()
        .mapParseToUser(parseObject.get<ParseUser>(keyAdOwner)!);
    views = parseObject.get<int>(keyAdViews, defaultValue: 0);
  }
}
