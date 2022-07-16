import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddStudyPhaseController extends GetxController {
  TextEditingController uniteNameController = TextEditingController();
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  //function to add unite to database
  addUnite() async {
    await _firestore.collection('StudyPhase').add({
      'StudyPhaseName': uniteNameController.text,
      'enable': true,
    });
    Get.back();
  }
}