import 'dart:core';
import 'dart:core';
import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class MyDatabaseClass {
  static List <Map> data=[];
  static DatabaseReference db = FirebaseDatabase.instance.ref('users');
  FirebaseStorage storage =FirebaseStorage.instance;


  static Future insertData( String email,String password,String imageURL) async{
    String key = db.push().key!;
   db.child(key).set({
    'email': email,
    'password': password,
     'imageurl': imageURL,

     'key': key,
   }).then((value) {
     selectData();
   });

  }


  static updateData( String email,String password,String key) {

    db.child(key).update({
      'email': email,
      'password': password,
      'key': key,
    }).then((value) {
      selectData();
    });
  }

  static Future selectData() async{
    Map userTemp ={};
    db.once().then((value) {
      userTemp =value.snapshot.value as Map;
      data.clear();
      userTemp.forEach((key, value) {
        data.add(value);
      });
      return data;
    });

  }

  static deleteData(String key) {

    db.child(key).remove();
  }
}
