
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExamCard extends StatelessWidget{
  final String name;
  final DateTime dateTime;
  ExamCard(this.name,this.dateTime);
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(3),
        child: Card(
          color: Theme.of(context).primaryColorLight,
            child: Column( children:
            [
              Text(this.name,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                  )
              ),
              Text(
                  '${dateTime.day.toString()}-${dateTime.month.toString().padLeft(2,'0')}-${dateTime.year.toString().padLeft(2,'0')} ${dateTime.hour.toString().padLeft(2,'0')}:${dateTime.minute.toString().padLeft(2,'0')}',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15)
              )
      ]
            )
        )
    );
  }

}