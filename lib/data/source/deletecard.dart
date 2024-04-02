import 'package:codealpha_flashcard_quiz_app/core/sqldb/sqldb.dart';

class DeleteCard {
  SqlDb sqlDb = SqlDb();

  deleteCard(String id) async {
    await sqlDb.deleteData('id = $id');
  }
}
