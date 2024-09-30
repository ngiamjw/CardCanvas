import 'package:flutter/material.dart';

class DrawingPointer {
  int id;
  List<Offset> offsets;
  Color color;
  double width;

  DrawingPointer({
    this.id = -1,
    this.offsets = const [],
    this.color = Colors.black,
    this.width = 2,
  });

  // DrawingPoint copyWith({List<Offset>? offsets}) {
  //   return DrawingPoint(
  //     id: id,
  //     color: color,
  //     width: width,
  //     offsets: offsets ?? this.offsets,
  //   );
  // }
}
