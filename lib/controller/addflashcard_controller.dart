import 'package:codealpha_flashcard_quiz_app/controller/homepage_controller.dart';
import 'package:codealpha_flashcard_quiz_app/core/constants/options.dart';
import 'package:codealpha_flashcard_quiz_app/data/model/flashcardmodel.dart';
import 'package:codealpha_flashcard_quiz_app/data/source/addcard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddFlashcardController extends GetxController {
  TextEditingController question = TextEditingController();
  TextEditingController answerone = TextEditingController();
  TextEditingController answertwo = TextEditingController();
  TextEditingController answerthree = TextEditingController();
  TextEditingController answerfour = TextEditingController();
  AddCard addCard = AddCard();
  HomepageController homepageController = Get.put(HomepageController());
  String selectedOption = 'Correct Answer';

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
        selectedOption = value;
        update();
      }
    });
  }

  addFlashcard() async {
    FlashCardModel flashCardModel = FlashCardModel(
        question: question.text,
        answerone: answerone.text,
        answertwo: answertwo.text,
        answerthree: answerthree.text,
        answerfour: answerfour.text,
        rightanswer: selectedOption);
    Map<String, Object?> data = flashCardModel.toJson();
    if (question.text.isEmpty ||
        answerone.text.isEmpty ||
        answertwo.text.isEmpty ||
        answerthree.text.isEmpty ||
        answerfour.text.isEmpty ||
        selectedOption == 'Correct Answer') {
      Get.defaultDialog(
          content: const Text(
        'Please Make sure to fill all the fields',
        style: TextStyle(fontWeight: FontWeight.bold),
      ));
    } else {
      addCard.addCard(data);
      Get.back();
      homepageController.getCards();
    }
  }
}
