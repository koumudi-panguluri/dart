import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final answerHandler;
  final String answer;
  Answer(this.answer, this.answerHandler);
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10),
        width: double.infinity,
        height: 50,
        child: RaisedButton(
          child: Text(answer, style: TextStyle(fontSize: 20)),
          onPressed: answerHandler,
          color: Colors.blue,
          textColor: Colors.white,
        ));
  }
}
