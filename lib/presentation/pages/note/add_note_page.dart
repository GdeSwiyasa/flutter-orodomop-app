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
              final notes = NotesTable(
                title: _titleControl.text,
                contents: _contentControl.text,
              );
              Provider.of<NotesDatabaseProvider>(context, listen: false)
                  .insertNote(notes);
              Navigator.pop(context);
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
        iconTheme: const IconThemeData(color: blackColor),
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
                  hintText: 'Add what you supossed to do',
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
