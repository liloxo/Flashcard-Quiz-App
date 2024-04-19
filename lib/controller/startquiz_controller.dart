import 'package:codealpha_flashcard_quiz_app/data/model/flashcardmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class StartquizController extends GetxController {
  List<FlashCardModel> flashcards = [];
  late PageController pageController;
  int currentPage = 0;
  List<bool> whentap = [];
  String? usersAnswer;
  int correct = 0;
  int wrong = 0;

  next(int i) {
    if (usersAnswer == null) {
      Get.defaultDialog(
          content: Text(
        'Please select an answer',
        style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w700),
      ));
      return null;
    } else {
      if (currentPage == flashcards.length - 1) {
        checkanswer(i);
        Get.offNamed('displayscore', arguments: {
          'correct': correct,
          'wrong': wrong,
          'questions': flashcards.length,
          'cards': flashcards
        });
      } else {
        checkanswer(i);

        currentPage++;

        whentap = List<bool>.generate(4, (index) => false);
        usersAnswer = null;
        pageController.animateToPage(currentPage,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut);
      }
    }
  }

  checkanswer(int i) {
    if (usersAnswer == flashcards[i].rightanswer) {
      correct++;
    } else {
      wrong++;
    }
  }

  onPageChanged(int index) {
    currentPage = index;
    update();
  }

  selectOpt(int i, String opt) {
    whentap = List.filled(4, false);
    whentap[i] = !whentap[i];
    usersAnswer = opt[0];
    update();
  }

  @override
  void onInit() {
    super.onInit();
    flashcards = Get.arguments['cards'];
    whentap = List<bool>.generate(4, (index) => false);
    pageController = PageController();
  }
}
