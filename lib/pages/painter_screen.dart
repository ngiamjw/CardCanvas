import 'package:flashcard_app/database_class/drawingdata.dart';
import 'package:flashcard_app/class/drawing_pointer.dart';
import 'package:flutter/material.dart';

class PainterScreen extends StatelessWidget {
  final List<DrawingPoint> drawingpoints;
  final Color backgroundcolor;
  const PainterScreen(
      {super.key, required this.drawingpoints, required this.backgroundcolor});

  List<DrawingPointer> convertDrawingPointsToPointers(
      List<DrawingPoint> drawingPoints) {
    final List<DrawingPointer> result = [];
    for (int i = 0; i < drawingPoints.length; i++) {
      final drawingPoint = drawingPoints[i];
      result.add(DrawingPointer(
        id: i,
        offsets: List.generate(
          drawingPoint.x.length,
          (j) => Offset(drawingPoint.x[j] - 15.0, drawingPoint.y[j] - 35.0),
        ),
        color: Color(drawingPoint.color),
        width: drawingPoint.width,
      ));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    List<DrawingPointer> drawingpointers =
        convertDrawingPointsToPointers(drawingpoints);
    return CustomPaint(
        foregroundPainter: DrawingPainter(
          drawingPoints: drawingpointers,
        ),
        child: Container(
          height: 200,
          width: 400,
          padding: EdgeInsets.all(16.0),
          margin: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 8.0,
                offset: Offset(0, 4),
              ),
            ],
          ),
        ));
  }
}

class DrawingPainter extends CustomPainter {
  final List<DrawingPointer> drawingPoints;

  DrawingPainter({required this.drawingPoints});

  @override
  void paint(Canvas canvas, Size size) {
    for (var drawingPoint in drawingPoints) {
      final paint = Paint()
        ..color = drawingPoint.color
        ..isAntiAlias = true
        ..strokeWidth = drawingPoint.width
        ..strokeCap = StrokeCap.round;

      for (var i = 0; i < drawingPoint.offsets.length; i++) {
        var notLastOffset = i != drawingPoint.offsets.length - 1;

        if (notLastOffset) {
          final current = drawingPoint.offsets[i];
          final next = drawingPoint.offsets[i + 1];
          canvas.drawLine(current, next, paint);
        } else {
          /// we do nothing
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
