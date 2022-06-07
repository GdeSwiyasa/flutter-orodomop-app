import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:orodomop_app/common/locale/locale_keys.g.dart';
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
                    title: Text(LocaleKeys.note_msg.tr()),
                    content: Text(LocaleKeys.note_msg_content.tr()),
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
            style: kHeading5.copyWith(color: Theme.of(context).primaryColor),
          ),
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
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
                  hintText: LocaleKeys.note_subject.tr(),
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
                  hintText: LocaleKeys.note_todo.tr(),
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
