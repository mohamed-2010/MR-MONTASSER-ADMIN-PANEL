import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditLessonController extends GetxController {
  dynamic argumentData = Get.arguments;
  TextEditingController lessonNameController = TextEditingController();
  TextEditingController lessonUrlController = TextEditingController();
  var isHorizontal = false.obs;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  void changeValue(bool value) {
    print('change');
    isHorizontal.value = value;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getLesson(id: argumentData[0]['id'], studyPhaseId: argumentData[1]['studyPhaseId'], lessonId: argumentData[2]['lessonId']);
  } //function to add unite to database
  getLesson({required String id, required String studyPhaseId, required String lessonId}) async {
    await firestore.collection('StudyPhase').doc(studyPhaseId).collection('unites').doc(id).collection('lessons').doc(lessonId).get().then((value) {
      lessonNameController.text = value.data()!['name'];
      lessonUrlController.text = value.data()!['url'];
      isHorizontal.value = value.data()!['horezontal'];
    });
    update();
  }

  //function to add unite to database
  updateLesson({required String id, required String studyPhaseId, required String lessonId}) async {
    await firestore.collection('StudyPhase').doc(studyPhaseId).collection('unites').doc(id).collection('lessons').doc(lessonId).update({
      'name': lessonNameController.text,
      'url': lessonUrlController.text,
      'enable': true,
      'horezontal': isHorizontal.value,
    });
    Get.back();
  }
}