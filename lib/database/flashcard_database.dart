import 'package:flashcard_app/database_class/drawingdata.dart';
import 'package:flashcard_app/database_class/flashcard.dart';
import 'package:flashcard_app/database_class/flashdata.dart';
import 'package:flashcard_app/database_class/folder.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class FlashcardDatabase extends ChangeNotifier {
  static late Isar isar;
  //SETUP

  //INITIALISE DATABASE
  static Future<void> initialise() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
        [FolderSchema, FlashcardSchema, DrawingDataSchema, FlashDataSchema],
        directory: dir.path);
  }

  final List<Folder> currentFolders = [];

  //ADD FOLDER
  Future<void> addFolder(String FolderName) async {
    //create new habit
    final newFolder = Folder()
      ..name = FolderName
      ..percentage = -1;

    //save to db
    await isar.writeTxn(() => isar.folders.put(newFolder));
    // re-read from db
    readFolders();
  }

  //READ FOLDER
  Future<void> readFolders() async {
    List<Folder> fetchedFolders = await isar.folders.where().findAll();
    currentFolders.clear();
    currentFolders.addAll(fetchedFolders);
    //update UI
    notifyListeners();
  }

  //EDIT FOLDER
  Future<void> editFolder(int id, String newName) async {
    final folder = await isar.folders.get(id);
    if (folder != null) {
      await isar.writeTxn(() async {
        folder.name = newName;
        await isar.folders.put(folder);
      });
    }
    readFolders();
  }

  Future<void> editFolderPercentage(int id, double percentage) async {
    final folder = await isar.folders.get(id);
    if (folder != null) {
      await isar.writeTxn(() async {
        folder.percentage = percentage;
        await isar.folders.put(folder);
      });
    }
    readFolders();
  }

  //DELETE FOLDER
  Future<void> deleteFolder(int id) async {
    final folder = await isar.folders.get(id);
    if (folder != null) {
      await isar.writeTxn(() async {
        // Delete all flashcards in the folder
        await folder.flashcards.load(); // Load the linked flashcards
        for (var flashcard in folder.flashcards) {
          await isar.flashcards.delete(flashcard.id);
        }
        // Delete the folder itself
        await isar.folders.delete(id);
      });
    }
    readFolders(); // Update the folders list to reflect changes
  }

  int flashcard_id = 0;

  //ADD FLASHCARD
  Future<int> addFlashcard(int folderId) async {
    final folder = await isar.folders.get(folderId);
    if (folder != null) {
      final newFlashcard = Flashcard()
        ..answer_id = 0
        ..question_id = 0;

      return await isar.writeTxn(() async {
        int id = await isar.flashcards.put(newFlashcard);
        folder.flashcards.add(newFlashcard);
        await folder.flashcards.save();
        return id;
      });
    }

    readFolders();
    readFlashcards(folderId);
    return 0; // Update the folders list to reflect changes
  }

  final List<Flashcard> currentFlashcard = [];

  //READ FLASHCARD
  // Future<List<Flashcard>> readFlashcards(int folderId) async {
  //   final folder = await isar.folders.get(folderId);
  //   if (folder != null) {
  //     // return folder.flashcards.toList();
  //     currentFlashcard.clear();
  //     currentFlashcard.addAll(folder.flashcards.toList());
  //   }
  //   return [];
  // }

  Future<void> readFlashcards(int folderId) async {
    final folder = await isar.folders.get(folderId);
    if (folder != null) {
      // return folder.flashcards.toList();
      currentFlashcard.clear();
      currentFlashcard.addAll(folder.flashcards.toList());
      notifyListeners();
    }
  }

  // EDIT FLASHCARD
  Future<void> editFlashcard(int id, int newQuestion, int newAnswer) async {
    final flashcard = await isar.flashcards.get(id);
    if (flashcard != null) {
      await isar.writeTxn(() async {
        if (newQuestion != 0) {
          flashcard.question_id = newQuestion;
        } else if (newAnswer != 0) {
          flashcard.answer_id = newAnswer;
        }
        await isar.flashcards.put(flashcard);
      });
    }
    readFolders(); // Update the folders list to reflect changes
  }

  //DELETE FLASHCARD
  Future<void> deleteFlashcard(int id, int folder_id) async {
    final flashcard = await isar.flashcards.get(id);
    await isar.writeTxn(() async {
      await isar.flashcards.delete(id);
    });
    readFolders();
    readFlashcards(folder_id); // Update the folders list to reflect changes
  }

  //CREATE DRAWING POINT
  // Future<void> createDrawingPoint(int drawingDataId, List<double> x,
  //     List<double> y, int color, int width) async {
  //   final drawingData = await isar.drawingDatas.get(drawingDataId);
  //   if (drawingData != null) {
  //     final newDrawingPoint = DrawingPoint()
  //       ..x = x
  //       ..y = y
  //       ..color = color
  //       ..width = width
  //       ..folder.value = drawingData;

  //     await isar.writeTxn(() async {
  //       await isar.drawingPoints.put(newDrawingPoint);
  //       drawingData.drawn_flashcard.add(newDrawingPoint);
  //       await drawingData.drawn_flashcard.save();
  //     });
  //   }
  // }

  int drawingdata_id = 0;

  //CREATE DRAWING DATA
  Future<int> createDrawingData(List<DrawingPoint> drawingpoints) async {
    final newDrawingData = DrawingData()..drawn_flashcard = drawingpoints;

    return await isar.writeTxn(() async {
      return await isar.drawingDatas.put(newDrawingData);
    });

    // Optionally, you can return the ID or other details if needed
  }

  final List<DrawingPoint> currentDrawingPoints = [];

  //READ DRAWING DATA
  Future<DrawingData?> readDrawingData(int drawingdataID) async {
    final drawingData = await isar.drawingDatas.get(drawingdataID);
    // return folder.flashcards.toList();
    return drawingData;
  }

  //EDIT DRAWING DATA
  Future<void> editDrawingData(
    int id,
    /* any parameters to be updated */
  ) async {
    final drawingData = await isar.drawingDatas.get(id);
    if (drawingData != null) {
      await isar.writeTxn(() async {
        // Update drawingData fields here
        await isar.drawingDatas.put(drawingData);
      });
    }
  }

  //DELETE DRAWING DATA
  Future<void> deleteDrawingData(int id) async {
    final drawingData = await isar.drawingDatas.get(id);
    if (drawingData != null) {
      await isar.writeTxn(() async {
        // Delete the drawing data itself
        await isar.drawingDatas.delete(id);
      });
    }
  }

  int flashdata_id = 0;

  //CREATE FLASHDATA
  Future<int> addFlashData(String str, int drawingDataId) async {
    if (drawingDataId != 0) {
      final newFlashData = FlashData()
        ..drawing_id = drawingDataId
        ..str = "";

      return await isar.writeTxn(() async {
        return await isar.flashDatas.put(newFlashData);
      });
    }
    if (str != "") {
      final newFlashData = FlashData()
        ..str = str
        ..drawing_id = 0;

      return await isar.writeTxn(() async {
        return await isar.flashDatas.put(newFlashData);
      });
      // Update the FlashData list to reflect changes
    }
    notifyListeners();

    return 0;
  }

  //READ FLASHDATA
  Future<FlashData?> readFlashData(int id) async {
    FlashData? flashData = await isar.flashDatas.get(id);
    return flashData;
  }

  //EDIT FLASHDATA
  Future<void> editFlashData(
      int id, String? newStr, int? newDrawingDataId) async {
    final flashData = await isar.flashDatas.get(id);
    if (flashData != null) {
      if (newDrawingDataId != null) {
        await isar.writeTxn(() async {
          flashData.drawing_id = newDrawingDataId;
          await isar.flashDatas.put(flashData);
        });
      }
      if (newStr != null) {
        await isar.writeTxn(() async {
          flashData.str = newStr;
          await isar.flashDatas.put(flashData);
        });
      }
    }
    // Update the FlashData list to reflect changes
  }

  //DELETE FLASHDATA
  Future<void> deleteFlashData(int id) async {
    await isar.writeTxn(() async {
      await isar.flashDatas.delete(id);
    });
    // Update the FlashData list to reflect changes
  }
}
