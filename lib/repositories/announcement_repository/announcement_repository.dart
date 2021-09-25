import 'dart:async';
import 'dart:io';

import 'package:olx_clone/models/category/category.dart';
import 'package:olx_clone/models/user/user.dart';
import 'package:olx_clone/stores/filter_store/filter_store.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:path/path.dart' as path;

import '/models/model_announcement/model_announcement.dart';
import '/repositories/parse_errors/parse_errors.dart';
import '/repositories/table_keys.dart';

class AnnouncementRepository {
  Future<void> save({required ModelAnnouncement modelAnnouncement}) async {
    final parseImages = await saveImages(modelAnnouncement.images!);

    final parseUser = ParseUser('', '', '')
      ..set(keyUserId, modelAnnouncement.user!.id);

    final announcementObject = ParseObject(keyAdTable);

    final parseAcl = ParseACL(owner: parseUser);
    parseAcl.setPublicReadAccess(allowed: true);
    parseAcl.setPublicWriteAccess(allowed: false);

    announcementObject.setACL(parseAcl);
    announcementObject.set<String>(keyAdTable, modelAnnouncement.title!);
    announcementObject.set<String>(
        keyAdDescription, modelAnnouncement.description!);
    announcementObject.set<bool>(keyAdHidePhone, modelAnnouncement.hidePhone!);
    announcementObject.set<String>(keyAdPrice, modelAnnouncement.price!);
    announcementObject.set<int>(
        keyAdStatus, modelAnnouncement.announcementStatus.index);
    announcementObject.set<String>(
        keyAdDistrict, modelAnnouncement.address!.district);
    announcementObject.set<String>(
        keyAdCity, modelAnnouncement.address!.city.name!);
    announcementObject.set<String>(
        keyAdFederativeUnit, modelAnnouncement.address!.uf.initials!);
    announcementObject.set<String>(
        keyAdPostalCode, modelAnnouncement.address!.cep);
    announcementObject.set<List<ParseFile>>(keyAdImages, parseImages!);
    announcementObject.set<ParseUser>(keyAdOwner, parseUser);
    announcementObject.set<ParseObject>(
        keyAdCategory,
        ParseObject(keyCategoryTable)
          ..set(keyCategoryId, modelAnnouncement.category!.id));

    final response = await announcementObject.save();
    print(99999999999999);
    print(response.success);
    print(response.result);
    print(response.statusCode);
    print(response.error);

    if (!response.success) {
      return Future.error(
          ParseErrors.getDescription(response.error!.code).toString());
    }
  }

  Future<List<ParseFile>?> saveImages(List images) async {
    final parseImages = <ParseFile>[];
    try {
      for (final image in images) {
        if (image is File) {
          final parseFile = ParseFile(image, name: path.basename(image.path));
          final response = await parseFile.save();
          if (!response.success) {
            return Future.error(
                ParseErrors.getDescription(response.error!.code).toString());
          }
          parseImages.add(parseFile);
        } else {
          final parseFile = ParseFile(null);
          parseFile.name = path.basename(image);
          parseImages.add(parseFile);
        }
      }
      return parseImages;
    } catch (e) {
      return Future.error("Falha ao salvar image");
    }
  }

  Future<List<ModelAnnouncement>?> getHomeAdList(
      {FilterStoreController? filter,
      String? search,
      Category? category,
      int? page}) async {
    final queryBuilder = QueryBuilder<ParseObject>(ParseObject(keyAdTable));
    queryBuilder.setAmountToSkip(page! * 20);
    queryBuilder.setLimit(20);
    queryBuilder.includeObject([keyAdOwner, keyAdCategory]);
    queryBuilder.whereEqualTo(keyAdStatus, AnnouncementStatus.ACTIVE.index);
    if (search != null && search.trim().isNotEmpty) {
      queryBuilder.whereContains(keyAdTitle, search, caseSensitive: false);
    }
    // if (category != null && category.id != "*") {
    //   queryBuilder.whereEqualTo(
    //       keyAdCategory,
    //       (ParseObject(keyCategoryTable)..set(keyCategoryId, category.id))
    //           .toPointer());
    // }

    switch (filter!.orderBy) {
      case OrderBy.DATE:
        queryBuilder.orderByAscending(keyAdCreatedAt);
        break;
      case OrderBy.PRICE:
      default:
        queryBuilder.orderByDescending(keyAdPrice);
        break;
    }

    if (filter.minPrice != null) {
      queryBuilder.whereGreaterThanOrEqualsTo(keyAdPrice, filter.minPrice);
    }
    if (filter.maxPrice != null) {
      queryBuilder.whereLessThanOrEqualTo(keyAdPrice, filter.maxPrice);
    }
    if (filter.vendorType != null &&
        filter.vendorType > 0 &&
        filter.vendorType <
            (VENDOR_TYPE_PARTICULAR | VENDOR_TYPE_PROFESSIONAL)) {
      final userQuery = QueryBuilder<ParseUser>(ParseUser.forQuery());
      if (filter.vendorType == VENDOR_TYPE_PARTICULAR) {
        userQuery.whereEqualTo(keyUserType, UserType.PARTICULAR.index);
      }
      if (filter.vendorType == VENDOR_TYPE_PROFESSIONAL) {
        userQuery.whereEqualTo(keyUserType, UserType.PROFESSIONAL.index);
      }
      queryBuilder.whereMatchesQuery(keyAdOwner, userQuery);
    }
    final response = await queryBuilder.query();
    if (response.success && response.results != null) {
      return response.results!
          .map((e) => ModelAnnouncement.fromParse(parseObject: e))
          .toList();
    } else if (response.success && response.results == null) {
      return [];
    } else {
      Future.error(ParseErrors.getDescription(response.error!.code)!);
    }
  }
}
