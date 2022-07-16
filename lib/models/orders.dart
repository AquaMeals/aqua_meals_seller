class Orders {
  final List<Map<String, dynamic>>? productsList;
  final String? userID;
  final String? orderStatus;
  // final String? quantity;
  // final String? productID;
  final String? productName;
  final String? regularPrice;
  final String? discountedPrice;
  final String? productDescription;
  final String? productImageUrl;
  final String? currentProductStatusValue;
  final String? category;
  final String? unit;
  final String? orderID;

  Orders({
    this.orderID,
    this.productsList,
    this.userID,
    this.orderStatus,
    this.productName,
    this.regularPrice,
    this.discountedPrice,
    this.productDescription,
    this.productImageUrl,
    this.currentProductStatusValue,
    this.category,
    this.unit,
  });

  factory Orders.fromMap(Map<String, dynamic> map, String orderID) {
    return Orders(
        productName: map["name"],
        regularPrice: map["regularPrice"],
        discountedPrice: map["discountedPrice"],
        productDescription: map["description"],
        productImageUrl: map["imageURL"],
        currentProductStatusValue: map["status"],
        category: map["category"],
        unit: map["unit"],
        orderID: orderID,
        orderStatus: map["orderStatus"],
        productsList: map["productsList"],
        userID: map["userID"]);
  }
}
