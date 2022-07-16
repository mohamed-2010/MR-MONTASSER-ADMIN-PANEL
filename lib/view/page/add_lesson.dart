import 'package:childappadminpanel/controller/add_lesson_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/colors.dart';
import '../widgets/edittext_filed.dart';

class AddLesson extends StatelessWidget {
  AddLesson({Key? key, required this.id, required this.studyPhaseId})
      : super(key: key);
  String studyPhaseId;
  String id;
  @override
  Widget build(BuildContext context) {
    Get.lazyPut<AddLessonController>(() => AddLessonController());
    return GetBuilder<AddLessonController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            "إضافة درس",
            style: GoogleFonts.cairo(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.7,
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        spreadRadius: 5,
                      )
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'إضافة درس',
                            style: GoogleFonts.cairo(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: MyEditTextFiled(
                        hintText: "ادخل عنوان الدرس",
                        password: false,
                        controller: controller.lessonNameController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: MyEditTextFiled(
                        hintText: "ادخل رابط الدرس",
                        password: false,
                        controller: controller.lessonUrlController,
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(15),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'عرض',
                                style: GoogleFonts.cairo(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Obx(()=>Switch(
                                value: controller.isHorizontal.value,
                                onChanged: (onChanged) {
                                  controller.isHorizontal.value == onChanged;
                                  controller.changeValue(onChanged);
                                },
                              ),)
                            ],
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        color: Colors.lightBlue,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 5),
                          child: Text(
                            'إضافة',
                            style: GoogleFonts.cairo(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        onPressed: () {
                          controller.addLesson(
                              id: id, studyPhaseId: studyPhaseId);
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
