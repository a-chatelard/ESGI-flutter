import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:esgiflutter/app/modules/auth/data/providers/firebase_auth_provider.dart';
import 'package:esgiflutter/app/modules/notes/data/repository/note_repository.dart';

import '../data/models/note.dart';

part 'note_event.dart';
part 'note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  final NoteRepository noteRepository = NoteRepository();
  
  NoteBloc() : super(InitialNoteState()) {
    on<CreateNoteEvent>((event, emit) async {
      emit(NoteLoadingState());
      try {
        await noteRepository.add(event.note);
        emit(NoteCreatedState());
      } catch (e) {
        emit(NoteErrorState(e.toString()));
      }
    });
    on<UpdateNoteEvent>((event, emit) async {
      try {
        await noteRepository.update(event.note);
        emit(NoteUpdatedState());
      } catch (e) {
        emit(NoteErrorState(e.toString()));
      }
    });
    on<GetAllNotesEvent>((event, emit) async {
      try {
        var notes = await noteRepository.getNotes();
        emit(NoteListSuccessState(notes));
      } catch (e) {
        emit(NoteErrorState(e.toString()));
      }
    });
  }
}
