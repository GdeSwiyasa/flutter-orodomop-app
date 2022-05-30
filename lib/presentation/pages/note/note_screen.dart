import 'package:flutter/material.dart';
import 'package:orodomop_app/common/constant.dart';
import 'package:orodomop_app/presentation/pages/note/add_note_page.dart';
import 'package:orodomop_app/presentation/pages/note/edit_note_page.dart';
import 'package:orodomop_app/presentation/provider/notes_db_provider.dart';
import 'package:orodomop_app/presentation/widgets/app_bar.dart';
import 'package:provider/provider.dart';

class NoteScreen extends StatefulWidget {
  static const route = '/note_screen';

  const NoteScreen({Key? key}) : super(key: key);

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        heroTag: null,
        onPressed: () {
          Navigator.of(context, rootNavigator: true)
              .pushNamed(AddNotePage.route);
        },
        child: const Icon(Icons.add),
        backgroundColor: kPrimaryColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: buildAppBar(
        title: 'Note',
        appBar: AppBar(),
      ),
      body: Consumer<NotesDatabaseProvider>(
        builder: (context, db, child) {
          final noteList = db.notes;
          if (noteList.isNotEmpty) {
            return ListView.separated(
              itemBuilder: (context, index) {
                final notes = noteList[index];
                return Card(
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(15)),
                    padding: const EdgeInsets.only(
                        top: 8, right: 24, left: 24, bottom: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(notes.title),
                        IconButton(
                          onPressed: () async {
                            final selectedNote =
                                await db.getNoteById(notes.id!);
                            Navigator.pushNamed(context, EditNotePage.route,
                                arguments: selectedNote);
                          },
                          icon: const Icon(
                            Icons.edit,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
              itemCount: noteList.length,
              padding: const EdgeInsets.all(16),
              separatorBuilder: (context, index) => const Divider(height: 16),
            );
          } else {
            return const Center(
              child: Text(
                'You have not make a note yet',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
