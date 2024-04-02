import 'package:codealpha_flashcard_quiz_app/core/sqldb/sqldb.dart';

class GetCards {
  SqlDb sqlDb = SqlDb();

  getCards() async {
    var response = await sqlDb.readData();
    return response;
  }
}
