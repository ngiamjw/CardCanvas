import 'package:flutter/material.dart';

class ColorPalette extends StatefulWidget {
  final List<Color> avaiableColor;
  Function(int)? onTap;
  Color selectedColor;
  ColorPalette(
      {super.key,
      required this.avaiableColor,
      required this.onTap,
      required this.selectedColor});

  @override
  State<ColorPalette> createState() => _ColorPaletteState();
}

class _ColorPaletteState extends State<ColorPalette> {
  @override
  Widget build(BuildContext context) {
    return
        //  Positioned(
        // MediaQuery.of(context).padding.top,
        // right: 16,
        // left: 150,
        // bottom: 800,
        // child:
        Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 40,
      width: 240,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: widget.avaiableColor.length,
        separatorBuilder: (_, __) {
          return Container(width: 4);
        },
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              widget.onTap!(index);
            },
            child: Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                color: widget.avaiableColor[index],
                shape: BoxShape.circle,
              ),
              foregroundDecoration: BoxDecoration(
                border: widget.selectedColor == widget.avaiableColor[index]
                    ? Border.all(
                        color: Theme.of(context).colorScheme.primary, width: 4)
                    : null,
                shape: BoxShape.circle,
              ),
            ),
          );
        },
      ),
    );
    // );
  }
}
