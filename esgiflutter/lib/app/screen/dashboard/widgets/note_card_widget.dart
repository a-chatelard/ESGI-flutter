
import 'package:esgiflutter/app/app_routes.dart';
import 'package:esgiflutter/app/modules/notes/data/models/note.dart';
import 'package:esgiflutter/app/screen/note_details/note_details_screen.dart';
import 'package:flutter/material.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({
    required this.note,
    Key? key,
  }) : super(key: key);

  final Note note;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        Navigator.pushNamed(context, notedetailsRoute, arguments: note);
      }),
      child: Card(
        color: Colors.black,
        child: ListTile(
          title: Text(
            note.title,
            style: const TextStyle(color: Colors.white),
          ),
          leading: const Icon(
            Icons.note,
            color: Colors.white,
          ),
          trailing: const Text('5'),
        ),
      ),
    );
  }
}