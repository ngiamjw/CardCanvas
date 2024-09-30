import 'package:flashcard_app/database_class/drawingdata.dart';
import 'package:flashcard_app/database_class/folder.dart';
import 'package:flashcard_app/database/flashcard_database.dart';
import 'package:flashcard_app/class/drawing_pointer.dart';
import 'package:flashcard_app/pages/folder_page.dart';
import 'package:flashcard_app/class/custom_painter.dart';
import 'package:flashcard_app/util/brush_size.dart';
import 'package:flashcard_app/util/color_palette.dart';
import 'package:flashcard_app/util/create_draw.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';

class DrawingRoomAnswer extends StatefulWidget {
  final int flashcard_id;
  final Folder folder;
  const DrawingRoomAnswer(
      {super.key, required this.flashcard_id, required this.folder});

  @override
  State<DrawingRoomAnswer> createState() => _DrawingRoomAnswerState();
}

class _DrawingRoomAnswerState extends State<DrawingRoomAnswer> {
  var avaiableColor = [
    Colors.black,
    Colors.red,
    Colors.amber,
    Colors.blue,
    Colors.green,
    Colors.brown,
  ];

  var historyDrawingPoints = <DrawingPointer>[];
  var drawingPoints = <DrawingPointer>[];

  var selectedColor = Colors.black;
  var selectedWidth = 2.0;

  DrawingPointer? currentDrawingPoint;

  Map<String, List<double>> convertOffsetsToXYLists(List<Offset> offsets) {
    List<double> xCoordinates = [];
    List<double> yCoordinates = [];

    for (Offset offset in offsets) {
      xCoordinates.add(offset.dx);
      yCoordinates.add(offset.dy);
    }

    return {
      'x': xCoordinates,
      'y': yCoordinates,
    };
  }

  void onCancelAnswer() {
    Navigator.pop(context);
  }

  void onNextAnswer() async {
    if (historyDrawingPoints == []) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Cannot save empty flashcard',
            style: TextStyle(
                color: Theme.of(context)
                    .colorScheme
                    .inversePrimary), // Change text color
          ),
          backgroundColor: Theme.of(context)
              .colorScheme
              .secondary, // Change background color
          duration: const Duration(
              seconds:
                  2), // Optional: controls how long the SnackBar is displayed
        ),
      );
    } else {
      List<DrawingPoint> drawingPoints = [];
      for (int i = 0; i < historyDrawingPoints.length; i++) {
        DrawingPointer drawingPointer = historyDrawingPoints[i];

        Map<String, List<double>> offsetdata =
            convertOffsetsToXYLists(drawingPointer.offsets);

        DrawingPoint drawingPoint = DrawingPoint()
          ..color = drawingPointer.color.value
          ..width = drawingPointer.width
          ..x = offsetdata['x']!
          ..y = offsetdata['y']!;

        drawingPoints.add(drawingPoint);
      }
      int id = await context
          .read<FlashcardDatabase>()
          .createDrawingData(drawingPoints);
      historyDrawingPoints.clear();

      int flashdata_id =
          await context.read<FlashcardDatabase>().addFlashData("", id);

      context
          .read<FlashcardDatabase>()
          .editFlashcard(widget.flashcard_id, 0, flashdata_id);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => FolderPage(folder: widget.folder)));
    }
  }

  void onPanEnd(DragEndDetails details) {
    currentDrawingPoint = null;
  }

  void onPanStart(DragStartDetails details) {
    setState(() {
      double x = details.localPosition.dx.clamp(32.0, 378.0);
      double y = details.localPosition.dy.clamp(53.0, 250.0);
      currentDrawingPoint = DrawingPointer(
        id: DateTime.now().microsecondsSinceEpoch,
        offsets: [
          Offset(x, y),
        ],
        color: selectedColor,
        width: selectedWidth,
      );

      if (currentDrawingPoint == null) return;
      drawingPoints.add(currentDrawingPoint!);
      historyDrawingPoints = List.of(drawingPoints);
    });
  }

  void onPanUpdate(DragUpdateDetails details) {
    setState(() {
      double x = details.localPosition.dx.clamp(32.0, 378.0);
      double y = details.localPosition.dy.clamp(53.0, 250.0);
      if (currentDrawingPoint == null) return;

      currentDrawingPoint = DrawingPointer(
        id: currentDrawingPoint!.id,
        offsets: currentDrawingPoint!.offsets..add(Offset(x, y)),
        color: selectedColor,
        width: selectedWidth,
      );
      drawingPoints.last = currentDrawingPoint!;
      historyDrawingPoints = List.of(drawingPoints);
    });
  }

  void changeColor(int index) {
    setState(() {
      selectedColor = avaiableColor[index];
    });
  }

  void changeBrushSize(double size) {
    setState(() {
      selectedWidth = size;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: null,
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          actions: [
            ColorPalette(
                avaiableColor: avaiableColor,
                onTap: changeColor,
                selectedColor: selectedColor),
          ],
        ),
        body: Stack(children: [
          /// Canvas
          DrawTile(
              left: "Back",
              onCancel: onCancelAnswer,
              onNext: onNextAnswer,
              onPanEnd: onPanEnd,
              onPanStart: onPanStart,
              onPanUpdate: onPanUpdate,
              right: "Save",
              drawingPoints: drawingPoints),

          BrushSize(selectedWidth: selectedWidth, onChanged: changeBrushSize)
        ]));
  }
}
