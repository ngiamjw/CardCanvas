import 'package:flutter/material.dart';

class BrushSize extends StatefulWidget {
  double selectedWidth;
  Function(double)? onChanged;
  BrushSize({super.key, required this.selectedWidth, required this.onChanged});

  @override
  State<BrushSize> createState() => _BrushSizeState();
}

class _BrushSizeState extends State<BrushSize> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).padding.top + 80,
      right: 0,
      bottom: 150,
      child: RotatedBox(
        quarterTurns: 3, // 270 degree
        child: Slider(
          value: widget.selectedWidth,
          min: 1,
          max: 20,
          onChanged: (value) {
            widget.onChanged!(value);
            // setState(() {
            //   selectedWidth = value;
            // });
          },
        ),
      ),
    );
  }
}
