import 'package:codealpha_flashcard_quiz_app/core/class/statusrequest.dart';
import 'package:codealpha_flashcard_quiz_app/data/model/flashcardmodel.dart';
import 'package:codealpha_flashcard_quiz_app/data/source/deletecard.dart';
import 'package:codealpha_flashcard_quiz_app/data/source/getcards.dart';
import 'package:get/get.dart';

class HomepageController extends GetxController {
  late StatusRequest statusRequest;
  List<FlashCardModel>? flashcards;
  GetCards getcards = GetCards();
  DeleteCard deleteCard = DeleteCard();

  deletecard(int i) async {
    await deleteCard.deleteCard(i.toString());
    if (flashcards == null || flashcards!.isEmpty) {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  getCards() async {
    statusRequest = StatusRequest.loading;
    update();
    List? response = await getcards.getCards();
    if (response == null || response.isEmpty) {
      statusRequest = StatusRequest.failure;
    } else {
      flashcards = response.map((e) => FlashCardModel.fromJson(e)).toList();
      statusRequest = StatusRequest.success;
    }
    update();
  }

  @override
  void onInit() {
    getCards();
    super.onInit();
  }
}
