import 'package:flutter/material.dart';

class CustomSeller extends StatelessWidget {
  const CustomSeller({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset('assets/images/seller.png', height: 80, width: 80),
            Column(
              children: [
                Text(
                  'Seller name',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(' Delivery Charges : 0.5 KD'),
                Text('Open   Beverages'),
              ],
            ),
            Column(children: [Text('4.5'), Text('2.5 KM')]),
          ],
        ),
      ),
    );
  }
}
