import 'package:esgiflutter/app/app_routes.dart';
import 'package:esgiflutter/app/modules/auth/bloc/auth_bloc.dart';
import 'package:esgiflutter/app/modules/auth/bloc/auth_event.dart';
import 'package:esgiflutter/app/modules/auth/bloc/auth_state.dart';
import 'package:esgiflutter/app/modules/notes/bloc/note_bloc.dart';
import 'package:esgiflutter/app/modules/notes/data/models/note.dart';
import 'package:esgiflutter/app/screen/dashboard/widgets/note_card_widget.dart';
import 'package:esgiflutter/core/di/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:sizer/sizer.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({Key? key}) : super(key: key);

  final AuthBloc authBloc = locator<AuthBloc>();
  final NoteBloc noteBloc = locator<NoteBloc>();

  void _signOut(context) {
    authBloc.add(SignOutRequested());
  }

  void _deleteNote(Note note) {
    noteBloc.add(DeleteNoteEvent(note));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is UnAuthenticated || state is AuthError) {
          Navigator.pushReplacementNamed(context, loginRoute);
        }
      },
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(height: 7.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 7.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Dossiers",
                      style: TextStyle(color: Colors.black, fontSize: 25.0)),
                  SizedBox(height: 1.h),
                  const TextField(
                    decoration: InputDecoration(
                        labelText: 'Recherche',
                        prefixIcon: Icon(Icons.search),
                        suffixIcon: Icon(Icons.mic)),
                  ),
                  SizedBox(height: 1.h),
                  SizedBox(
                    height: 30.h,
                    child: BlocBuilder<NoteBloc, NoteState>(
                        builder: (context, state) {
                      if (state is NoteListSuccessState) {
                        return ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: state.notes.length,
                            itemBuilder: (context, index) {
                              return Slidable(
                                  key: ValueKey(index),
                                  startActionPane: ActionPane(
                                    motion: const ScrollMotion(),
                                    children: [
                                      SlidableAction(
                                          onPressed: (context) {
                                            _deleteNote(state.notes[index]);
                                          },
                                          backgroundColor: Colors.red,
                                          icon: Icons.delete,
                                          label: "Supprimer"),
                                    ],
                                  ),
                                  child: NoteCard(note: state.notes[index]));
                            });
                      } else if (state is NoteErrorState) {
                        return const Text("Error");
                      }
                      noteBloc.add(GetAllNotesEvent());
                      return const CircularProgressIndicator();
                    }),
                  ),
                  /*SizedBox(height: 3.h),
                  ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: [
                      Text('Mes dossiers'),
                      const Card(
                        color: Colors.black,
                        child: ListTile(
                          title: Text(
                            'Mon budget',
                            style: TextStyle(color: Colors.white),
                          ),
                          leading: Icon(
                            Icons.folder,
                            color: Colors.white,
                          ),
                          trailing: Text('5'),
                        ),
                      ),
                      const Card(
                        color: Colors.black,
                        child: ListTile(
                          title: Text(
                            'Exo de musculation',
                            style: TextStyle(color: Colors.white),
                          ),
                          leading: Icon(
                            Icons.folder,
                            color: Colors.white,
                          ),
                          trailing: Text(
                            '5',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      )*/
                  ElevatedButton(
                      onPressed: () {
                        _signOut(context);
                      },
                      child: null)
                ],
              ),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              left: 30,
              bottom: 20,
              child: FloatingActionButton(
                heroTag: 'back',
                onPressed: () {},
                child: const Icon(
                  Icons.create_new_folder,
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              right: 30,
              child: FloatingActionButton(
                heroTag: 'next',
                onPressed: () {
                  Navigator.pushNamed(context, addNoteRoute);
                },
                child: const Icon(
                  Icons.edit_note,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
