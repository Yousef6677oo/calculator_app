import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  String buttonName;
  Color buttonColor;
  Function onClick;
  CalculatorButton({required this.buttonName, required this.buttonColor,required this.onClick});
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.all(10),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              foregroundColor: buttonColor,
              backgroundColor: Color(0xfff8fafe),
              elevation: 5,
              shadowColor: Color(0xff707070),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              )),
          onPressed: () {
            if(buttonName=="="||buttonName=="del"||buttonName=="C"){
              onClick();
            }else{
              onClick(buttonName);
            }
          },
          child: Text(
            buttonName,
            style: TextStyle(
              fontSize: 28,
            ),
          )),
    ));
  }
}
