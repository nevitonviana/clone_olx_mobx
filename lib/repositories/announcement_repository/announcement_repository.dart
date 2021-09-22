import 'dart:async';
import 'dart:io';

import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:path/path.dart' as path;

import '/models/model_announcement/model_announcement.dart';
import '/repositories/parse_errors/parse_errors.dart';

class AnnouncementRepository {
  Future<void> save({required ModelAnnouncement modelAnnouncement}) async {
    final parseImages = await saveImages(modelAnnouncement.images!);
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
