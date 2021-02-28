import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: HomeScreen(),
    ));

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController ageTextController = new TextEditingController();

  TextEditingController heightTextController = new TextEditingController();

  TextEditingController weightTextController = new TextEditingController();

  double bmiValue = 0.0;

  double ageValue = 0.0;

  double heightValue = 0.0;

  double weightValue = 0.0;

  int selectedGender = 0;

  String result = "";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
            title: Text(
              "BMI Calculator",
              style: TextStyle(color: Colors.black),
            ),
            leading: Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0),
              child: Image.asset("assets/BMI.png"),
            ),
            actions: [
              IconButton(
                  icon: Icon(Icons.refresh, color: Colors.black),
                  onPressed: () {
                    ageTextController.clear();
                    heightTextController.clear();
                    weightTextController.clear();
                    selectedGender = 0;
                    setState(() {
                      result = "";
                    });
                  })
            ],
            centerTitle: false,
            backgroundColor: Colors.yellow),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
              child: Column(
            children: <Widget>[
              Image(image: AssetImage("assets/Cal.png")),
              TextField(
                controller: ageTextController,
                decoration: InputDecoration(
                    labelText: "Age",
                    hintText: "in years",
                    labelStyle: TextStyle(color: Colors.black)),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: heightTextController,
                decoration: InputDecoration(
                    labelText: "Height",
                    hintText: "in cms",
                    labelStyle: TextStyle(color: Colors.black)),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: weightTextController,
                decoration: InputDecoration(
                    labelText: "Weight",
                    hintText: "in kgs",
                    labelStyle: TextStyle(color: Colors.black)),
                keyboardType: TextInputType.number,
              ),
              Row(
                children: <Widget>[
                  Text("Gender", style: TextStyle(fontSize: 17)),
                  Radio(
                      value: 0,
                      groupValue: selectedGender,
                      onChanged: (T) {
                        print(T);
                        setState(() {
                          selectedGender = T;
                        });
                      }),
                  Text("Male"),
                  Radio(
                      value: 1,
                      groupValue: selectedGender,
                      onChanged: (T) {
                        print(T);
                        setState(() {
                          selectedGender = T;
                        });
                      }),
                  Text("Female"),
                ],
              ),
              SizedBox(height: 30),
              Row(
                children: <Widget>[
                  SizedBox(width: 30),
                  Text(
                    '$result',
                    style: TextStyle(fontSize: 17, color: Colors.green),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.all(25),
                child: RaisedButton(
                  child: Text(
                    'Calculate BMI',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  color: Colors.blueAccent,
                  textColor: Colors.white,
                  onPressed: () {
                    ageValue = double.tryParse(ageTextController.text);
                    weightValue = double.tryParse(weightTextController.text);
                    heightValue = double.tryParse(heightTextController.text);
                    if (ageValue != null &&
                        weightValue != null &&
                        heightValue != null) {
                      double meteredHeight = heightValue / 100;
                      bmiValue = weightValue / (meteredHeight * meteredHeight);
                      bmiValue = bmiValue.ceilToDouble();
                      setState(() {
                        result = 'BMI Value : $bmiValue ';
                      });
                    } else {
                      setState(() {
                        result = "Please enter the valid input";
                      });
                    }
                  },
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
