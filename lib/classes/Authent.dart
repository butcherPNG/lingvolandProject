


import 'dart:convert';
import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_web/firebase_auth_web.dart';
import 'package:pointycastle/digests/sha256.dart';

import 'DataBase.dart';

class Authent{
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<User> getCurrentUser() async {
    return await auth.currentUser!;
  }

  Future<void> createUserWithEmailAndPassword(

      String email, String password,  String username, String imageUrl) async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    if (firebaseAuth is FirebaseAuthWeb){
      firebaseAuth.setPersistence(Persistence.SESSION);
    }
    final bytes = utf8.encode(password);
    final uint8List = Uint8List.fromList(bytes);
    final sha256 = SHA256Digest();
    final digest = sha256.process(uint8List);
    final pass = digest.toString();
    UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: pass);

    Map<String, dynamic> userInfoMap = {
      'email': email,
      'password': pass,
      'username': username,
      'imgUrl': imageUrl,
      'role': 'student',

    };

    if(userCredential != null){
      DatabaseMethods().addUserInfoToDB(auth.currentUser!.uid, userInfoMap);
    }
  }

  Future<void> loginWithEmailAndPassword(String email, String password) async{
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    if (firebaseAuth is FirebaseAuthWeb){
      firebaseAuth.setPersistence(Persistence.SESSION);
    }
    final bytes = utf8.encode(password);
    final uint8List = Uint8List.fromList(bytes);
    final sha256 = SHA256Digest();
    final digest = sha256.process(uint8List);
    final pass = digest.toString();
    // UserCredential userCredential =
    print(pass);
    await auth.signInWithEmailAndPassword(email: email, password: pass);
  }

  Future<void> logout() async {
    await auth.signOut();

  }
}