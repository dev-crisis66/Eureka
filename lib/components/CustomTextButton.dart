import 'package:flutter/material.dart';
import '../utils.dart';

class CustomTextButton extends StatelessWidget {
  final String? text;
  final Color? textColor;
  final Function() onPressed;

  const CustomTextButton(
      {super.key, this.text, this.textColor, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: Colors.transparent,
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
