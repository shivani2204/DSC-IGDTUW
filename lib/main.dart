import 'dart:ui';
import "package:flutter/material.dart";
import 'package:math_expressions/math_expressions.dart';
void main(){
  runApp(Calculator());
}
class Calculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: SimpleCalculator(),
    );
  }
}

class SimpleCalculator extends StatefulWidget {
  @override
  _SimpleCalculatorState createState() => _SimpleCalculatorState();
}

class _SimpleCalculatorState extends State<SimpleCalculator> { 
  String equation = '0';
  String result = '0';
  String expression = "";
  double equationfontsize = 38.0;
  double resultfontsize = 48.0;
  
  buttonpressed(String buttontext){
    setState(() {
      if(buttontext == "C"){
        equation = "0";
        result = "0";
        equationfontsize = 38.0;
        resultfontsize = 48.0;
      }
      else if(buttontext == "⌫"){
        equationfontsize = 48.0;
        resultfontsize = 38.0;
        equation = equation.substring(0,equation.length - 1);
        if(equation == ""){
          equation = "0";
        }
      }
      else if(buttontext == "="){
         equationfontsize = 38.0;
         resultfontsize = 48.0;
         expression = equation;
         expression = expression.replaceAll('x','*');
         expression = expression.replaceAll('÷','/');

         try{
           Parser p = new Parser();
           Expression exp = p.parse(expression);
           ContextModel cm = ContextModel();
           result = '${exp.evaluate(EvaluationType.REAL, cm)}';
         }
         catch(e){
           result = "error";
         }
      }
      else{
        equationfontsize = 48.0;
        resultfontsize = 38.0;
        if(equation == "0"){
          equation = buttontext;
        }
        else{
          equation = equation + buttontext;
        }
      }
    });
  }

  Widget buildButton(String buttonText,double buttonheight, Color buttoncolor){
    return Container(
      height: MediaQuery.of(context).size.height * buttonheight,
      color: buttoncolor,
      child: FlatButton(
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
        side: BorderSide(
          color: Colors.white,
          width: 1,
          style: BorderStyle.solid,
        )
        ),
        padding: EdgeInsets.all(16.0),
        onPressed: () => buttonpressed(buttonText),
        child: Text(buttonText,
                  style:TextStyle(
                  fontSize:30.0,
                  fontWeight: FontWeight.normal,
                  color: Colors.white),
                ),
        ),
        );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Calculator')),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(equation,style: TextStyle(fontSize: equationfontsize)),
            ),
            Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
            child: Text(result,style: TextStyle(fontSize: resultfontsize)),
            ),

            Expanded(child: Divider(),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * .75,
                  child: Table(
                    children: [
                      TableRow(
                        children:[
                          buildButton("C",0.1,Colors.green),
                          buildButton("⌫",0.1,Colors.purple),
                          buildButton("÷",0.1,Colors.purple),
                        ]  ),

                      TableRow(
                        children:[
                          buildButton("7",0.1,Colors.black54),
                          buildButton("8",0.1,Colors.black54),
                          buildButton("9",0.1,Colors.black54),
                        ]  ),

                      TableRow(
                        children:[
                          buildButton("4",0.1,Colors.black54),
                          buildButton("5",0.1,Colors.black54),
                          buildButton("6",0.1,Colors.black54),
                        ]  ), 

                      TableRow(
                        children:[
                          buildButton("1",0.1,Colors.black54),
                          buildButton("2",0.1,Colors.black54),
                          buildButton("3",0.1,Colors.black54),
                        ]  ), 

                      TableRow(
                        children:[
                          buildButton(".",0.1,Colors.black54),
                          buildButton("0",0.1,Colors.black54),
                          buildButton("00",0.1,Colors.black54),
                        ]  )     
                    ]
                  ),
                ),

                Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: Table(
                    children: [
                      TableRow(children: [
                        buildButton("x",0.1,Colors.purple),
                      ]),
                      TableRow(children: [
                        buildButton("-",0.1,Colors.purple),
                      ]),
                      TableRow(children: [
                        buildButton("+",0.1,Colors.purple),
                      ]),
                      TableRow(children: [
                        buildButton("=",0.2,Colors.green),
                      ]),

                    ]
                  ),
                )
              ],
            )
        ]
      ),
    );
  }
}