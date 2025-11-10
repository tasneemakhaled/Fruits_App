import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

class CheckoutHeader extends StatefulWidget {
  const CheckoutHeader({super.key});

  @override
  State<CheckoutHeader> createState() => _CheckoutHeaderState();
}

class _CheckoutHeaderState extends State<CheckoutHeader> {
  bool isTimeSelected = false;

  bool isAddressSelected = false;

  bool isPaymentSelected = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
          onTap: () {
            isTimeSelected = !isTimeSelected;
            setState(() {});
          },
          child: Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey, width: 2),
            ),
            child: Center(
              child: Container(
                width: isTimeSelected ? 8 : 0,
                height: isTimeSelected ? 8 : 0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
        DottedLine(
          dashColor: Colors.grey,
          dashGapLength: 3,
          dashLength: 8,
          lineLength: 130,
          direction: Axis.horizontal,
        ),
        InkWell(
          onTap: () {
            isAddressSelected = !isAddressSelected;
            setState(() {});
          },
          child: Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey, width: 2),
            ),
            child: Center(
              child: Container(
                width: isAddressSelected ? 8 : 0,
                height: isAddressSelected ? 8 : 0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
        DottedLine(
          dashColor: Colors.grey,
          dashGapLength: 3,
          dashLength: 8,
          lineLength: 130,
          direction: Axis.horizontal,
        ),
        InkWell(
          onTap: () {
            isPaymentSelected = !isPaymentSelected;
            setState(() {});
          },
          child: Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey, width: 2),
            ),
            child: Center(
              child: Container(
                width: isPaymentSelected ? 8 : 0,
                height: isPaymentSelected ? 8 : 0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
