import 'package:flutter/material.dart';
import 'package:fruit_app/core/utils/constants.dart';
import 'package:fruit_app/features/checkout/presentation/views/checkout_error.dart';

import 'package:fruit_app/features/checkout/presentation/views/widgets/way_of_payement.dart';

class PaymentWidget extends StatelessWidget {
  const PaymentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            'Coupon Code',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
        Stack(
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Do You Have Any Coupon Code?',
                hintStyle: TextStyle(fontSize: 15),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            Positioned(
              right: 8,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: pColor),
                onPressed: () {},
                child: Text('Apply', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            'Order Details',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Total Items'),
            Text(
              '4 Items in cart',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Subtotal'),
            Text(
              '36.00 KD',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Shipping Charges'),
            Text(
              '1.50 KD',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ],
        ),
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Bag Total',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
              '37.50 KD',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ],
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            'Payement',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        WayOfPayement(),
        // SizedBox(height: MediaQuery.sizeOf(context).height / 3),
        SizedBox(
          width: MediaQuery.sizeOf(context).width * (3.5 / 4),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: pColor),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return CheckoutError();
                  },
                ),
              );
            },
            child: Text('Place Order', style: TextStyle(color: Colors.white)),
          ),
        ),
      ],
    );
  }
}
