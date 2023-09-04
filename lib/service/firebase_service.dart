import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:map_exam/models/note.dart';

class FireBaseApi {
  static login() async {}

  Future<UserCredential?> signInWithEmailAndPassword(String u, String p) async {
    try {
      // print(FirebaseAuth.instance.app.toString());

      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: u,
        password: p,
      );
      return userCredential;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<Note>?> loadUserNotes(uuid) async {
    try {
      final query = await FirebaseFirestore.instance
          .collection('notes')
          .where('id', isEqualTo: uuid)
          .get();
      List<Note> messages = [];
      for (var docs in query.docs) {
        messages.add(Note.fromJson(docs.data()));
      }
      return messages;
    } catch (e) {
      return null;
    }
  }

  authenticate(String u, String p) async {}
}
