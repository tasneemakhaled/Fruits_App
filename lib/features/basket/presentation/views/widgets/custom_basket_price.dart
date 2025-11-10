import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:fruit_app/core/utils/constants.dart';

class CustomBasketPrice extends StatelessWidget {
  const CustomBasketPrice({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(height: MediaQuery.sizeOf(context).height / 3),
          SizedBox(
            width: double.infinity, // هنا خلي العرض بطول الشاشة
            child: const DottedLine(
              dashColor: Colors.grey, // لون الخط
              lineThickness: 2, // سمك الخط
              dashLength: 6, // طول النقطة
              dashGapLength: 4, // المسافة بين النقاط
              direction: Axis.horizontal, // أفقي
            ),
          ),
          Row(children: [Text('Subtotal'), Spacer(), Text('36.00 KD')]),
          Row(children: [Text('Shipping Charges'), Spacer(), Text('1.50 KD')]),
          Row(children: [Text('Bag Total'), Spacer(), Text('37.50 KD')]),
          Row(
            children: [
              Column(children: [Text('4 items in cart'), Text('37.50 KD')]),
              Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: pColor),
                onPressed: () {},
                child: Text(
                  'Proceed to checkout',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
