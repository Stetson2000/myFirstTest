import 'package:get/get.dart';
import 'package:map_exam/models/note.dart';
import 'package:map_exam/service/firebase_service.dart';

class HomePageViewModel extends GetxController {
  late String uuid;
  HomePageViewModel(this.uuid);
  FireBaseApi fireBaseApi = FireBaseApi();

  List<Note>? notes;

  @override
  void onInit() async {
    notes = (await fireBaseApi.loadUserNotes(uuid))!;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    update();
  }

  get notedLength => notes?.length?? 0;
}
