import 'dart:math';

import 'package:childappadminpanel/controller/lessons_conroller.dart';
import 'package:childappadminpanel/view/page/add_lesson.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'edit_lesson.dart';

class AllLessonsPage extends StatelessWidget {
  AllLessonsPage({Key? key,required this.id,required this.studPhaseId}) : super(key: key);
  String id;
  String studPhaseId;
  @override
  Widget build(BuildContext context) {
    print(studPhaseId);
    print(id);
    Get.lazyPut<LessonsController>(() => LessonsController());
    return GetBuilder<LessonsController>(builder: (controller){
      return Scaffold(
        appBar: AppBar(
          title: Text("كل الدروس",style: GoogleFonts.cairo(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              StreamBuilder(
                stream: FirebaseFirestore.instance.collection('StudyPhase').doc(studPhaseId).collection('unites').doc(id).collection('lessons').snapshots(),
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 15),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: ListView(
                        children: snapshot.data!.docs.map((document) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.08,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  MaterialButton(
                                    onPressed: (){
                                      Get.to(EditLesson(id: id,studyPhaseId: studPhaseId,lessonId: document.id),arguments: [
                                        {"id": id},
                                        {"studyPhaseId": studPhaseId},
                                        {"lessonId": document.id},
                                      ]);
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Center(child: Text(document['name'],style: GoogleFonts.cairo(fontSize: 20,fontWeight: FontWeight.bold),)),
                                        Row(
                                          children: [
                                            IconButton(onPressed: (){
                                              FirebaseFirestore.instance.collection('StudyPhase').doc(studPhaseId).collection('unites').doc(id).collection('lessons').doc(document.id).delete();
                                            },icon: Icon(Icons.delete_forever_outlined,color: Colors.redAccent,),),
                                            Switch(value: document['enable'], onChanged: (onChanged){
                                              FirebaseFirestore.instance.collection('StudyPhase').doc(studPhaseId).collection('unites').doc(id).collection('lessons').doc(document.id).update({
                                                'enable': onChanged
                                              });
                                            },),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(AddLesson(id: id,studyPhaseId: studPhaseId,));
          },
          child: Icon(Icons.add),
        ),
      );
    });
  }
}
