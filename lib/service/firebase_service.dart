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
      List<Note> notes = [];
      for (var docs in query.docs) {
        notes.add(Note.fromJson(docs.data(), docs.id));
      }
      return notes;
    } catch (e) {
      return null;
    }
  }

  authenticate(String u, String p) async {}

  deleteNote(Note n) async {
    try {
      await FirebaseFirestore.instance
          .collection('notes')
          .doc(n.docId)
          .delete();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  addNote(Note n) async {
    try {
      await FirebaseFirestore.instance.collection('notes').add(n.toJson());
    } catch (e) {
      print(e);
    }
  }

  updateNote(Note n) async {
    try {
      print(n.title);
      print(n.docId);
        await FirebaseFirestore.instance
            .collection('notes')
            .doc(n.docId)
            .update(n.toJson());

    } catch (e) {
      print(e);
    }
  }
}
