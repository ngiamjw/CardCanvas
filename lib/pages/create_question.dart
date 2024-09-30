import 'package:flashcard_app/database_class/folder.dart';
import 'package:flashcard_app/database/flashcard_database.dart';
import 'package:flashcard_app/pages/create_answer.dart';
import 'package:flashcard_app/pages/draw_question.dart';
import 'package:flashcard_app/pages/folder_page.dart';
import 'package:flashcard_app/util/create_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateQuestiionPage extends StatefulWidget {
  final bool createOrEdit;
  final int flashcard_id;
  final Folder folder;
  const CreateQuestiionPage(
      {super.key,
      required this.createOrEdit,
      required this.flashcard_id,
      required this.folder});
  @override
  _CreateQuestiionPageState createState() => _CreateQuestiionPageState();
}

class _CreateQuestiionPageState extends State<CreateQuestiionPage> {
  final _questionController = TextEditingController();

  @override
  void dispose() {
    _questionController.dispose();
    super.dispose();
  }

  void onDraw() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DrawingRoomQuestion(
                  createOrEdit: widget.createOrEdit,
                  flashcard_id: widget.flashcard_id,
                  folder: widget.folder,
                )));
  }

  void onCancel() {
    Navigator.pop(context);
    context
        .read<FlashcardDatabase>()
        .deleteFlashcard(widget.flashcard_id, widget.folder.id);
  }

  void onNext() async {
    if (_questionController.text == "") {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Cannot save empty flashcard',
            style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary,
            ), // Change text color
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
      int flashdata_id = await context
          .read<FlashcardDatabase>()
          .addFlashData(_questionController.text, 0);

      context
          .read<FlashcardDatabase>()
          .editFlashcard(widget.flashcard_id, flashdata_id, 0);

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CreateAnswerPage(
                    createOrEdit: widget.createOrEdit,
                    flashcard_id: widget.flashcard_id,
                    folder: widget.folder,
                  )));
    }
  }

  @override
  Widget build(BuildContext context) {
    return CreateText(
        onDraw: onDraw,
        questionController: _questionController,
        onCancel: onCancel,
        onNext: onNext,
        left: "Cancel",
        right: "Next");
  }
}
