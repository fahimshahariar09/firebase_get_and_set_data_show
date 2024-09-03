import 'package:firebase/view/screen/common_widget/common_text.dart';
import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  const CommonButton(
      {super.key,
      required this.buttonName,
      this.buttonHeight,
      this.buttonWidget,
      this.buttonColor,
      this.textColor,
      required this.onTap});

  final String buttonName;
  final double? buttonHeight;
  final double? buttonWidget;
  final Color? buttonColor;
  final Color? textColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        color: buttonColor ?? Colors.orange,
        child: SizedBox(
          height: buttonHeight ?? 50,
          width: buttonWidget ?? MediaQuery.sizeOf(context).width,
          child: Center(
            child: CommonText(
              titel: buttonName,
              fColor: textColor ?? Colors.white,
              fSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
