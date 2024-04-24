import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService{
  final FirebaseAuth auth=FirebaseAuth.instance;
  final FirebaseFirestore firestore=FirebaseFirestore.instance;

  User? getCurrentUser(){
    return auth.currentUser;
  }

  Future<UserCredential> signInWithEmailPassword(BuildContext context, String email,password) async{
    try{
      UserCredential userCredential=await auth.signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    }
    on FirebaseAuthException catch(e){
      showDialog(context: context, builder: (context)=>AlertDialog(
        title: Text(e.toString()),
      ));
      throw Exception(e.code);
    }
  }

  Future<void> signOut() async{
    return await auth.signOut();
  }

  Future<UserCredential> signUpWithEmailPassword(BuildContext context,String name,password,email) async{
    try{
      UserCredential userCredential= await auth.createUserWithEmailAndPassword(email: email, password: password);
      firestore.collection("Users").doc(email).set(
        {'uid':userCredential.user!.uid,'name':name,'email':email}
      );
      return userCredential;
    }
    on FirebaseAuthException catch(e){
      showDialog(context: context, builder: (context)=>AlertDialog(
        title: Text(e.toString()),
      ));
      throw Exception(e);
    }
  }
}