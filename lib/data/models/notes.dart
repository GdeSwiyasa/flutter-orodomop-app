class NotesTable {
  late int? id;
  late String title;
  late String contents;

  NotesTable({
    this.id,
    required this.title,
    required this.contents,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'contents': contents,
    };
  }

  NotesTable.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    title = map['title'];
    contents = map['contents'];
  }
}
