import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'app_pain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

AppBrain appBrain = AppBrain();
main() => runApp(const TestApp());

class TestApp extends StatelessWidget {
  const TestApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: const Text("اختبار"),
        ),
        body: const Padding(
          padding: EdgeInsets.all(20.0),
          child: ExamBage(),
        ),
      ),
    );
  }
}

class ExamBage extends StatefulWidget {
  const ExamBage({Key? key}) : super(key: key);

  @override
  _ExamBageState createState() => _ExamBageState();
}

class _ExamBageState extends State<ExamBage> {
  List<Padding> ansurResult = [];
  int rightAnser = 0;

  void checkAnswer(bool whatyuserpiker) {
    bool correctAnswer = appBrain.getQuestionAnswer();
    setState(() {
      if (whatyuserpiker == correctAnswer) {
        rightAnser++;
        ansurResult.add(const Padding(
          padding: EdgeInsets.all(4.0),
          child: Icon(
            Icons.thumb_up,
            color: Colors.green,
          ),
        ));
      } else {
        ansurResult.add(const Padding(
          padding: EdgeInsets.all(4.0),
          child: Icon(
            Icons.thumb_down,
            color: Colors.red,
          ),
        ));
      }
      if (appBrain.isFinished() == true) {
        Alert(
          context: context,
          type: AlertType.none,
          title: "انتهاء ألأختبار",
          desc: "لقد أجبت علي $rightAnser أسئله صحيحه من أصل 7 أسئله.",
          buttons: [
            DialogButton(
              child: const Text(
                "ابدأ من جديد",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              width: 120,
            )
          ],
        ).show();
        appBrain.reset();
        ansurResult = [];
      } else {
        appBrain.nextquestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: ansurResult,
        ),
        Expanded(
          flex: 5,
          child: Column(
            children: [
              Image.asset(
                appBrain.getQuestionImage(),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                appBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(23),
              ),
              child: MaterialButton(
                color: Colors.indigo,
                padding: const EdgeInsets.all(20),
                onPressed: () {
                  checkAnswer(true);
                },
                child: const Text(
                  'صح',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: MaterialButton(
              color: Colors.deepOrange,
              padding: const EdgeInsets.all(20),
              onPressed: () {
                checkAnswer(false);
              },
              child: const Text(
                'خطأ',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
