import 'package:esgiflutter/app/app_routes.dart';
import 'package:esgiflutter/app/config/config.dart';
import 'package:esgiflutter/app/screen/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';

class NoteDetailScreen extends StatelessWidget {
  const NoteDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nouvelle note'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, dashboardRoute);
            },
            icon: Icon(Icons.save),
            color: blackColor,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: defaultPadding),
        child: Column(
          children: const [
            TextField(
              maxLength: 35,
              decoration: InputDecoration(
                hintText: 'Titre de la note',
                focusedBorder: OutlineInputBorder(),
                border: InputBorder.none,
              ),
            ),
            TextField(
              maxLines: 23,
              maxLength: 300,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Saisir une note",
                  focusedBorder: OutlineInputBorder()),
            )
          ],
        ),
      ),
    );
  }
}
