import '../address/address.dart';
import '../category/category.dart';
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
  Address? address;
  User? user;
  int? views;
}
