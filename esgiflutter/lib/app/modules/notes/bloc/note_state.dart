part of 'note_bloc.dart';

abstract class NoteState extends Equatable {
  const NoteState();
  
  @override
  List<Object> get props => [];
}

class InitialNoteState extends NoteState {
  @override
  List<Object> get props => [];
}

class NoteCreatedState extends NoteState {
  @override
  List<Object> get props => [];
}

class NoteUpdatedState extends NoteState {
  @override
  List<Object> get props => [];
}

class NoteDeletedState extends NoteState {
  @override
  List<Object> get props => [];
}

class NoteLoadingState extends NoteState {
  @override
  List<Object> get props => [];
}

class NoteErrorState extends NoteState {
  final String error;

  const NoteErrorState(this.error);

  @override
  List<Object> get props => [error];
}

class NoteListSuccessState extends NoteState {
  final List<Note> notes;

  const NoteListSuccessState(this.notes);

  @override
  List<Object> get props => [notes];
}
