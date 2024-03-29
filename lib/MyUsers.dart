import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyUser {
  String user_name="";
  String email="";
  String uid="";
  bool user_exist = false;
  String number = "";
  String firstname = "";
  String lastname = "";
  String profilepic = "";
  late User _authUser;
  // Method to print user information
  MyUser getCurrentUser() {
    if(!user_exist){
      _retrieveUser();
    }
    return this;
  }
  void _retrieveUser() async{
    var authUser =  FirebaseAuth.instance.currentUser;
    if(authUser == null){
      return;
    }
    this._authUser = authUser;
    this.email = authUser.email!;
    this.uid = authUser.uid;

    final docRef = FirebaseFirestore.instance.collection("User").doc(authUser.uid);
    docRef.get().then(
          (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        user_exist = true;
        this.user_name = data["user_name"];
      },
      onError: (e) => print("Error getting document: $e"),
    );
  }
}
