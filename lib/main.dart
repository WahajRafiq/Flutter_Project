import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()  {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}
class Question {
  String question;
  bool correctAnswer;  // Constructor
  Question(this.question, this.correctAnswer);
}
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final tickIcon = Icon(Icons.check_circle,color: Colors.green,size: 30,);
  final crossIcon = Icon(Icons.cancel,color: Colors.red,size: 30,);
  List<Icon> iconsList = [];
  int counter = 0;
  //List of Questions
  final List<Question> questionsList = [
  Question('Napoleon Bonaparte was killed at battle of Waterloo.', false),
  Question('First U.S. President to die in ofiice was Abraham Lincoln.', false),
  Question('Tug of War was once an Olympic sport.', true),
  Question('Deadliest weapon of WWI was machine gun.', true),
  Question('Magma is a scientific name for Lava.', false),
  Question('Veins look blues because the oxygenated blood in them is blue.', false),
  Question('Hottest part of Earth is solid.', true),
  ];

  _checkAnswer(selectedAnswer) {
    if (selectedAnswer == questionsList[counter].correctAnswer) {
      //Correct answer

      setState(() {
        iconsList.add(tickIcon);

        // Check if don't cross list size limit which will result in error
        if (counter < questionsList.length - 1) counter++;
      });
    } else {
      //Incorrect answer
      setState(() {
        iconsList.add(crossIcon);

        // Check if don't cross list size limit which will result in error
        if (counter < questionsList.length - 1) counter++;
      });
    }}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[200],
        appBar: AppBar(
          backgroundColor: Colors.blue[700],
          title: Text('   Q u i z',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Card(
                  color: Colors.blue[700],
                  child: Padding(padding: EdgeInsets.all(40.0),child: Text(questionsList[counter].question,style:TextStyle(fontSize:30,color: Colors.black,fontWeight: FontWeight.bold, ),),)
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[

                      FloatingActionButton.extended(
                          label: Text(' T r u e '),


                          backgroundColor: Colors.green,
                          onPressed: () {
                            _checkAnswer(true);
                          }),

                      FloatingActionButton.extended(

                        label: Text('F a l s e'),

                        backgroundColor: Colors.red,
                        onPressed: () {
                          _checkAnswer(false);
                        },
                      ),
                    ],
              ),

            ],
          ),),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue[700],
        child: Row(

            children: iconsList
        ),
      ),
    );



  }
}

