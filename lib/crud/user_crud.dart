import 'dart:io';
import 'package:aqua_meals_seller/models/users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class UserCrud {
  final FirebaseStorage _storageInstance = FirebaseStorage.instance;
  final FirebaseAuth _authInstance = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  userSignIn(
    String? email,
    String? password,
  ) async {
    UserCredential user = await _authInstance.signInWithEmailAndPassword(
        email: email!, password: password!);
    String userId = user.user!.uid;
    return userId;
  }

  userAuthSignUp({
    String? email,
    String? password,
  }) async {
    UserCredential user = await _authInstance.createUserWithEmailAndPassword(
        email: email!, password: password!);
    return user;
  }

  uploadUserProfileImage({
    String? userId,
    String? imageBaseName,
    File? profileImageFile,
  }) async {
    Reference ref = _storageInstance
        .ref()
        .child("Images/$userId/UserProfileImage/$imageBaseName");
    await ref.putFile(profileImageFile!);
    String _getUserProfileImageUrl = await ref.getDownloadURL();
    return _getUserProfileImageUrl;
  }

  addUserData({Users? users}) async {
    await _db
        .collection("users")
        .doc("WvamEGwHsbNkF3KImk2V")
        .collection("sellers")
        .doc(Users.getUserId)
        .set(users!.toMap());
  }
}
