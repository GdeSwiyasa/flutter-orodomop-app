import 'package:flutter/material.dart';
import 'package:orodomop_app/data/models/notes.dart';
import 'package:orodomop_app/presentation/provider/notes_db_provider.dart';
import 'package:provider/provider.dart';

import '../../../common/constant.dart';

class AddNotePage extends StatefulWidget {
  static const route = '/add_note_screen';

  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  final TextEditingController _titleControl = TextEditingController();
  final TextEditingController _contentControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              if (_titleControl.text.isEmpty) {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Subject is empty'),
                    content: const Text('You have to fill in the subject name'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context, 'OK');
                        },
                        child: const Text(
                          'OK',
                          style: TextStyle(color: kPrimaryColor),
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                final notes = NotesTable(
                  title: _titleControl.text,
                  contents: _contentControl.text,
                );
                Provider.of<NotesDatabaseProvider>(context, listen: false)
                    .insertNote(notes);
                Navigator.pop(context);

                final msg =
                    Provider.of<NotesDatabaseProvider>(context, listen: false)
                        .noteMsg;

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(msg),
                    duration: Duration(seconds: 2),
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    backgroundColor: kPrimaryColor,
                  ),
                );
              }
            },
            icon: const Icon(Icons.done),
          )
        ],
        centerTitle: true,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            'Create Note',
            style: kHeading5.copyWith(color: blackColor),
          ),
        ),
        backgroundColor: whiteColor,
        iconTheme: const IconThemeData(color: kPrimaryColor),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 16),
              Text(
                'Subject',
                style: kHeading5,
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _titleControl,
                decoration: InputDecoration(
                  hintText: 'Add subject',
                  hintStyle: kBodyText.copyWith(color: Colors.grey),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: blackColor, width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: blackColor, width: 1),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'To-do',
                style: kHeading5,
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _contentControl,
                cursorColor: blackColor,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                  hintText: 'Add what you supposed to do',
                  hintStyle: kBodyText.copyWith(color: Colors.grey),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: blackColor, width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: blackColor, width: 1),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
