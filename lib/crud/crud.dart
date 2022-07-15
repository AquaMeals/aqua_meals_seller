import 'package:aqua_meals_seller/helper/preferences.dart';
import 'package:aqua_meals_seller/models/product_categories.dart';
import 'package:aqua_meals_seller/models/products.dart';
import 'package:aqua_meals_seller/models/users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class CRUD {
  final FirebaseStorage _storageInstance = FirebaseStorage.instance;
  final FirebaseAuth _authInstance = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  signout() async {
    await SharedPreferencesHelper().removeAuthToken();
    await _authInstance.signOut();
  }

  fetchMyProductsStream() {
    Stream<QuerySnapshot> myProductsStream = FirebaseFirestore.instance
        .collection("products")
        .doc(Users.getUserId)
        .collection("myProducts")
        .snapshots();
    return myProductsStream;
  }

  deleteMyProduct(String productID) async {
    await _db
        .collection("products")
        .doc(Users.getUserId)
        .collection("myProducts")
        .doc(productID)
        .delete();
  }

  fetchProducts() async {
    List<Products> _productsList = [];

    QuerySnapshot<Map<String, dynamic>> _query = await _db
        .collection("products")
        .doc(Users.getUserId)
        .collection("myProducts")
        .get();

    for (var document in _query.docs) {
      String productID = document.id;
      Products _product = Products.fromMap(document.data(), productID);
      _productsList.add(_product);
    }
    return _productsList;
  }

  fetchUserCredentials({String? userID}) async {
    DocumentSnapshot<Map<String, dynamic>> _query = await _db
        .collection("users")
        .doc("WvamEGwHsbNkF3KImk2V")
        .collection("sellers")
        .doc(userID)
        .get();
    Map<String, dynamic>? userDataMap = _query.data();
    Users.fromMap(userDataMap!);
  }

  // fetchProductCategories() async {
  //   List<ProductCategory> _productsCategoryList = [];
  //   QuerySnapshot<Map<String, dynamic>> _query =
  //       await _db.collection("categories").get();
  //   _query.docs.forEach((document) {
  //     ProductCategory _productCategory =
  //         ProductCategory.fromMap(document.data(), document.id);
  //     _productsCategoryList.add(_productCategory);
  //   });
  //   return _productsCategoryList;
  // }

  fetchProductCategories() async {
    List<ProductCategory> _productsCategoryList = [];
    QuerySnapshot<Map<String, dynamic>> _query =
        await _db.collection("categories").get();
    for (var document in _query.docs) {
      ProductCategory _productCategory =
          ProductCategory.fromMap(document.data(), document.id);
      _productsCategoryList.add(_productCategory);
    }
    return _productsCategoryList;
  }
}
