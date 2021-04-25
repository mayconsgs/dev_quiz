import 'dart:convert';

class AwnserModel {
  final String label;
  final bool isRight;

  AwnserModel({
    required this.label,
    required this.isRight,
  });

  Map<String, dynamic> toMap() {
    return {
      'label': label,
      'isRight': isRight,
    };
  }

  factory AwnserModel.fromMap(Map<String, dynamic> map) {
    return AwnserModel(
      label: map['label'],
      isRight: map['isRight'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AwnserModel.fromJson(String source) =>
      AwnserModel.fromMap(json.decode(source));
}
