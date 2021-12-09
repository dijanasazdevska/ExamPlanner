import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'exam.dart';
import 'exam_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exam Planner',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.deepPurple,
      ),
      home: const MyHomePage(title: 'Exam Planner'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState([Exam("Mobile Information Systems",DateTime(2021,12,9,19,0)), Exam("Mobile platforms and programming",DateTime(2021,12,12,12,0)),Exam("Web based systems",DateTime(2021,18,12,14,0)),Exam("Menagment information systems",DateTime(2021,29,12,19,0))]);
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Exam> exams;
  DateTime dateTimePicked = DateTime.now();
  String courseName = '';

  _MyHomePageState(this.exams);

  addExam(){
    if(courseName.isNotEmpty){
      setState((){
        exams.add(Exam(courseName,dateTimePicked));

      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: Icon(Icons.playlist_add),
            onPressed: addExam
          )
        ]
      ),
      body: Column( children: [
          Container(
            margin: EdgeInsets.all(10),
            child: TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter course name',
            ),
              onChanged: (string) => courseName = string,
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            height: 80,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.dateAndTime,
              initialDateTime: DateTime.now(),
              dateOrder: DatePickerDateOrder.dmy,
              onDateTimeChanged: (DateTime newDateTime) {
                dateTimePicked = newDateTime;
              },
              use24hFormat: true,
              minuteInterval: 1,
            ),
          ),
        Text(
            "Exam list",
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold
            )
        ),
        Expanded(
            child:
                Container(
                    child: ListView.builder(
                  itemCount: exams.length,
                  itemBuilder: (context, index){
                    return ExamCard(exams[index].courseName, exams[index].dateTime);
                    }
            )))])
    );
  }
}
