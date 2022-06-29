import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esgiflutter/app/modules/notes/data/models/note.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreNoteProvider {
  String? _userId;
  final CollectionReference notesRef =
      FirebaseFirestore.instance.collection("user_notes");

  Future addNote(Note note) async {
    _userId = FirebaseAuth.instance.currentUser?.uid;
    return notesRef.doc(_userId).collection("notes").add(note.toJson());
  }

  Future<List<Note>> getNotes() async {
    _userId = FirebaseAuth.instance.currentUser?.uid;

    var notesCollection = await notesRef.doc(_userId).collection("notes").get();

    var notes = <Note>[];

    for (var doc in notesCollection.docs) {
      notes.add(Note.fromJson(doc.id, doc.data()));
    }

    return notes;
  }

  Future updateNote(Note note) async {
    _userId = FirebaseAuth.instance.currentUser?.uid;

    await notesRef
        .doc(_userId)
        .collection("notes")
        .doc(note.id)
        .update(note.toJson());
  }

  Future deleteNote(Note note) async {
    _userId = FirebaseAuth.instance.currentUser?.uid;
    await notesRef.doc(_userId).collection("notes").doc(note.id).delete();
  }
}
