import 'package:esgiflutter/app/config/config.dart';
import 'package:esgiflutter/app/modules/forms/bloc/form_bloc.dart';
import 'package:esgiflutter/app/modules/forms/validation/field_error.dart';
import 'package:esgiflutter/app/modules/notes/bloc/note_bloc.dart';
import 'package:esgiflutter/app/modules/notes/data/models/note.dart';
import 'package:esgiflutter/core/di/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateNoteForm extends StatelessWidget {
  CreateNoteForm({Key? key}) : super(key: key);

  final NoteBloc noteBloc = locator<NoteBloc>();
  final FormBloc formBloc = locator<FormBloc>();

  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  _createNote() {
    if (noteBloc.state is! NoteLoadingState) {
      var note = Note(
          title: _titleController.text,
          description: _descriptionController.text);
      noteBloc.add(CreateNoteEvent(note));
    }
  }

  _validateForm() {
    formBloc.add(NoteFormSubmittedEvent(
        _titleController.text, _descriptionController.text));
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<NoteBloc, NoteState>(listener: ((context, state) {
          if (state is NoteCreatedState) {
            Navigator.pop(context);
          }
        })),
        BlocListener<FormBloc, AppFormState>(listener: ((context, state) {
          if (state is ValidFormState) {
            _createNote();
          }
        })),
      ],
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
                ),
              ),
              BlocBuilder<FormBloc, AppFormState>(builder: ((context, state) {
                if (state is InvalidFormState) {
                  if (state.fieldsError.containsKey("title")) {
                    if (state.fieldsError["title"] == FieldError.empty) {
                      return Text("Title cannot be empty");
                    }
                  }
                }
                return const Text("");
              })),
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
              ElevatedButton(
                  onPressed: _validateForm, child: const Text("Create"))
            ],
          ),
        ),
      ),
    );
  }
}
