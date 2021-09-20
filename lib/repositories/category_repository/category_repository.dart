import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import '/models/category/category.dart';
import '../parse_errors/parse_errors.dart';
import '../table_keys.dart';

class CategoryRepository {
  Future<List<Category>> getList() async {
    final queryBuilder = QueryBuilder(ParseObject(keyCategoryTable))
      ..orderByAscending(keyCategoryDescription);

    final response = await queryBuilder.query();

    if (response.success) {
      return response.results!.map((e) => Category.fromParse(e)).toList();
    } else {
      throw ParseErrors.getDescription(response.error!.code).toString();
    }
  }
}
