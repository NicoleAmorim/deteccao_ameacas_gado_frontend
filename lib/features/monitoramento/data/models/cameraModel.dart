import 'dart:convert';
import 'package:uuid/uuid.dart';

class CameraModel {
  String id;
  String name;
  String identifier;
  String ip;
  String note;

  CameraModel({
    String? id,
    required this.name,
    required this.identifier,
    required this.ip,
    this.note = '',
  }) : id = id ?? const Uuid().v4();

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'identifier': identifier,
      'ip': ip,
      'note': note,
    };
  }

  factory CameraModel.fromMap(Map<String, dynamic> map) {
    return CameraModel(
      id: map['id'],
      name: map['name'],
      identifier: map['identifier'],
      ip: map['ip'],
      note: map['note'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CameraModel.fromJson(String source) =>
      CameraModel.fromMap(json.decode(source));
}
