import 'package:flutter/material.dart';

class DialogConfirmation extends StatelessWidget {
  const DialogConfirmation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      title: Text('Please confirm'),
      content: Text("Souhaitez vous supprimer la note suivant ?"),
    );
  }
}
