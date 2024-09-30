import 'package:flashcard_app/database_class/flashcard.dart';
import 'package:flashcard_app/database_class/folder.dart';
import 'package:flashcard_app/database/flashcard_database.dart';
import 'package:flashcard_app/pages/draw_answer.dart';
import 'package:flashcard_app/pages/folder_page.dart';
import 'package:flashcard_app/util/create_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateAnswerPage extends StatefulWidget {
  final bool createOrEdit;
  final Folder folder;
  final int flashcard_id;
  const CreateAnswerPage(
      {super.key,
      required this.createOrEdit,
      required this.folder,
      required this.flashcard_id});
  @override
  _CreateAnswerPageState createState() => _CreateAnswerPageState();
}

class _CreateAnswerPageState extends State<CreateAnswerPage> {
  final _answerController = TextEditingController();

  @override
  void dispose() {
    _answerController.dispose();
    super.dispose();
  }

  void onDraw() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DrawingRoomAnswer(
                  flashcard_id: widget.flashcard_id,
                  folder: widget.folder,
                )));
  }

  void onCancel() {
    Navigator.pop(context);
    _answerController.clear();
  }

  void onNext() async {
    if (_answerController.text != "") {
      int flashdata_id = await context
          .read<FlashcardDatabase>()
          .addFlashData(_answerController.text, 0);

      context
          .read<FlashcardDatabase>()
          .editFlashcard(widget.flashcard_id, 0, flashdata_id);

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => FolderPage(folder: widget.folder)));
    } else {
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
          duration: Duration(
              seconds:
                  2), // Optional: controls how long the SnackBar is displayed
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return CreateText(
      onDraw: onDraw,
      questionController: _answerController,
      onCancel: onCancel,
      onNext: onNext,
      left: "Back",
      right: "Save",
    );
  }
}
