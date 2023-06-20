import 'package:flutter/material.dart';
import '../components/calculator_button.dart';

class CalculatorScreen extends StatefulWidget {
  static String routeName = "Calculator Screen";
  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String resultText = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff9fbff),
      appBar: AppBar(
        backgroundColor: Color(0xfff9fbff),
        title: const Text(
          "Calculator",
          style: TextStyle(fontSize: 30, color: Color(0xff0087f3)),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
              flex: 2,
              child: Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
                  alignment: Alignment.centerRight,
                  width: double.infinity,
                  child: Text(
                    resultText,
                    style: TextStyle(fontSize: 65, color: Color(0xff0087f3)),
                  ))),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalculatorButton(
                  buttonName: "C",
                  buttonColor: Color(0xff0087f3),
                  onClick: onCDeleteClick,
                ),
                CalculatorButton(
                  buttonName: "+/-",
                  buttonColor: Color(0xff0087f3),
                  onClick: onOperatorClick,
                ),
                CalculatorButton(
                  buttonName: "%",
                  buttonColor: Color(0xff0087f3),
                  onClick: onOperatorClick,
                ),
                CalculatorButton(
                  buttonName: "/",
                  buttonColor: Color(0xff0087f3),
                  onClick: onOperatorClick,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalculatorButton(
                  buttonName: "7",
                  buttonColor: Color(0xff000000),
                  onClick: onDigitClick,
                ),
                CalculatorButton(
                  buttonName: "8",
                  buttonColor: Color(0xff000000),
                  onClick: onDigitClick,
                ),
                CalculatorButton(
                  buttonName: "9",
                  buttonColor: Color(0xff000000),
                  onClick: onDigitClick,
                ),
                CalculatorButton(
                  buttonName: "X",
                  buttonColor: Color(0xff0087f3),
                  onClick: onOperatorClick,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalculatorButton(
                  buttonName: "4",
                  buttonColor: Color(0xff000000),
                  onClick: onDigitClick,
                ),
                CalculatorButton(
                  buttonName: "5",
                  buttonColor: Color(0xff000000),
                  onClick: onDigitClick,
                ),
                CalculatorButton(
                  buttonName: "6",
                  buttonColor: Color(0xff000000),
                  onClick: onDigitClick,
                ),
                CalculatorButton(
                  buttonName: "-",
                  buttonColor: Color(0xff0087f3),
                  onClick: onOperatorClick,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalculatorButton(
                  buttonName: "1",
                  buttonColor: Color(0xff000000),
                  onClick: onDigitClick,
                ),
                CalculatorButton(
                  buttonName: "2",
                  buttonColor: Color(0xff000000),
                  onClick: onDigitClick,
                ),
                CalculatorButton(
                  buttonName: "3",
                  buttonColor: Color(0xff000000),
                  onClick: onDigitClick,
                ),
                CalculatorButton(
                  buttonName: "+",
                  buttonColor: Color(0xff0087f3),
                  onClick: onOperatorClick,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalculatorButton(
                  buttonName: "0",
                  buttonColor: Color(0xff000000),
                  onClick: onDigitClick,
                ),
                CalculatorButton(
                  buttonName: ".",
                  buttonColor: Color(0xff000000),
                  onClick: onDigitClick,
                ),
                CalculatorButton(
                  buttonName: "del",
                  buttonColor: Color(0xff0087f3),
                  onClick: onDeleteClick,
                ),
                CalculatorButton(
                  buttonName: "=",
                  buttonColor: Color(0xff0087f3),
                  onClick: onEqualClick,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  onEqualClick() {
    setState(() {
      resultText =
          calculate(double.parse(lhs), operator, double.parse(resultText));
      lhs = "";
      operator = "";
    });
  }

  onDeleteClick() {
    setState(() {
      lhs = "";
      operator = "";
    });
  }

  onCDeleteClick() {
    setState(() {
      resultText = "";
      lhs = "";
      operator = "";
    });
  }

  onDigitClick(String digit) {
    if (digit == "." && resultText.contains(".")) {
      return;
    }
    setState(() {
      resultText += digit;
    });
  }

  String operator = "";
  String lhs = "";
  onOperatorClick(String clickedOperator) {
    if (operator != "") {
      return;
    }

    if (operator.isEmpty) {
      lhs = resultText;
      operator = clickedOperator;
    } else {
      ///  lhs --> lhs
      ///  operator --> operator
      ///  rhs --> resultText
      lhs = calculate(double.parse(lhs), operator, double.parse(resultText));
      operator = clickedOperator;
    }
    setState(() {
      resultText = "";
    });

    print("lhs: $lhs, saved operator: $operator");
  }

  String calculate(double lhs, String operator, double rhs) {
    if (operator == "+") {
      return (lhs + rhs).toString();
    } else if (operator == "-") {
      return (lhs - rhs).toString();
    } else if (operator == "X") {
      return (lhs * rhs).toStringAsFixed(4);
    } else if (operator == "/") {
      return (lhs / rhs).toStringAsFixed(4);
    } else {
      return (lhs % rhs).toString();
    }
  }
}
