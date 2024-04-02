import 'package:codealpha_flashcard_quiz_app/view/pages/addflashcard.dart';
import 'package:codealpha_flashcard_quiz_app/view/pages/displayscore.dart';
import 'package:codealpha_flashcard_quiz_app/view/pages/editflashcard.dart';
import 'package:codealpha_flashcard_quiz_app/view/pages/homepage.dart';
import 'package:codealpha_flashcard_quiz_app/view/pages/startquiz.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: '/', page: () => const HomePage()),
  GetPage(name: '/add', page: () => const AddFlashCard()),
  GetPage(name: '/edit', page: () => const EditFlashCard()),
  GetPage(name: '/startquiz', page: () => const StartQuiz()),
  GetPage(name: '/displayscore', page: () => const DisplayScore()),
];
