import 'package:esgiflutter/app/modules/notes/data/models/note.dart';
import 'package:esgiflutter/app/modules/notes/data/providers/firestore_note_provider.dart';

class NoteRepository {
  final FirestoreNoteProvider _provider = FirestoreNoteProvider();

  add(Note note) async {
    await _provider.addNote(note);
  }

  update(Note note ) async {
    await _provider.updateNote(note);
  }

  delete(Note note) async {
    await _provider.deleteNote(note);

  }

  Future<List<Note>> getNotes() async {
    return await _provider.getNotes();
  }
}