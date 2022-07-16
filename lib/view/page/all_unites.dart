import 'dart:math';

import 'package:childappadminpanel/controller/add_unite_controller.dart';
import 'package:childappadminpanel/controller/unites_controller.dart';
import 'package:childappadminpanel/view/page/all_lessons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'add_unite.dart';

class AllUnites extends StatelessWidget {
  AllUnites({Key? key,required this.id}) : super(key: key);
  String id;
  @override
  Widget build(BuildContext context) {
    Get.lazyPut<UnitesController>(() => UnitesController());
    return GetBuilder<UnitesController>(builder: (controller){
      return Scaffold(
        appBar: AppBar(
          title: Text("كل الوحدات",style: GoogleFonts.cairo(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              StreamBuilder(
                stream: FirebaseFirestore.instance.collection('StudyPhase').doc(id).collection('unites').snapshots(),
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 15),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.9,
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
                                      Get.to(AllLessonsPage(studPhaseId:id,id: document.id));
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Center(child: Text(document['name'],style: GoogleFonts.cairo(fontSize: 20,fontWeight: FontWeight.bold),)),
                                        Row(
                                          children: [
                                            Switch(value: document['enable'], onChanged: (onChanged){
                                              FirebaseFirestore.instance.collection('StudyPhase').doc(id).collection('unites').doc(document.id).update({
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
      );
    });
  }
}
