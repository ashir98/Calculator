import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var result = "";
  Widget btn(var textt, Color txtclr) {
    return ElevatedButton(
        onPressed: () {
          setState(() {
            result = result + textt;
          });
        },
        child: Text(textt,
            style: TextStyle(
              fontSize: 30,
              color: txtclr,
            )));
  }

  clearr() {
    setState(() {
      result = "";
    });
  }

  output() {
    Parser p = Parser();
    Expression exp = p.parse(result);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    setState(() {
      result = eval.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Calculator',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        color: Colors.black87,
        child: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  result,
                  style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    btn("1", Colors.black, ),
                    btn("2", Colors.black, ),
                    btn("3", Colors.black, ),
                    btn("4", Colors.black, ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    btn("5", Colors.black, ),
                    btn("6", Colors.black, ),
                    btn("7", Colors.black, ),
                    btn("8", Colors.black, ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    btn("9", Colors.black ),
                    btn("0", Colors.black, ),
                    btn("+", Colors.black, ),
                    btn("-", Colors.black, ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    btn("*", Colors.black,),
                    btn("/", Colors.black,),
                    ElevatedButton(onPressed: clearr,child: Text( 'AC', style: TextStyle( fontSize: 30,color: Colors.black),  )),
                    ElevatedButton(onPressed: output, child: Text('=',style:TextStyle(fontSize: 30,color: Colors.black),)),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}






  //   return ElevatedButton(
  //     onPressed: () {
  //       setState(() {
  //         result = result + textt;
  //       });
  //     },
  //     child: Text(textt),
  //   );
  // }