import 'package:flashcard_app/class/custom_painter.dart';
import 'package:flashcard_app/class/drawing_pointer.dart';
import 'package:flutter/material.dart';

class DrawTile extends StatefulWidget {
  Function(DragStartDetails)? onPanStart;
  Function(DragUpdateDetails)? onPanUpdate;
  Function(DragEndDetails)? onPanEnd;
  Function()? onCancel;
  Function()? onNext;
  final String left;
  final String right;
  List<DrawingPointer> drawingPoints;
  DrawTile(
      {super.key,
      required this.left,
      required this.onCancel,
      required this.onNext,
      required this.onPanEnd,
      required this.onPanStart,
      required this.onPanUpdate,
      required this.right,
      required this.drawingPoints});

  @override
  State<DrawTile> createState() => _DrawTileState();
}

class _DrawTileState extends State<DrawTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanStart: (details) {
        widget.onPanStart!(details);
      },
      onPanUpdate: (details) {
        widget.onPanUpdate!(details);
      },
      onPanEnd: (details) {
        widget.onPanEnd!(details);
      },
      child: CustomPaint(
          foregroundPainter: DrawingPainter(
            drawingPoints: widget.drawingPoints,
          ),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                Center(
                  child: Text("question"),
                ),
                Container(
                  height: 200,
                  width: 400,
                  padding: EdgeInsets.all(16.0),
                  margin: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: widget.onCancel,
                      child: Text(
                        widget.left,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: widget.onNext,
                      child: Text(
                        widget.right,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
