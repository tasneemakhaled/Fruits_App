import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.buttonColor,
    this.prefixIcon,
    this.onPressed,
    this.text,
    this.textColor,
    this.hasBorder = true,
  });

  final Color? buttonColor;
  final Widget? prefixIcon;
  final VoidCallback? onPressed;
  final String? text;
  final Color? textColor;
  final bool hasBorder;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
          side: hasBorder
              ? BorderSide(color: Color(0xFFE6E9EA), width: 1)
              : BorderSide.none,
        ),
        padding: EdgeInsets.zero,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (prefixIcon != null) ...[
            SizedBox(width: 22, height: 22, child: prefixIcon),
            SizedBox(width: 12),
          ],
          Text(
            text!,
            style: TextStyle(color: textColor, fontSize: 13),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
