import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddLessonController extends GetxController {
  TextEditingController lessonNameController = TextEditingController();
  TextEditingController lessonUrlController = TextEditingController();
  var isHorizontal = false.obs;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  void changeValue(bool value) {
    isHorizontal.value = value;
    update();
  }
  //function to add unite to database
  addLesson({required String id, required String studyPhaseId}) async {
    await _firestore.collection('StudyPhase').doc(studyPhaseId).collection('unites').doc(id).collection('lessons').add({
      'name': lessonNameController.text,
      'url': lessonUrlController.text,
      'enable': true,
      'horezontal': isHorizontal.value,
    });
    Get.back();
  }
}