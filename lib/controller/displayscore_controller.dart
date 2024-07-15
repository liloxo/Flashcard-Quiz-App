import 'package:codealpha_flashcard_quiz_app/data/model/flashcardmodel.dart';
import 'package:get/get.dart';

class DisplayscoreController extends GetxController {
  late int questions;
  late int wrong;
  late int correct;
  late List<FlashCardModel> flashcards;

  String score() {
    double percentage = (correct * 100 / questions);
    String formattedScore = percentage.toStringAsFixed(2);
    return formattedScore;
  }

  @override
  void onInit() {
    questions = Get.arguments['questions'];
    wrong = Get.arguments['wrong'];
    correct = Get.arguments['correct'];
    flashcards = Get.arguments['cards'];
    super.onInit();
  }
}
