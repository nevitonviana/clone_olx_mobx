import 'package:mobx/mobx.dart';

part 'filter_store.g.dart';

enum OrderBy { DATE, PRICE }

const VENDOR_TYPE_PARTICULAR = 1 << 0;
const VENDOR_TYPE_PROFESSIONAL = 1 << 1;

class FilterStoreController = _FilterStoreControllerBase
    with _$FilterStoreController;

abstract class _FilterStoreControllerBase with Store {
  _FilterStoreControllerBase(
      {this.orderBy = OrderBy.DATE,
      this.maxPrice,
      this.vendorType = VENDOR_TYPE_PARTICULAR,
      this.minPrice});

  @observable
  late OrderBy orderBy;

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

  @observable
  late int vendorType;

  @action
  void selectVendorType(int value) => vendorType = value;

  void setVendorType(int type) => vendorType = vendorType | type;

  void resetVendorType(int type) => vendorType = vendorType & ~type;

  @computed
  bool get isTypeParticular => vendorType & VENDOR_TYPE_PARTICULAR != 0;

  @computed
  bool get isTypeProfessional => vendorType & VENDOR_TYPE_PROFESSIONAL != 0;

  @computed
  bool get isFormValid => priceError == null;

  void save() {
    // GetIt.I<HomeStoreController>().setFilter(this);
  }

  FilterStoreController clone() {
    return FilterStoreController(
        maxPrice: maxPrice,
        minPrice: minPrice,
        orderBy: orderBy,
        vendorType: vendorType);
  }
}
