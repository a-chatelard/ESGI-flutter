part of 'note_detail_bloc.dart';

abstract class NoteDetailState extends Equatable {
  const NoteDetailState();
  
  @override
  List<Object> get props => [];
}

class NoteDetailInitial extends NoteDetailState {}
