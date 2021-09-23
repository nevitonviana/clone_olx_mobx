import 'package:mobx/mobx.dart';

part 'filter_store.g.dart';

enum OrderBy { DATE, PRICE }

class FilterStoreController = _FilterStoreControllerBase
    with _$FilterStoreController;

abstract class _FilterStoreControllerBase with Store {
  @observable
  OrderBy orderBy = OrderBy.DATE;

  @action
  void setOrderBy(OrderBy value) => orderBy = value;

  @observable
  String? minPrice;

  @action
  void setMinPrice(String value) => minPrice = value;

  @observable
  String? maxPrice;

  @action
  void setMaxPrice(String value) => maxPrice = value;

  @computed
  String? get priceError => maxPrice != null &&
          minPrice != null &&
          maxPrice!.length < minPrice!.length
      ? "Faixar de preço invalida"
      : null;
}
