import "package:flutter/material.dart";

class FeedbackPage extends StatefulWidget {
  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('Feedback')),
      body: Text(
        "All your views and opinions are valuable to us. Let us know what you think!"
        "Our mail id - helpinghands@gmail.com",
        style: TextStyle(
            color: Colors.black,
            fontFamily: 'Avenir',
            fontWeight: FontWeight.w700,
            height: 2,
            fontSize: 20),
      ),
    );
  }
}
