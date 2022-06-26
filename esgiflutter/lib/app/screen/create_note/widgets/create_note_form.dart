import 'package:esgiflutter/app/config/config.dart';
import 'package:esgiflutter/app/modules/notes/bloc/note_bloc.dart';
import 'package:esgiflutter/app/modules/notes/data/models/note.dart';
import 'package:esgiflutter/core/di/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateNoteForm extends StatelessWidget {
  CreateNoteForm({Key? key, this.folderId}) : super(key: key);

  NoteBloc noteBloc = locator<NoteBloc>();

  String? folderId;
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  void _createNote() {
    if (noteBloc.state is !NoteLoadingState) {
      var note = Note(title: _titleController.text, description: _descriptionController.text, folderId: folderId);
      noteBloc.add(CreateNoteEvent(note));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<NoteBloc, NoteState>(
      listener: ((context, state) => {
        if (state is NoteCreatedState) {
          Navigator.pop(context)
        }
      }),
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultPadding),
          child: Column(
            children: [
              TextField(
                controller: _titleController,
                maxLength: 35,
                decoration: const InputDecoration(
                  hintText: 'Titre de la note',
                  focusedBorder: OutlineInputBorder(),
                  border: InputBorder.none,
                ),
              ),
              TextField(
                controller: _descriptionController,
                maxLines: 20,
                maxLength: 100,
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Saisir une note",
                    focusedBorder: OutlineInputBorder()),
              ),
              ElevatedButton(onPressed: _createNote, child: const Text("Create"))
            ],
          ),
        ),
      ),
    );
  }
}