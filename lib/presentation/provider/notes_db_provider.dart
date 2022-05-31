import 'package:flutter/cupertino.dart';
import 'package:orodomop_app/data/database.dart';
import 'package:orodomop_app/data/models/notes.dart';

class NotesDatabaseProvider extends ChangeNotifier {
  late DatabaseHelper _databaseHelper;

  late List<NotesTable> _notes;
  List<NotesTable> get notes => _notes;

  NotesDatabaseProvider() {
    _databaseHelper = DatabaseHelper();
    _getNotes();
  }

  void _getNotes() async {
    _notes = await _databaseHelper.getNotesList();
    notifyListeners();
  }

  Future<void> insertNote(NotesTable notes) async {
    await _databaseHelper.insertNote(notes);
    _getNotes();
  }

  Future<void> updateNotes(NotesTable NotesTable) async {
    await _databaseHelper.updateNote(NotesTable);
    _getNotes();
  }

  Future<void> deleteNote(int id) async {
    await _databaseHelper.deleteNote(id);
    _getNotes();
  }

  Future<NotesTable> getNoteById(int id) async {
    return await _databaseHelper.getNoteById(id);
  }
}
