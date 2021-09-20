import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '/components/error_box/error_box.dart';
import '/models/category/category.dart';
import '/stores/category_store/category_store.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key, this.selected, this.showAll = true})
      : super(key: key);

  final Category? selected;
  final bool showAll;

  @override
  Widget build(BuildContext context) {
    final CategoryStoreController _categoryStoreController =
        GetIt.I<CategoryStoreController>();

    return Scaffold(
      appBar: AppBar(
        title: Text("Categorias"),
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.fromLTRB(32, 12, 32, 32),
          elevation: 9,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Observer(
            builder: (_) {
              if (_categoryStoreController.error != null) {
                return ErrorBox(
                  massage: _categoryStoreController.error,
                );
              } else if (_categoryStoreController.categoryList.isEmpty) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                final categories = showAll
                    ? _categoryStoreController.allCategoryList
                    : _categoryStoreController.categoryList;
                return ListView.separated(
                  itemCount: categories.length,
                  separatorBuilder: (_, __) => Divider(
                    height: 0.1,
                    color: Colors.grey,
                  ),
                  itemBuilder: (_, index) {
                    final category = categories[index];
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).pop(category);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        color: category.id == selected?.id
                            ? Colors.purple.withAlpha(50)
                            : null,
                        child: Text(
                          category.description,
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontWeight: category.id == selected?.id
                                ? FontWeight.bold
                                : null,
                          ),
                        ),
                      ),
                    );
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
