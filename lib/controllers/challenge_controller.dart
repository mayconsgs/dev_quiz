import 'package:dev_quiz/models/awnser_model.dart';
import 'package:dev_quiz/models/question_model.dart';
import 'package:get/get.dart';

class ChallengeController extends GetxController {
  final String titleQuiz;

  final _questionAnswered = 0.obs;
  final _validateQuestion = false.obs;
  final _selectedAwnser = 0.obs;

  final RxList<QuestionModel> _questionsList;

  int get questionAnswered => _questionAnswered.value;
  bool get validateQuestion => _validateQuestion.value;
  int get selectedAwnser => _selectedAwnser.value;

  int get totalQuestions => _questionsList.length;
  List<QuestionModel> get questionsList => _questionsList;
  QuestionModel get currentQuestion => _questionsList[questionAnswered];

  bool get finalQuiz => _questionAnswered.value == _questionsList.length;

  ChallengeController(
      int questionAnswered, this._questionsList, this.titleQuiz) {
    _questionAnswered.value = questionAnswered;
  }

  selectAwnser(AwnserModel awnser) {
    _selectedAwnser.value = currentQuestion.awnsers.indexOf(awnser);
  }

  confirmQuestion() {
    _validateQuestion.value = true;
  }

  nextQuestion() {
    _questionAnswered.value++;
    _validateQuestion.value = false;
    _selectedAwnser.value = 0;
  }
}
