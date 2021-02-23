import 'dart:math';

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:new_bmi/result.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class Tall extends StatefulWidget {
  String image;

  Tall(this.image);

  @override
  _TallState createState() => _TallState();
}

class _TallState extends State<Tall> {
  double _tallValue = 160.0;
  double _WeightValue = 55.0;
  final pageController = PageController(initialPage: 0);
  double bmi = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView(
          controller: pageController,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Select Your Tall',
                  style: TextStyle(fontSize: 30),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(child: Image.asset(widget.image)),
                Expanded(
                  child: SfSlider(
                    min: 120.0,
                    max: 180.0,
                    value: _tallValue,
                    interval: 20,
                    showTicks: true,
                    showLabels: true,
                    enableTooltip: true,
                    minorTicksPerInterval: 1,
                    onChanged: (dynamic value) {
                      setState(() {
                        _tallValue = value;
                      });
                    },
                  ),
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RaisedButton(
                        elevation: 2,
                        color: Colors.blue,
                        child: Text('Back'),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      RaisedButton(
                        elevation: 2,
                        color: Colors.blue,
                        child: Text('Next'),
                        onPressed: () {
                          pageController.animateToPage(1,
                              duration: Duration(milliseconds: 3),
                              curve: Curves.easeInBack);
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16,
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Select Your Weight',
                  style: TextStyle(fontSize: 30),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(child: Image.asset(widget.image)),
                Expanded(
                  child: SfSlider(
                    min: 50.0,
                    max: 120.0,
                    value: _WeightValue,
                    interval: 20,
                    showTicks: true,
                    showLabels: true,
                    enableTooltip: true,
                    minorTicksPerInterval: 1,
                    onChanged: (dynamic value) {
                      setState(() {
                        _WeightValue = value;
                      });
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RaisedButton(
                      elevation: 2,
                      color: Colors.blue,
                      child: Text('Back'),
                      onPressed: () {
                        pageController.animateTo(0,
                            duration: Duration(microseconds: 3),
                            curve: Curves.easeInBack);
                      },
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    RaisedButton(
                      elevation: 2,
                      color: Colors.red,
                      child: Text('Calculate BMI'),
                      onPressed: () {

                        bmi = _WeightValue / pow(_tallValue / 100, 2);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Result(bmi),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
