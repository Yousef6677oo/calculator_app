import 'package:calculator/utilities/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/calculator_button.dart';
import '../provider/provider.dart';

class CalculatorScreen extends StatefulWidget {
  static String routeName = "Calculator Screen";

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String resultText = "";
  late ThemeMode currentTheme;

  @override
  Widget build(BuildContext context) {
    ThemeProvider provider = Provider.of(context);
    currentTheme = provider.currentTheme;
    Color numberButtonColor = colorNumber();
    Color operatorButtonColor = colorNumber();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Calculator",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: Column(
        children: [
          Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 10, 20, 0),
                    alignment: Alignment.topRight,
                    child: Transform.scale(
                      scale: 2.0,
                      child: Switch(
                          activeThumbImage: const AssetImage("assets/moon_dark.png"),
                          inactiveThumbImage: const AssetImage("assets/moon_light.png"),
                          activeColor: AppColor.whiteColorDark,
                          value: currentTheme == ThemeMode.dark,
                          onChanged: (onChanged) {
                            if (onChanged) {
                              provider.changeCurrentThemeToDark();
                            } else {
                              provider.changeCurrentThemeToLight();
                            }
                          }),
                    ),
                  ),
                  Spacer(),
                  Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                      alignment: Alignment.bottomRight,
                      width: double.infinity,
                      child: Text(
                        resultText,
                        style: Theme.of(context).textTheme.titleLarge,
                      )),
                ],
              )),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalculatorButton(
                  buttonName: "C",
                  buttonColor: colorOperator(),
                  onClick: onCDeleteClick,
                ),
                CalculatorButton(
                  buttonName: "+/-",
                  buttonColor: colorOperator(),
                  onClick: onOperatorClick,
                ),
                CalculatorButton(
                  buttonName: "%",
                  buttonColor: colorOperator(),
                  onClick: onOperatorClick,
                ),
                CalculatorButton(
                  buttonName: "/",
                  buttonColor: colorOperator(),
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
                  buttonColor: colorNumber(),
                  onClick: onDigitClick,
                ),
                CalculatorButton(
                  buttonName: "8",
                  buttonColor: colorNumber(),
                  onClick: onDigitClick,
                ),
                CalculatorButton(
                  buttonName: "9",
                  buttonColor: colorNumber(),
                  onClick: onDigitClick,
                ),
                CalculatorButton(
                  buttonName: "X",
                  buttonColor: colorOperator(),
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
                  buttonColor: colorNumber(),
                  onClick: onDigitClick,
                ),
                CalculatorButton(
                  buttonName: "5",
                  buttonColor: colorNumber(),
                  onClick: onDigitClick,
                ),
                CalculatorButton(
                  buttonName: "6",
                  buttonColor: colorNumber(),
                  onClick: onDigitClick,
                ),
                CalculatorButton(
                  buttonName: "-",
                  buttonColor: colorOperator(),
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
                  buttonColor: colorNumber(),
                  onClick: onDigitClick,
                ),
                CalculatorButton(
                  buttonName: "2",
                  buttonColor: colorNumber(),
                  onClick: onDigitClick,
                ),
                CalculatorButton(
                  buttonName: "3",
                  buttonColor: colorNumber(),
                  onClick: onDigitClick,
                ),
                CalculatorButton(
                  buttonName: "+",
                  buttonColor: colorOperator(),
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
                  buttonColor: colorNumber(),
                  onClick: onDigitClick,
                ),
                CalculatorButton(
                  buttonName: ".",
                  buttonColor: colorNumber(),
                  onClick: onDigitClick,
                ),
                CalculatorButton(
                  buttonName: "del",
                  buttonColor: colorOperator(),
                  onClick: onDeleteClick,
                ),
                CalculatorButton(
                  buttonName: "=",
                  buttonColor: colorOperator(),
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

  Color colorNumber() {
    if (currentTheme == ThemeMode.light) {
      return AppColor.blackColorLight;
    } else {
      return AppColor.whiteColorDark;
    }
  }

  Color colorOperator() {
    if (currentTheme == ThemeMode.light) {
      return AppColor.accentColorLight;
    } else {
      return AppColor.accentColorDark;
    }
  }
}
