import 'package:childappadminpanel/utils/colors.dart';
import 'package:childappadminpanel/view/widgets/edittext_filed.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controller/add_study_phase_contoller.dart';

class AddStudyPhase extends StatelessWidget {
  const AddStudyPhase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<AddStudyPhaseController>(() => AddStudyPhaseController());
    return GetBuilder<AddStudyPhaseController>(builder: (controller){
      return Scaffold(
        appBar: AppBar(
          title: Text(
            "Add Study Phase",
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
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width *0.8,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      spreadRadius: 5,
                    )
                  ]
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Add Study Phase',style: GoogleFonts.cairo(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: MyEditTextFiled(hintText: "Enter Name Of Study Phase", password: false,controller: controller.uniteNameController,),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        color: primaryColor,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 5),
                          child: Text('Add',style: GoogleFonts.cairo(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),),
                        ),
                        onPressed: (){
                          controller.addUnite();
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
