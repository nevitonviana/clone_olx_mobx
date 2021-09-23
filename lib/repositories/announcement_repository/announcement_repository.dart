import 'dart:async';
import 'dart:io';

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
}
