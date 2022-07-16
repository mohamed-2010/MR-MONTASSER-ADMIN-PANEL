import 'package:childappadminpanel/controller/add_lesson_controller.dart';
import 'package:childappadminpanel/controller/add_study_phase_contoller.dart';
import 'package:childappadminpanel/controller/add_unite_controller.dart';
import 'package:childappadminpanel/controller/dashboard_controller.dart';
import 'package:childappadminpanel/controller/edit_lesson_controller.dart';
import 'package:childappadminpanel/controller/lessons_conroller.dart';
import 'package:childappadminpanel/controller/study_phase_controller.dart';
import 'package:childappadminpanel/controller/unites_controller.dart';
import 'package:get/get.dart';

import '../controller/main_controller.dart';

class MainBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(() => MainController());
    Get.lazyPut<AddUniteController>(() => AddUniteController());
    Get.lazyPut<UnitesController>(() => UnitesController());
    Get.lazyPut<LessonsController>(() => LessonsController());
    Get.lazyPut<StudyPhaseContoller>(() => StudyPhaseContoller());
    Get.lazyPut<AddLessonController>(() => AddLessonController());
    Get.lazyPut<AddStudyPhaseController>(() => AddStudyPhaseController());
    Get.lazyPut<DashBoardController>(() => DashBoardController());
    Get.lazyPut<EditLessonController>(() => EditLessonController());
  }
}