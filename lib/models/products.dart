class Products {
  final String? productName;
  final String? regularPrice;
  final String? discountedPrice;
  final String? productDescription;
  final String? productImageUrl;
  final String? currentProductStatusValue;
  final String? userCreatedDate;

  Products({
    this.productName,
    this.regularPrice,
    this.discountedPrice,
    this.productDescription,
    this.productImageUrl,
    this.currentProductStatusValue,
    this.userCreatedDate,
  });
  // : _productName = productName,
  //       _regularPrice = regularPrice,
  //       _discountedPrice = discountedPrice,
  //       _productDescription = productDescription,
  //       _getProductImageUrl = getProductImageUrl,
  //       _currentProductStatusValue = currentProductStatusValue,
  //       _userCreatedDate = userCreatedDate;

  factory Products.fromMap(Map<String, dynamic> map) {
    return Products(
      productName: map["name"],
      regularPrice: map["regularPrice"],
      discountedPrice: map["discountedPrice"],
      productDescription: map["description"],
      productImageUrl: map["imageURL"],
      currentProductStatusValue: map["status"],
      userCreatedDate: map["createdDate"],
    );
  }

  // Map<String, dynamic> toMap() {
  //   return {
  //     "userID": Users.getUserId,
  //     "name": _productName,
  //     "regularPrice": _regularPrice,
  //     "discountedPrice": _discountedPrice,
  //     "description": _productDescription,
  //     "imageURL": _getProductImageUrl,
  //     "status": _currentProductStatusValue,
  //     "createdDate": _userCreatedDate,
  //   };
  // }

}
