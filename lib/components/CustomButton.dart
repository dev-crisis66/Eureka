import 'package:flutter/material.dart';
import '../utils.dart';

class CustomButton extends StatelessWidget {
  final Color? backgroundColor;
  final String? text;
  final Color? textColor;
  final Function() onPressed;

  const CustomButton(
      {super.key,
      this.backgroundColor,
      this.text,
      this.textColor,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text!,
          style: TextStyle(color: textColor, fontSize: 16),
        ),
      ),
    );
  }
}
