// ignore_for_file: prefer_const_constructors

import 'package:flashcard_app/database_class/drawingdata.dart';
import 'package:flashcard_app/database_class/flashcard.dart';
import 'package:flashcard_app/database_class/flashdata.dart';
import 'package:flashcard_app/database/flashcard_database.dart';
import 'package:flashcard_app/pages/painter_screen.dart';
import 'package:flashcard_app/util/text_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class FlashCardTile extends StatefulWidget {
  final Color backgroundColor;
  final Flashcard flashcard;
  bool changeQA;
  FlashCardTile(
      {super.key,
      required this.flashcard,
      required this.backgroundColor,
      required this.changeQA});

  @override
  State<FlashCardTile> createState() => _FlashCardTileState();
}

class _FlashCardTileState extends State<FlashCardTile> {
  @override
  Widget build(BuildContext context) {
    // Future<FlashData?> question = context.read<FlashcardDatabase>().readFlashData(widget.flashcard.question_id);
    // Future<FlashData?> answer = context.read<FlashcardDatabase>().readFlashData(widget.flashcard.answer_id);
    return GestureDetector(
        onTap: () {
          // Show flashcard answer
          Future.delayed(Duration(milliseconds: 100), () {
            setState(() {
              widget.changeQA = !widget.changeQA;
            });
          });
        },
        child: widget.changeQA
            ? FlashTile(
                flashcard: widget.flashcard,
                backgroundColor: widget.backgroundColor,
                qa: "question",
                id: widget.flashcard.question_id,
              )
            : FlashTile(
                flashcard: widget.flashcard,
                backgroundColor: widget.backgroundColor,
                qa: "answer",
                id: widget.flashcard.answer_id));
  }
}

class FlashTile extends StatefulWidget {
  final Flashcard flashcard;
  final Color backgroundColor;
  final String qa;
  final int id;
  const FlashTile(
      {super.key,
      required this.flashcard,
      required this.backgroundColor,
      required this.qa,
      required this.id});

  @override
  State<FlashTile> createState() => _FlashTileState();
}

class _FlashTileState extends State<FlashTile> {
  @override
  Future<FlashData?> _fetchFlashData() async {
    final Data =
        await context.read<FlashcardDatabase>().readFlashData(widget.id);
    return Data;
  }

  Widget build(BuildContext context) {
    return FutureBuilder<FlashData?>(
        future: _fetchFlashData(),
        builder: (context, AsyncSnapshot<FlashData?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError || !snapshot.hasData) {
            return Text('Error loading data');
          }
          final flashData = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Stack(
              children: [
                FutureBuilder<DrawingData?>(
                  future: flashData.drawing_id != 0
                      ? context
                          .read<FlashcardDatabase>()
                          .readDrawingData(flashData.drawing_id)
                      : Future.value(null),
                  builder: (context,
                      AsyncSnapshot<DrawingData?> questionDrawingData) {
                    if (questionDrawingData.connectionState ==
                        ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }
                    return flashData.str != ""
                        ? TextContainer(text: flashData.str)
                        : questionDrawingData.hasData
                            ? PainterScreen(
                                drawingpoints:
                                    questionDrawingData.data!.drawn_flashcard,
                                backgroundcolor: widget.backgroundColor)
                            : Text('Question: (No Data)');
                  },
                ),
                Positioned(
                  top: 17,
                  left: 20,
                  child: Text(
                    widget.qa,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.tertiary,
                        fontSize: 12),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
