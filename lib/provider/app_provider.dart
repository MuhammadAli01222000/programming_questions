
import 'package:programming_questions/pages/result.dart';

import '../core/theme/theme.dart';
class AppProvider extends ChangeNotifier {
  int questionIndex = 0;
  int correctAnswers = 0;
  int wrong = 0;

  Locale? _locale;
  bool showLink = false;

  final DataController dataController = DataController();


  int update(int n) {
    n = n++;
    notifyListeners();
    return n;
  }

  int setter(int n) => 0;

  void checkAnswerAndIncrementIndex(
      List<String> variants,
      String correctAnswer,
      String selectedAnswer,
      String wrongAnswer,
      QuestionModel? questionModel,
      ) {
    if (selectedAnswer == correctAnswer) {
      correctAnswers++;
      listCorrect.add(correctAnswer);
    } else {
      wrong++;
      listWrong.add(questionModel?? null);
      print("Wrong $wrongAnswer");
    }
    questionIndex++;
    notifyListeners();
  }

  void toggleShowLink() {
    showLink = !showLink;
    notifyListeners();
  }

  int levelProgrammer(int level) => 0;

  void reset() {
    questionIndex = 0;
    correctAnswers = 0;
    wrong = 0;
    dataController.clear();
    showLink = false;
    listWrong=[];
    listCorrect=[];
    notifyListeners();
  }
}
