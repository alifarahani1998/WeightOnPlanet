import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(Home());

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Home1();
  }
}

class Home1 extends State<Home> {

  String string = "";
  double w;

  TextEditingController _weight = new TextEditingController();

  var _radioValue = 0;

  void _handleValue (int value) {
    setState(() {
      _radioValue = value;
      if (_radioValue == 0)  {
        w = double.parse(_weight.text) * 0.06;
        string = w.toString();
      }
      else if (_radioValue == 1) {
        w = double.parse(_weight.text) * 0.38;
        string = w.toString();
      }
      else if (_radioValue == 2) {
        w = double.parse(_weight.text) * 0.91;
        string = w.toString();
      }
    });

  }




  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Weight on Planet",
      home: Scaffold(
        endDrawer: Drawer(

        ),
          backgroundColor: Colors.blueGrey,
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: Text("Weight on Planet"),
          ),
          body: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Center(
                  child: Image.asset(
                    "assets/images/planet.png",
                    width: 150,
                    height: 150,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(50),
                child: Center(
                  child: TextField(
                    controller: _weight,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "Enter Your Weight",
                          icon: Icon(Icons.person_outline, size: 30),
                          hintText: "in KG")),
                ),
              ),
              Container(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Radio<int>(
                      value: 0,
                      groupValue: _radioValue,
                      onChanged: _handleValue,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Text(
                        "Pluto"
                      ),
                    ),
                    Radio<int>(
                      value: 1,
                      groupValue: _radioValue,
                      onChanged: _handleValue,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Text(
                        "Mars"
                      ),
                    ),
                    Radio<int>(
                      value: 2,
                      groupValue: _radioValue,
                      onChanged: _handleValue,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Text(
                        "Venus"
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                child: Center(
                  child: Text(
                    "Your Weight in this planet is",
                    style: TextStyle(
                      color: Colors.lightBlue,
                      fontSize: 20,
                      fontStyle: FontStyle.italic
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              ),
              Center(
                child: Text(
                  string + " KG",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.lightBlue
                  ),
                ),
              )
            ],
          )),
    );
  }
}
