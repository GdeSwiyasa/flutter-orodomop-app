import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:orodomop_app/common/locale/locale_keys.g.dart';
import 'package:orodomop_app/data/models/notes.dart';
import 'package:orodomop_app/presentation/provider/dark_theme_provider.dart';
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
    bool isDark = Provider.of<DarkThemeProvider>(context).darkTheme;

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
              Navigator.pop(context);
            },
            icon: const Icon(Icons.delete_outline_rounded),
          ),
          IconButton(
            onPressed: () {
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
                  id: widget.notes!.id,
                  title: _titleControl.text,
                  contents: _contentControl.text,
                );
                Provider.of<NotesDatabaseProvider>(context, listen: false)
                    .updateNotes(notes);

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
                Navigator.pop(context);
              }
            },
            icon: const Icon(Icons.done),
          )
        ],
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            'Your Note',
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
                    borderSide: BorderSide(
                      color: isDark ? Colors.grey.withOpacity(0.4) : blackColor,
                      width: 1,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                        color:
                            isDark ? Colors.grey.withOpacity(0.4) : blackColor,
                        width: 1),
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
                    borderSide: BorderSide(
                      color: isDark ? Colors.grey.withOpacity(0.4) : blackColor,
                      width: 1,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: isDark ? Colors.grey.withOpacity(0.4) : blackColor,
                      width: 1,
                    ),
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
