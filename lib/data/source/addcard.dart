import 'package:codealpha_flashcard_quiz_app/core/sqldb/sqldb.dart';

class AddCard {
  SqlDb sqlDb = SqlDb();

  addCard(Map<String, Object?> data) async {
    await sqlDb.insertData(data);
  }
}
