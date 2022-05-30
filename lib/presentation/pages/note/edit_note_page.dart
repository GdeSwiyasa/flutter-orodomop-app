import 'package:flutter/material.dart';
import 'package:orodomop_app/data/models/notes.dart';
import 'package:orodomop_app/presentation/provider/notes_db_provider.dart';
import 'package:provider/provider.dart';

import '../../../common/constant.dart';

class EditNotePage extends StatefulWidget {
  static const route = '/edit_note_screen';

  final NotesTable? notes;

  EditNotePage({required this.notes});

  @override
  State<EditNotePage> createState() => _EditNotePageState();
}

class _EditNotePageState extends State<EditNotePage> {
  TextEditingController _titleControl = TextEditingController();
  TextEditingController _contentControl = TextEditingController();

  @override
  void initState() {
    if (widget.notes != null) {
      _titleControl.text = widget.notes!.title;
      _contentControl.text = widget.notes!.contents;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actionsIconTheme: const IconThemeData(
          size: 20,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<NotesDatabaseProvider>(context, listen: false)
                  .deleteNote(widget.notes!.id!);
              Navigator.pop(context);
            },
            icon: const Icon(Icons.delete_outline_rounded),
          ),
          IconButton(
            onPressed: () {
              final notes = NotesTable(
                id: widget.notes!.id,
                title: _titleControl.text,
                contents: _contentControl.text,
              );
              Provider.of<NotesDatabaseProvider>(context, listen: false)
                  .updateNotes(notes);
              Navigator.pop(context);
            },
            icon: const Icon(Icons.done),
          )
        ],
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            'Your Note',
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
              const Text('Subject'),
              const SizedBox(height: 32),
              TextField(
                controller: _titleControl,
                decoration: InputDecoration(
                  hintText: 'Add subject',
                  hintStyle: const TextStyle(fontSize: 12, color: Colors.grey),
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
              const SizedBox(height: 32),
              const Text('To-do'),
              const SizedBox(height: 32),
              TextField(
                controller: _contentControl,
                cursorColor: blackColor,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                  hintText: 'Add what you supossed to do',
                  hintStyle: const TextStyle(fontSize: 12, color: Colors.grey),
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
