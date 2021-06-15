import 'package:flutter/material.dart';
import 'package:flutter_calculator_app/widgets/cal_widget.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({Key? key}) : super(key: key);

  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  late String _history = '';
  late String _expression = '';

  void allClear(String text){
    setState(() {
      _history ='';
      _expression  = '';
    });
  }
  void numClick(String text) {
    setState(() => _expression += text);
  }
  void clear(String text) {
    setState(() {
      _expression = '';
    });
  }

  void evaluate(String text) {
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();

    setState(() {
      _history = _expression;
      _expression = exp.evaluate(EvaluationType.REAL, cm).toString();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            /// previous cal..
            Container(
              child: Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Text(
                  _history,
                  style: GoogleFonts.rubik(
                    textStyle: const TextStyle(
                      fontSize: 24,
                      color: Color(0xFF545F61),
                    ),
                  ),
                ),
              ),
              alignment: const Alignment(1.0, 1.0),
            ),
            /// _expression
            Container(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  _expression,
                  style: GoogleFonts.rubik(
                    textStyle: const TextStyle(
                      fontSize: 48,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              alignment: const Alignment(1.0, 1.0),
            ),
            /// Divider
            const Divider(
              endIndent: 15.0,
              indent: 15.0,
              thickness: 2,
              height: 5,
              color: Colors.deepOrange,
            ),
            const SizedBox(height: 20),
            /// Ac C  % /
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalculatorButton(
                  text: 'AC',
                  fillColor: 0xFF6C807F,
                  textSize: 20,
                  callback: allClear,
                ),
                CalculatorButton(
                  text: 'C',
                  fillColor: 0xFF6C807F,
                  textSize: 20,
                  callback: clear,
                ),
                CalculatorButton(
                  text: '%',
                  fillColor: 0xFFFFFFFF,
                  textColor: 0xFF65BDAC,
                  textSize: 24,
                  callback: numClick,
                ),
                CalculatorButton(
                  text: '/',
                  fillColor: 0xFFFFFFFF,
                  textColor: 0xFF65BDAC,
                  textSize: 24,
                  callback: numClick,
                ),
              ],
            ),
            /// 7 8 9 X
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalculatorButton(
                  text: '7',
                  fillColor: 0xFFFF5722,
                  textSize: 20,
                  callback: numClick,
                ),
                CalculatorButton(
                  text: '8',
                  fillColor: 0xFFFF5722,
                  textSize: 20,
                  callback: numClick,
                ),
                CalculatorButton(
                  text: '9',
                  fillColor: 0xFFFF5722,
                  textSize: 20,
                  callback: numClick,
                ),
                CalculatorButton(
                  text: 'X',
                  fillColor: 0xFFFFFFFF,
                  textColor: 0xFF65BDAC,
                  textSize: 24,
                  callback: numClick,
                ),
              ],
            ),
            /// 4 5 6 -
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalculatorButton(
                  text: '4',
                  fillColor: 0xFFFF5722,
                  textSize: 20,
                  callback: numClick,
                ),
                CalculatorButton(
                  text: '5',
                  fillColor: 0xFFFF5722,
                  textSize: 20,
                  callback: numClick,
                ),
                CalculatorButton(
                  text: '6',
                  fillColor: 0xFFFF5722,
                  textSize: 20,
                  callback: numClick,
                ),
                CalculatorButton(
                  text: '-',
                  fillColor: 0xFFFFFFFF,
                  textColor: 0xFF65BDAC,
                  textSize: 38,
                  callback: numClick,
                ),
              ],
            ),
            /// 1 2 3 +
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalculatorButton(
                  text: '1',
                  fillColor: 0xFFFF5722,
                  textSize: 20,
                  callback: numClick,
                ),
                CalculatorButton(
                  text: '2',
                  fillColor: 0xFFFF5722,
                  textSize: 20,
                  callback: numClick,
                ),
                CalculatorButton(
                  text: '3',
                  fillColor: 0xFFFF5722,
                  textSize: 20,
                  callback: numClick,
                ),
                CalculatorButton(
                  text: '+',
                  fillColor: 0xFFFFFFFF,
                  textColor: 0xFF65BDAC,
                  textSize: 30,
                  callback: numClick,
                ),
              ],
            ),
            /// . 0 00 =
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalculatorButton(
                  text: '.',
                  fillColor: 0xFFFF5722,
                  textSize: 20,
                  callback: numClick,
                ),
                CalculatorButton(
                  text: '0',
                  fillColor: 0xFFFF5722,
                  textSize: 20,
                  callback: numClick,
                ),
                CalculatorButton(
                  text: '00',
                  fillColor: 0xFFFF5722,
                  textSize: 20,
                  callback: numClick,
                ),
                CalculatorButton(
                  text: '=',
                  fillColor: 0xFFFFFFFF,
                  textColor: 0xFF65BDAC,
                  textSize: 30,
                  callback: evaluate,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
