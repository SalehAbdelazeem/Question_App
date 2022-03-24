import 'package:test_1/question.dart';

class AppBrain {
  int _quistionNumber = 0;
  final List<Question> _questiongrub = [
    Question(" هذا العلم يكون للنادي الأهلي المصري",
        "assets/images/images (1).jpeg", true),
    Question("عدد الأسود الموجوده في الصورة ثلاثه اسود",
        "assets/images/images (2).jpeg", false),
    Question(" هذة القطه لديها عينان مختلفتان في اللون",
        "assets/images/images (3).jpeg", true),
    Question(" عدد الكواكب في المجموعه الشمسيه ثمانيه كواكب",
        "assets/images/images (4).jpeg", true),
    Question(" هذا العلم يكون للنادي الأهلي المصري",
        "assets/images/images (1).jpeg", true),
    Question("عدد الأسود الموجوده في الصورة ثلاثه اسود",
        "assets/images/images (2).jpeg", false),
    Question(" هذة القطه لديها عينان مختلفتان في اللون",
        "assets/images/images (3).jpeg", true),
    Question(" عدد الكواكب في المجموعه الشمسيه ثمانيه كواكب",
        "assets/images/images (4).jpeg", true),
    Question(" هذا العلم يكون للنادي الأهلي المصري",
        "assets/images/images (1).jpeg", true),
    Question("عدد الأسود الموجوده في الصورة ثلاثه اسود",
        "assets/images/images (2).jpeg", false),
    Question(" هذة القطه لديها عينان مختلفتان في اللون",
        "assets/images/images (3).jpeg", true),
    Question(" عدد الكواكب في المجموعه الشمسيه ثمانيه كواكب",
        "assets/images/images (4).jpeg", true),
  ];
  void nextquestion() {
    if (_quistionNumber < _questiongrub.length - 1) {
      _quistionNumber++;
    }
  }

  String getQuestionText() {
    return _questiongrub[_quistionNumber].questiontext;
  }

  String getQuestionImage() {
    return _questiongrub[_quistionNumber].questionimage;
  }

  bool getQuestionAnswer() {
    return _questiongrub[_quistionNumber].questionaswer;
  }

  bool isFinished() {
    if (_quistionNumber >= _questiongrub.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _quistionNumber = 0;
  }
}
