import 'package:flutter/material.dart';
import 'package:fruit_app/core/utils/constants.dart';


class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.prefixIcon,
    required this.text,
    this.textColor,
    this.onPressed,
    this.buttonColor,
  });
  final Icon? prefixIcon;
  final String text;
  final Color? textColor;
  final void Function()? onPressed;
  final Color? buttonColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom( backgroundColor: buttonColor ?? pColor, // يحدد لون الخلفية
  foregroundColor: textColor ?? Colors.white, ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (prefixIcon != null) prefixIcon!,
          SizedBox(width: 10),
          Text(text, style: TextStyle(color: textColor)),
        ],
      ),
    );
  }
}
