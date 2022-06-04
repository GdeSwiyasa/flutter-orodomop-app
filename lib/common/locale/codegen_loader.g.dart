// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader {
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String, dynamic> en = {
    "general": "General",
    "language": "Language",
    "theme": "Theme",
    "notification": "Notifications",
    "language_args": "Adjust the language",
    "theme_args": "Adjust the theme",
    "notifications_args": "Adjust the notifications",
    "select_language": "Select language",
    "select_language_args": "Select language do you need",
    "change_theme": "Change theme",
    "change_theme_args": "Change theme for this app",
    "note_empty": "You have not made any notes yet",
    "note_subject": "Add subject",
    "note_todo": "Add what you supposed to do",
    "note": "Note",
    "note_msg": "Subject is empty",
    "note_msg_content": "You have to fill in the subject name"
  };
  static const Map<String, dynamic> id = {
    "general": "Umum",
    "language": "Bahasa",
    "theme": "Tema",
    "notification": "Notifikasi",
    "language_args": "Sesuaikan Bahasa",
    "theme_args": "Sesuaikan tema",
    "notifications_args": "Sesuaikan notifikasi",
    "select_language": "Pilih bahasa",
    "select_language_args": "Pilih bahasa yang Anda butuhkan",
    "change_theme": "Ubah tema",
    "change_theme_args": "Ubah tema untuk aplikasi ini",
    "note_empty": "Anda belum membuat catatan apa pun",
    "note_subject": "Tambahkan subjek",
    "note_todo": "Tambahkan apa yang harus anda lakukan",
    "note": "Catatan",
    "note_msg": "Subject kosong",
    "note_msg_content": "Anda harus mengisi nama subjek"
  };
  static const Map<String, Map<String, dynamic>> mapLocales = {
    "en": en,
    "id": id
  };
}
