import 'package:flutter/material.dart';
import 'package:new_bmi/main.dart';

class Result extends StatelessWidget {
  double bmi;

  Result(this.bmi);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            bmi >= 25
                ? MyResult(
                    bmi: bmi,
                    image: 'assets/images/3.png',
                    text:
                        'You have a higher than normal body weight. Try to exercise more.',
                    color: Colors.red,
                  )
                : bmi > 18.5
                    ? MyResult(
                        bmi: bmi,
                        image: 'assets/images/1.png',
                        text: 'You have a normal body weight. Good job!',
                        color: Colors.green,
                      )
                    : MyResult(
                        bmi: bmi,
                        image: 'assets/images/2.png',
                        text:
                            'You have a lower than normal body weight. You can eat a bit more.',
                        color: Colors.orange,
                      ),
            RaisedButton(
              child: Text('Calculate Again?'),
              color: Colors.blue,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class MyResult extends StatelessWidget {
  MyResult({
    Key key,
    @required this.bmi,
    this.image,
    this.text,
    this.color,
  }) : super(key: key);

  double bmi;
  String image;
  String text;
  Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          bmi.toStringAsFixed(1),
          style: TextStyle(
              fontSize: 50, fontWeight: FontWeight.bold, color: color),
        ),
        Container(
          width: 200,
          height: 200,
          child: Image.asset(
            image,
            fit: BoxFit.contain,
          ),
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 26, color: Colors.black),
        ),
      ],
    );
  }
}
