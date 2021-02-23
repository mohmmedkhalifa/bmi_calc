import 'package:flutter/material.dart';
import 'package:new_bmi/tall.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String maleImage = 'assets/images/boy.png';
  String femaleImage = 'assets/images/girl.png';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Select Your Gender',
                style: TextStyle(fontSize: 24),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Tall(maleImage)));
                },
                child: Card(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                        width: 350,
                        height: 220,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage(maleImage),
                              fit: BoxFit.scaleDown),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        'Male',
                        style: TextStyle(fontSize: 24),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                  elevation: 6,
                  shape: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Tall(femaleImage)));
                },
                child: Card(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                        width: 350,
                        height: 220,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage(femaleImage),
                              fit: BoxFit.scaleDown),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        'Female',
                        style: TextStyle(fontSize: 24),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                  elevation: 6,
                  shape: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
