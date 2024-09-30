import 'package:flashcard_app/database_class/drawingdata.dart';
import 'package:isar/isar.dart';

part 'flashdata.g.dart';

@Collection()
class FlashData {
  Id id = Isar.autoIncrement;

  late String str;

  // final drawing = IsarLink<DrawingData>();
  late int drawing_id;
}
