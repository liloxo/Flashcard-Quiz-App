import 'package:codealpha_flashcard_quiz_app/core/sqldb/sqldb.dart';

class EditCard {
  SqlDb sqlDb = SqlDb();

  editCard(Map<String, Object?> data, String id) async {
    await sqlDb.updateData(data, 'id = $id');
  }
}
