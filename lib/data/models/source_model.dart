import 'package:orodomop_app/domain/entities/source.dart';

class SourceModel extends Source {
  final String? id;
  final String? name;

  const SourceModel({
    required this.id,
    required this.name,
  }) : super(id: id, name: name);

  factory SourceModel.fromJson(Map<String, dynamic> json) {
    return SourceModel(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "id": id,
    };
  }

  Source toEntitie() {
    return Source(id: id, name: name);
  }
}
