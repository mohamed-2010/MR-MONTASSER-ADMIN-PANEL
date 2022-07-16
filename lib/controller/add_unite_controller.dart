import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddUniteController extends GetxController {
  TextEditingController uniteNameController = TextEditingController();
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  //function to add unite to database
  addUnite(String id) async {
    await _firestore.collection('StudyPhase').doc(id).collection('unites').add({
      'name': uniteNameController.text,
      'enable': true,
    });
    Get.back();
  }
}