import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';
import './reset.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  var questionIndex = 0;
  var totalScore = 0;
  var questionAnswerList = [
    {
      'question': 'What\'s your favorite color?',
      'answer': [
        {'text': 'Black', 'score': 7},
        {'text': 'Blue', 'score': 10},
        {'text': 'Pink', 'score': 5},
        {'text': "White", 'score': 9}
      ],
    },
    {
      'question': 'What\'s your favorite animal?',
      'answer': [
        {'text': 'Cheetah', 'score': 10},
        {'text': 'Rabbit', 'score': 5},
        {'text': 'Cow', 'score': 7},
        {'text': "Tiger", 'score': 9}
      ]
    },
    {
      'question': 'What\'s your favorite food?',
      'answer': [
        {'text': 'Chicken', 'score': 7},
        {'text': 'Paneer', 'score': 10},
        {'text': 'Biryani', 'score': 9},
        {'text': 'Fish', 'score': 5}
      ]
    },
    {
      'question': 'What\'s your favorite insect?',
      'answer': [
        {'text': 'Mosquito', 'score': 9},
        {'text': 'Lady Bird', 'score': 7},
        {'text': 'Butterfly', 'score': 10},
        {'text': 'Bee', 'score': 5}
      ]
    },
    {
      'question': 'What\'s your favorite season?',
      'answer': [
        {'text': 'Winter', 'score': 9},
        {'text': 'Summer', 'score': 10},
        {'text': 'Rainy', 'score': 5},
        {'text': 'Spring', 'score': 7}
      ]
    },
    {
      'question': 'What\'s your favorite holiday destination?',
      'answer': [
        {'text': 'New-Zealand', 'score': 10},
        {'text': 'Neatherland', 'score': 9},
        {'text': 'Zimbabwe', 'score': 7},
        {'text': 'Sri Lanka', 'score': 5}
      ]
    },
  ];

  void onAnswerClick(int score) {
    setState(() {
      questionIndex++;
      totalScore += score;
    });
    print('Question Index incremented to ' + questionIndex.toString());
    if (questionIndex >= questionAnswerList.length) {
      print('You have reached the end of the quiz and the score is : ' +
          totalScore.toString());
    }
  }

  void onResetClick() {
    setState(() {
      questionIndex = 0;
      totalScore = 0;
    });
    print('Question Index reset to ' + questionIndex.toString());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('QuizApp'),
            ),
            body: questionIndex < questionAnswerList.length
                ? Column(children: [
                    Question(questionAnswerList[questionIndex]['question']),
                    // take the entire list, map each answer and send one by one answer to the class Answer //
                    ...(questionAnswerList[questionIndex]['answer']
                            as List<Map<String, Object>>)
                        .map((answer) {
                      return Answer(
                          answer['text'], () => onAnswerClick(answer['score']));
                    }).toList()
                  ])
                : Reset(onResetClick, totalScore)));
  }
}
