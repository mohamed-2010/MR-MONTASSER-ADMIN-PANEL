import 'package:childappadminpanel/controller/dashboard_controller.dart';
import 'package:childappadminpanel/view/widgets/card_admin.dart';
import 'package:childappadminpanel/view/widgets/edittext_filed.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DashBoard extends GetView<DashBoardController> {
  const DashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashBoardController>(
      builder: (controllerD) {
        return Scaffold(
          appBar: AppBar(
            title: Text('الرئيسية',style: GoogleFonts.cairo(fontSize: 20,
              fontWeight: FontWeight.bold,),),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                Obx(() =>CardAdmin(title: "المستخدمين", count: controller.count.value, icon: Icons.person),),
                const SizedBox(height: 20,),
                Obx(() => CardAdmin(title: "المراحل الدراسية", count: controller.studyPhaseCount.value, icon: Icons.school_outlined)),
                const SizedBox(height: 20,),
                Obx(() => CardAdmin(title: "الوحدات", count: controller.unitesCount.value, icon: Icons.category_outlined)),
                const SizedBox(height: 20,),
                Obx(() => CardAdmin(title: "الدروس", count: controller.lessonsCount.value, icon: Icons.subscriptions_outlined)),
                const SizedBox(height: 20,),
                Obx(() => Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("تفعيل الاعلانات",style: GoogleFonts.cairo(fontSize: 20,
                        fontWeight: FontWeight.bold,),),
                      Switch(value: controller.value.value, onChanged: (onChanged){
                        controller.value.value = onChanged;
                        controller.updateValue(onChanged);
                        controller.update();
                      }),
                    ],
                  ),
                )),
                const SizedBox(height: 20,),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.7,
                          height: MediaQuery.of(context).size.height * 0.08,
                          child: MyEditTextFiled(
                              hintText: "Url", password: false,
                              controller: controller.urlController,
                          )
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MaterialButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          color: Colors.lightBlue,
                          child: Center(
                            child: Text(
                              'تعديل',
                              style: GoogleFonts.cairo(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          onPressed: () {
                            controller.updateUrl(controller.urlController.text);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20,),
              ],
            ),
          ),
        );
      }
    );
  }
}
