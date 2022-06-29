import 'package:esgiflutter/app/config/config.dart';
import 'package:esgiflutter/app/modules/notes/bloc/note_bloc.dart';
import 'package:esgiflutter/app/modules/notes/data/models/note.dart';
import 'package:esgiflutter/core/di/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class NoteDetailsScreen extends StatelessWidget {
  NoteDetailsScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  late Note note;

  final noteBloc = locator<NoteBloc>();

  _updateNote() {
    note.description = _descriptionController.text;
    note.title = _titleController.text;

    noteBloc.add(UpdateNoteEvent(note));
  }

  @override
  Widget build(BuildContext context) {
    note = ModalRoute.of(context)!.settings.arguments as Note;
    _titleController.text = note.title;
    _descriptionController.text = note.description;

    return BlocListener<NoteBloc, NoteState>(
      listener: ((context, state) {
        if (state is NoteUpdatedState) {
          Navigator.pop(context);
        }
      }),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Modifier la note"),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 2.h, left: 4.h, right: 4.h),
          child: Form(
            key: _formKey,
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
                    onPressed: _updateNote, child: const Text("Update"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
