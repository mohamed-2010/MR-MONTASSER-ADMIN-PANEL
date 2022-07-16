import 'dart:math';

import 'package:childappadminpanel/controller/study_phase_controller.dart';
import 'package:childappadminpanel/view/page/all_unites.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AllStudyPhase extends StatelessWidget {
  AllStudyPhase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StudyPhaseContoller>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            "كل المراحل الدراسية",
            style: GoogleFonts.cairo(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('StudyPhase')
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 15),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height ,
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
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    MaterialButton(
                                      onPressed: () {
                                        Get.to(AllUnites(id: document.id));
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Center(
                                              child: Text(
                                            document['StudyPhaseName'],
                                            style: GoogleFonts.cairo(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          )),
                                          Row(
                                            children: [
                                              Switch(
                                                value: document['enable'],
                                                onChanged: (onChanged) {
                                                  FirebaseFirestore.instance
                                                      .collection('StudyPhase')
                                                      .doc(document.id)
                                                      .update(
                                                          {'enable': onChanged});
                                                },
                                              ),
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
        ),
      );
    });
  }
}
