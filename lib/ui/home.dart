import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _ageController = new TextEditingController();
  final TextEditingController _heightController = new TextEditingController();
  final TextEditingController _weightController = new TextEditingController();
  double inches = 0.0;
  double result = 0.0;
  String _weightStatus = "";

  void _calculateBMI() {
    setState(() {
      int age = int.parse(_ageController.text);
      double height = double.parse(_heightController.text);
      double weight = double.parse(_weightController.text);
      inches = height * 12;
      if ((_ageController.text.isNotEmpty || age > 0) &&
          (_heightController.text.isNotEmpty || inches > 0) &&
          (_weightController.text.isNotEmpty || weight > 0)) {
        result = weight / (inches * inches) * 703;
        if (double.parse(result.toStringAsFixed(1)) < 18) {
          _weightStatus = "Underweight";
        } else if (double.parse(result.toStringAsFixed(1)) > 18.5 &&
            double.parse(result.toStringAsFixed(1)) < 24.9) {
          _weightStatus = "Normal";
        }else if (double.parse(result.toStringAsFixed(1)) > 25 &&
            double.parse(result.toStringAsFixed(1)) < 29.9) {
          _weightStatus = "Overweight";
        }else if (double.parse(result.toStringAsFixed(1)) > 30) {
          _weightStatus = "Obese";
        } else {}
      } else {
        result = 0.0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text("BMI"),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),
      body: new ListView(
        children: <Widget>[
          new Image.asset(
            'images/banner.png',
            width: 100,
            height: 100,
          ),
          new Container(
            padding: new EdgeInsets.all(19),
            color: Colors.grey.shade300,
            child: new Column(
              children: <Widget>[
                new TextField(
                  controller: _ageController,
                  keyboardType: TextInputType.number,
                  decoration: new InputDecoration(
                      labelText: "Age",
                      hintText: "e.g 34",
                      icon: new Icon(Icons.person_outline)),
                ),
                new TextField(
                  controller: _heightController,
                  keyboardType: TextInputType.number,
                  decoration: new InputDecoration(
                    labelText: "Height in feet",
                    hintText: "e.g 34",
                    icon: new Icon(Icons.insert_chart),
                  ),
                ),
                new TextField(
                  controller: _weightController,
                  keyboardType: TextInputType.number,
                  decoration: new InputDecoration(
                      labelText: "Weight in lbs",
                      hintText: "e.g 34",
                      icon: new Icon(Icons.line_weight)),
                ),
                new Padding(
                  padding: new EdgeInsets.all(10.6),
                ),
                //calculate button
                new Container(
                  alignment: Alignment.center,
                  child: new RaisedButton(
                    onPressed: _calculateBMI,
                    color: Colors.pinkAccent,
                    child: new Text(
                      "Calculate",
                    ),
                    textColor: Colors.white,
                  ),
                )
              ],
            ),
          ),
          new Column(
            children: <Widget>[
              new Text(
                "BMI: ${result.toStringAsFixed(1)}",
                style: new TextStyle(
                    color: Colors.blueAccent,
                    fontStyle: FontStyle.italic,
                    fontSize: 19.9,
                    fontWeight: FontWeight.bold),
              ),
              new Padding(
                padding: EdgeInsets.all(10),
              ),
              new Text(
                "$_weightStatus",
                style:
                    new TextStyle(fontSize: 19.9, fontWeight: FontWeight.bold),
              )
            ],
          )
        ],
      ),
    );
  }
}
