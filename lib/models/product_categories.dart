class ProductCategory {
  final String? name;
  final String? id;

  ProductCategory({this.name, this.id});

  factory ProductCategory.fromMap(Map<String, dynamic> map, String id) {
    return ProductCategory(
      name: map["name"],
      id: id,
    );
  }
}

class ProductCategoryModel {
  List<ProductCategory> productsCategoryList = [];
}
