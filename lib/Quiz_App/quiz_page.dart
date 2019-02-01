import 'package:flutter/material.dart';
import 'package:myfirstflutter_app/Quiz_App/UI/answer_button.dart';
import 'package:myfirstflutter_app/Quiz_App/UI/correct_wrong_overlay.dart';
import 'package:myfirstflutter_app/Quiz_App/UI/question_text.dart';
import 'package:myfirstflutter_app/Quiz_App/UI/score_page.dart';
import 'package:myfirstflutter_app/Quiz_App/utils/question.dart';
import 'package:myfirstflutter_app/Quiz_App/utils/quiz.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  Questions currentQuestion;
  Quiz quiz = new Quiz([
    new Questions("Flutter is awesome", false),
    new Questions("Everything is good", true),
    new Questions("Go to the hell", true)
  ]);

  String questionText;
  int questionNumber;
  bool isCorrect;
  bool overlayShouldBeVisible;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentQuestion = quiz.nextQuestion;
    questionText = currentQuestion.questions;
    questionNumber = quiz.questionNumber;
  }

  void handelAnswer(bool answer){
    isCorrect = (currentQuestion.answers == answer);
    quiz.answer(isCorrect);
    this.setState((){
      overlayShouldBeVisible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Column(
          children: <Widget>[
            new AnswerButton(true, ()=> handelAnswer(true)),
            new QuestionText(questionText, questionNumber),
            new AnswerButton(false, ()=> handelAnswer(false)),
          ],
        ),
        overlayShouldBeVisible == true?  new CorrectWrongOverlay(
            isCorrect,
            (){
              if(quiz.length == questionNumber){
                Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(
                    builder: (BuildContext context) => ScorePage(quiz.score, quiz.length)
                ), (Route route) => route == null);
                return;
              }
              currentQuestion = quiz.nextQuestion;
              this.setState((){
                overlayShouldBeVisible = false;
                questionText  = currentQuestion.questions;
                questionNumber = quiz.questionNumber;
              });
            }
        ): new Container(),
      ],
    );
  }
}
