import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: MyAppHome(),
    );
  }
}

class MyAppHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppHomeState();
  }
}

class MyAppHomeState extends State<MyAppHome> {

  List<int> answers = [];
  String result = "";
  String question = "";
  int number1 = 0, number2 = 0;
  int scoreValue = 0;
  int totalAnswer = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nextQuestion();
  }

  void checkAnswer(int index){
    ++totalAnswer;
    if(number1 + number2 == answers[index]){
      ++scoreValue;
      result = "Correct";
    }else{
      result = "Wrong";
    }
    setState(() {
      answers = [];
      nextQuestion();
    });
  }

  void nextQuestion(){
    var random = new Random();
    number1 = random.nextInt(100);
    number2 = random.nextInt(100);
    question = "Add " + number1.toString() + " and " + number2.toString();
    answers.add(number1 + number2);
    answers.add(number1 + number2 + 55);
    answers.add(number1 + number2 + 75);
    answers.add(number1 + number2 + 25);
    answers.shuffle();
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Brain Trainer"),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
        body:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(20.0),
                        child: Text(
                          question,
                          style: TextStyle(
                            color: Colors.redAccent,
                            fontSize: 40
                          ),
                        )
                    ),
                    Expanded(
                      child: GridView.builder(
                        padding: EdgeInsets.all(80.0),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1.3,
                            crossAxisSpacing: 20.0,
                            mainAxisSpacing: 20.0),
                        itemCount: this.answers.length,
                        itemBuilder: (context, i) => SizedBox(
                          width: 100.0,
                          height: 100.0,
                          child: MaterialButton(
                            onPressed: () {
                              checkAnswer(i);
                            },
                            color: Colors.blue,
                            child: Text(
                              this.answers[i].toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20.0),
                        child: Text(
                          result,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25
                          ),
                        )
                    ),
                    Container(
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          "Score : " + scoreValue.toString() + " / " + totalAnswer.toString(),
                          style: TextStyle(
                            color: Colors.deepOrange,
                            fontSize: 30
                          ),
                        )
                    ),
                  ],
                ),
    );
  }
}
