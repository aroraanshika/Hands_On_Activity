import 'package:flutter/material.dart';

class Demo extends StatefulWidget{
  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo>{

  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  double? _result;
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
          title:Text('BMI Calculator'),
          centerTitle : true,
          backgroundColor:Colors.lightBlueAccent,
      ),
      body:Container(
        padding : EdgeInsets.symmetric(horizontal:10.0),
        child:Column(children:<Widget> [
           new TextField(
            controller:_heightController,
            keyboardType:TextInputType.number,
           decoration: new InputDecoration(
            labelText:'height in cm ',
            icon: new Icon(Icons.trending_up),
           ),
           ),
           SizedBox(height:20),
           new TextField(
            controller:_weightController,
            keyboardType:TextInputType.number,
           decoration: new InputDecoration(
            labelText:'weight in kg',
            icon:new Icon(Icons.line_weight),
           ),
           ),
           SizedBox(height:15),
            TextButton(
              
                child: Text (
                  "Calculate",
                  style: new TextStyle(color:Colors.lightBlueAccent),
                ),
                onPressed:calculateBMI,
            ),
          SizedBox(height:15),
Text(
  _result == null?"Enter Value": "${_result}",
  style: new TextStyle(
    color: Colors.lightBlueAccent,
    fontSize:19.4,
    fontWeight:FontWeight.w500,

  ),
)


        ],
        )
      ),
    );
  }
  
void calculateBMI(){
  
    double height = double.parse(_heightController.text) / 100;
    double weight = double.parse(_weightController.text);
    // We dived height by 100 because we are taking the height in centimeter
    // and formula takes height in meter.

    double heightSquare = height * height;
    double result = weight / heightSquare;
    _result = result;

    setState(() {});

}


}