import 'package:get/get.dart';
import 'package:map_exam/models/note.dart';
import 'package:map_exam/service/firebase_service.dart';

class HomePageViewModel extends GetxController {
  late String uuid;
  HomePageViewModel(this.uuid);
  FireBaseApi fireBaseApi = FireBaseApi();

  List<Note>? notes;
  bool showNotes = true;

  Note? selectedNote;

  @override
  void onInit() async {
    await loadUserNotes();
    super.onInit();
  }

  selectNote(Note n) {
    selectedNote = n;
    update();
  }

  isSelected(Note n) => selectedNote == n;
  loadUserNotes() async {
    notes = (await fireBaseApi.loadUserNotes(uuid))!;
    update();
  }

  toggleShowNotes() {
    showNotes = !showNotes;
    update();
  }

  get notedLength => notes?.length ?? 0;
}
