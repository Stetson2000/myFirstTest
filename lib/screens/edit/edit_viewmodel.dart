import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:map_exam/models/note.dart';
import 'package:map_exam/screens/homepage/home_viewmodel.dart';
import 'package:map_exam/service/firebase_service.dart';

enum NoteType { view, edit, add }

class EditViewModel extends GetxController {
  late Note? note;
  late NoteType noteType;
  late TextEditingController titleController;
  late TextEditingController descriptionController;

  FireBaseApi fireBaseApi = FireBaseApi();

  EditViewModel(List l) {
    note = l[0];
    noteType = l[1];
  }

  @override
  void onInit() {
    if (noteType == NoteType.add) {
      titleController = TextEditingController();
      descriptionController = TextEditingController();
    } else {
      titleController = TextEditingController(text: note?.title ?? '');
      descriptionController = TextEditingController(text: note?.content ?? '');
    }
    super.onInit();
  }

  @override
  void onClose() {
    titleController.dispose();
    descriptionController.dispose();
    super.onClose();
  }

  get appBarTitle => noteType == NoteType.view
      ? 'View Note'
      : noteType == NoteType.edit
          ? 'Edit Note'
          : noteType == NoteType.add
              ? 'Add new Note'
              : null;

  bool get showAddButton => noteType == NoteType.view ? false : true;
  bool get readOnly => noteType == NoteType.view ? true : false;

  addOrUpdate(BuildContext ctx) async {
    final newNote = Note(
        title: titleController.text,
        content: descriptionController.text,
        docId: note?.docId,
        id: Get.find<HomePageViewModel>().uuid);
    if (noteType == NoteType.add) {
      await fireBaseApi.addNote(newNote);
    } else if (noteType == NoteType.edit) {
      await fireBaseApi.updateNote(newNote);
    }
    await Get.find<HomePageViewModel>().loadUserNotes();
    Navigator.of(ctx).pop();
  }
}
