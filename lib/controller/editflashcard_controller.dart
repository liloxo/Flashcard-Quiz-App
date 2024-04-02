import 'package:codealpha_flashcard_quiz_app/controller/homepage_controller.dart';
import 'package:codealpha_flashcard_quiz_app/core/constants/options.dart';
import 'package:codealpha_flashcard_quiz_app/data/model/flashcardmodel.dart';
import 'package:codealpha_flashcard_quiz_app/data/source/editcard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EditFlashcardController extends GetxController {
  late FlashCardModel flashCardModel;
  TextEditingController question = TextEditingController();
  TextEditingController answerone = TextEditingController();
  TextEditingController answertwo = TextEditingController();
  TextEditingController answerthree = TextEditingController();
  TextEditingController answerfour = TextEditingController();
  EditCard editCard = EditCard();
  late String selectedOptions;
  HomepageController homepageController = Get.put(HomepageController());

  TextStyle statusstyle(String rxString, String field) {
    if (field == rxString) {
      return const TextStyle(
          color: Colors.grey,
          fontSize: 18,
          fontWeight: FontWeight.w500,
          letterSpacing: 1);
    } else {
      return const TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w600,
          letterSpacing: 1);
    }
  }

  optiontap(BuildContext context) {
    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(20.w, 320.h, 0, 0),
      items: options.map((city) {
        return PopupMenuItem<String>(
          value: city,
          child: Text(city,
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
        );
      }).toList(),
    ).then((value) {
      if (value != null) {
        selectedOptions = value;
        update();
      }
    });
  }

  editcard() async {
    FlashCardModel flashCardmodel = FlashCardModel(
        id: flashCardModel.id,
        question: question.text,
        answerone: answerone.text,
        answertwo: answertwo.text,
        answerthree: answerthree.text,
        answerfour: answerfour.text,
        rightanswer: selectedOptions);
    Map<String, Object?> data = flashCardmodel.toJson();
    if (question.text.isEmpty ||
        answerone.text.isEmpty ||
        answertwo.text.isEmpty ||
        answerthree.text.isEmpty ||
        answerfour.text.isEmpty) {
      Get.defaultDialog(
          content: const Text(
        'Please Make sure to fill all the fields',
        style: TextStyle(fontWeight: FontWeight.bold),
      ));
    } else {
      await editCard.editCard(data, flashCardModel.id.toString());
      Get.back();
      homepageController.getCards();
    }
  }

  @override
  void onInit() {
    flashCardModel = Get.arguments['card'];
    question = TextEditingController(text: flashCardModel.question);
    answerone = TextEditingController(text: flashCardModel.answerone);
    answertwo = TextEditingController(text: flashCardModel.answertwo);
    answerthree = TextEditingController(text: flashCardModel.answerthree);
    answerfour = TextEditingController(text: flashCardModel.answerfour);
    selectedOptions = flashCardModel.rightanswer!;
    super.onInit();
  }
}
