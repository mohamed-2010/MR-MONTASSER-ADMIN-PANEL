import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashBoardController extends GetxController {
  TextEditingController urlController = TextEditingController();
  var count = 0.obs;
  var studyPhaseCount = 0.obs;
  var unitesCount = 0.obs;
  var lessonsCount = 0.obs;
  var value = false.obs;
  void updateValue(bool value) async {
    final FirebaseFirestore db = FirebaseFirestore.instance;
    await db.collection('ad').doc('W6S5BMomgMEfMM4nP7wd').update({
      'value': value,
    });
    this.value.value = value;
    update();
  }
  void updateUrl(String url) async {
    final FirebaseFirestore db = FirebaseFirestore.instance;
    await db.collection('youtube').doc('urlId').update({
      'url': url,
    });
    Get.snackbar(
      'تم',
      'تم تحديث الurl',
      icon: Icon(Icons.check),
      backgroundColor: Colors.green,
      colorText: Colors.white,
      duration: Duration(seconds: 2),
    );
  }
  @override
  void onInit() async {
    super.onInit();
    final youtube = await FirebaseFirestore.instance.collection('youtube').get();
    final users = await FirebaseFirestore.instance.collection('users').get();
    final ad = await FirebaseFirestore.instance.collection('ad').get();
    final studPhase = await FirebaseFirestore.instance.collection('StudyPhase').get();
    for(int i =0; i < studPhase.docs.length; i++){
      final unites = await FirebaseFirestore.instance.collection('StudyPhase').doc(studPhase.docs[i].id).collection('unites').get();
      unitesCount.value += unites.docs.length;
      for(int j =0; j < unites.docs.length; j++){
        final lessons = await FirebaseFirestore.instance.collection('StudyPhase').doc(studPhase.docs[i].id).collection('unites').doc(unites.docs[j].id).collection('lessons').get();
        lessonsCount.value += lessons.docs.length;
      }
    }
    count.value = users.docs.length;
    studyPhaseCount.value = studPhase.docs.length;
    value.value = ad.docs[0].data()['value'];
    urlController.text = youtube.docs[0].data()['url'];
  }
}