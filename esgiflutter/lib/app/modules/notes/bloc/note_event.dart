part of 'note_bloc.dart';

abstract class NoteEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class CreateNoteEvent extends NoteEvent {
  final Note note;

  CreateNoteEvent(this.note);
}

class UpdateNoteEvent extends NoteEvent {
  final Note note;

  UpdateNoteEvent(this.note);
}

class DeleteNoteEvent extends NoteEvent {
  final Note note;

  DeleteNoteEvent(this.note);
}

class GetAllNotesEvent extends NoteEvent {
  @override
  List<Object> get props => [];
}