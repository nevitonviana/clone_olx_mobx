import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import '/repositories/table_keys.dart';

class Category {
  final String id;
  final String description;

  Category({
    required this.id,
    required this.description,
  });

  Category.fromParse(ParseObject parseObject)
      : id = parseObject.objectId!,
        description = parseObject.get(keyCategoryDescription);
}
