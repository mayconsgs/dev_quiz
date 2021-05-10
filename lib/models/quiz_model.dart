import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dev_quiz/models/question_model.dart';

enum Level { facil, medio, dificil, perito }

extension LevelStringExt on String {
  Level get parse => {
        'facil': Level.facil,
        'medio': Level.medio,
        'dificil': Level.dificil,
        'perito': Level.perito
      }[this]!;
}

extension LevelExt on Level {
  String get parse => {
        Level.facil: 'facil',
        Level.medio: 'medio',
        Level.dificil: 'dificil',
        Level.perito: 'perito'
      }[this]!;
}

class QuizModel {
  final DocumentReference? reference;

  final String title;
  final List<QuestionModel> questions;
  final int questionAnswered;
  final String image;
  final Level level;

  QuizModel({
    required this.title,
    required this.questions,
    required this.image,
    required this.level,
    this.questionAnswered = 0,
    this.reference,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'questions': questions.map((x) => x.toMap()).toList(),
      'questionAnswered': questionAnswered,
      'image': image,
      'level': level.parse,
    };
  }

  factory QuizModel.fromMap(
      DocumentReference? reference, Map<String, dynamic> map) {
    return QuizModel(
      reference: reference,
      title: map['title'],
      questions: List<QuestionModel>.from(
          map['questions']?.map((x) => QuestionModel.fromMap(x))),
      questionAnswered: map['questionAnswered'],
      image: map['image'],
      level: map['level'].toString().parse,
    );
  }

  String toJson() => json.encode(toMap());

  factory QuizModel.fromJson(String source) =>
      QuizModel.fromMap(null, json.decode(source));
}
