import 'package:flutter/material.dart';

class Planet extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new PlanetState();
  }
}

class PlanetState extends State<Planet> {
  final TextEditingController _weightController = new TextEditingController();
  int radioValue;
  double _finalResult = 0.0;
  bool disableRadio = true;
  String _formatedText = "";

  calculateWeight(String weight, double planet) {
    if (int.parse(weight).toString().isNotEmpty && int.parse(weight) > 0) {
      return int.parse(weight) * planet;
    } else {
      print("Wrong!");
    }
  }

  void handleRadioValueChanged(int value) {
    setState(() {
      radioValue = value;

      switch (radioValue) {
        case 0:
          if (_weightController.text.isNotEmpty) {
            _finalResult = calculateWeight(_weightController.text, 0.06);
            _formatedText = "Your weight on Pluto is ${_finalResult.toStringAsFixed(1)}";
          }
          break;
        case 1:
          if (_weightController.text.isNotEmpty) {
            _finalResult = calculateWeight(_weightController.text, 0.38);
            _formatedText =
            "Your weight on Mars is ${_finalResult.toStringAsFixed(1)}";
          }
          break;
        case 2:
          if (_weightController.text.isNotEmpty) {
            _finalResult = calculateWeight(_weightController.text, 0.91);
            _formatedText =
            "Your weight on Venus is ${_finalResult.toStringAsFixed(1)}";
          }
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Weight on planet GpCoders"),
        centerTitle: true,
        backgroundColor: Colors.black38,
      ),
      backgroundColor: Colors.blueGrey,
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          padding: const EdgeInsets.all(2.5),
          children: <Widget>[
            new Image.asset('images/planet.png', height: 133.0, width: 200.0),
            new Container(
              margin: const EdgeInsets.all(3.0),
              alignment: Alignment.center,
              child: new Column(
                children: <Widget>[
                  new Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: new TextField(
                      controller: _weightController,
                      style: new TextStyle(color: Colors.white),
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(
                          labelStyle: new TextStyle(
                              color: Colors.white, fontSize: 16.0),
                          labelText: 'Your weight on earth',
                          hintText: 'In Punds',
                          icon: new Icon(
                            Icons.person_outline,
                            color: Colors.white,
                          )),
                    ),
                  ),

                  // Adding three radio button
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Radio<int>(
                        activeColor: Colors.brown,
                        value: 0,
                        groupValue: radioValue,
                        onChanged: handleRadioValueChanged,
                      ),
                      new Text('Pluto',
                          style: new TextStyle(
                            color: Colors.white30,
                          )),
                      new Radio<int>(
                          activeColor: Colors.red,
                          value: 1,
                          groupValue: radioValue,
                          onChanged: handleRadioValueChanged),
                      new Text('Mars',
                          style: new TextStyle(
                            color: Colors.white30,
                          )),
                      new Radio<int>(
                          activeColor: Colors.orangeAccent,
                          value: 2,
                          groupValue: radioValue,
                          onChanged: handleRadioValueChanged),
                      new Text('Venus',
                          style: new TextStyle(
                            color: Colors.white30,
                          )),
                    ],
                  ),
                  //Result
                  new Padding(
                    padding: const EdgeInsets.all(15.6),
                    child: new Text(_weightController.text.isEmpty ? "Pleae enter weight" : _formatedText + "lbs",
                        style: new TextStyle(
                            color: Colors.white,
                            fontSize: 19.4,
                            fontWeight: FontWeight.w500)),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
