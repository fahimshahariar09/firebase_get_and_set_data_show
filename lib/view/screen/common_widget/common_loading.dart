import 'package:flutter/material.dart';

class CommonLoading extends StatelessWidget {
  const CommonLoading({
    super.key,
    this.buttonHeight,
    this.buttonWidth,
    this.fColor,
  });

  final double? buttonHeight;
  final double? buttonWidth;
  final Color? fColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: buttonHeight ?? 45,
        width: buttonWidth ?? MediaQuery.sizeOf(context).width,
        child: CircularProgressIndicator(
          backgroundColor: Colors.white,
          color: fColor ?? Colors.red,
        ),
      ),
    );
  }
}
