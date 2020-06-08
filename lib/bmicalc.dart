import 'package:flutter/material.dart';

class BMICalculator extends StatefulWidget
{
  @override
  State<StatefulWidget> createState()
  {
    //TODO: implement createState
    return new BMIState();
  }

}

class BMIState extends State<BMICalculator>
{
  double _calculation;
  String _calcResult;
  String _result;

  TextEditingController _ageFieldController=new TextEditingController();
  TextEditingController _heightFieldController=new TextEditingController();
  TextEditingController _weightFieldController=new TextEditingController();

  void _calculateBMI () {
    double height = double.parse(_heightFieldController.text);
    double weight = double.parse(_weightFieldController.text);

    if (height != null && weight != null)
    {
      setState(() {
        height=height * 12;
        _calculation = (weight / (height * height)) * 703;
        _calcResult = _calculation.toStringAsFixed(2);
        if (_calculation < 18.5) {
          _result = 'UNDERWEIGHT';
        } else if (_calculation >= 18.5 && _calculation <= 24.9) {
          _result = 'GOOD FIT';
        } else if (_calculation >= 25.0 && _calculation <= 29.9) {
          _result = 'OVERWEIGHT';
        } else {
          _result = 'OBESE';
        }
      });
  }
}
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(backgroundColor: Colors.brown,title: new Text('BMICalculator'),),
      body: new ListView(
        padding: const EdgeInsets.all(3.5),
        children: <Widget>[
          new Image.asset("images/applogo.png",height: 120.0, width: 150.0,),
          new Container(color: Colors.grey[100],padding: const EdgeInsets.all(5.0),
         child: new Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
             new TextField(
               controller: _ageFieldController,
               keyboardType: TextInputType.number,
             decoration: new InputDecoration(
               labelText: 'Enter your age',
               icon: new Icon(Icons.calendar_today),
             ),
             ),
             new TextField(
               controller: _heightFieldController,
               keyboardType: TextInputType.number,
               decoration: new InputDecoration(
                 labelText: 'height in feet',
               ),
             ),
new TextField(
  controller: _weightFieldController,
  keyboardType: TextInputType.number,
  decoration: new InputDecoration(
    labelText: 'weight in pounds',
    icon: new Icon(Icons.shutter_speed)
  ),
),
             new Padding(padding: const EdgeInsets.all(7.5)),
             new RaisedButton(onPressed: _calculateBMI,
             child: new Text ('CALCULATE',
             style: new TextStyle(
               fontWeight: FontWeight.bold
             ),
             ),

               color:Colors.brown,
               textColor: Colors.white,
             )
           ],
         ),
          ),
          new Padding(padding: const EdgeInsets.all(5.5)),
          new Container(
            alignment: Alignment.topCenter,
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              /*  new Text (_calcResult!= null ? _calcResult : '',
                style: new TextStyle(
                  color: Colors.pink,
                  fontSize: 44.5,
                  fontWeight: FontWeight.w800
                ),
                ),
       */         new Text (_result!= null ? _result : '',
                style: new TextStyle(
                  fontSize: 28.0
                ) ,)
              ],
            )
          )
        ]
      )
    );

  }
}