import 'package:flashcard_app/database_class/flashdata.dart';

import 'package:isar/isar.dart';

part 'flashcard.g.dart';

@Collection()
class Flashcard {
  Id id = Isar.autoIncrement; // Automatically incrementing ID

  // final question = IsarLink<FlashData>(); // The flashcard question
  // final answer = IsarLink<FlashData>(); // The flashcard answer
  late int question_id;
  late int answer_id;
}
