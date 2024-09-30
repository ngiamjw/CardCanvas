import 'package:isar/isar.dart';

part 'drawingdata.g.dart';

@Collection()
class DrawingData {
  Id id = Isar.autoIncrement;

  late List<DrawingPoint> drawn_flashcard;
}

@embedded
class DrawingPoint {
  // List of drawing points
  late List<double> x;
  late List<double> y;

  // Single color
  late int color;

  late double width;
}
