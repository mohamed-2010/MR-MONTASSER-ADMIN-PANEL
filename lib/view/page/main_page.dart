import 'dart:io';

import 'package:childappadminpanel/view/page/all_study_phase.dart';
import 'package:childappadminpanel/view/page/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../controller/dashboard_controller.dart';
import '../../controller/main_controller.dart';
import '../../utils/colors.dart';


class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(Platform.isAndroid){
      SystemChrome.setSystemUIOverlayStyle(
          const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            systemNavigationBarIconBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark,
          ));
    }
    return GetBuilder<MainController>(builder: (controller){
      return Scaffold(
        body: IndexedStack(
          index: controller.tabIndex,
          children: [
            DashBoard(),
            AllStudyPhase(),
            ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedIconTheme: const IconThemeData(color: Colors.lightBlue),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled,color: controller.tabIndex == 0 ? Colors.lightBlue : Colors.black,),
              label: "الرئيسية",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.leaderboard, color: controller.tabIndex == 1 ? Colors.lightBlue : Colors.black,),
              label: "المراحل الدراسية",
            ),
          ],
          currentIndex: controller.tabIndex,
          selectedItemColor: Colors.lightBlue,
          onTap: controller.changeTabIndex,
        ),
      );
    });
  }
}
//Age Calculator Made By Mohamed Ahmed