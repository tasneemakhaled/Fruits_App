import 'package:flutter/material.dart';
import 'package:fruit_app/core/utils/constants.dart';
import 'package:fruit_app/features/checkout/presentation/views/widgets/checkout_header.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        forceMaterialTransparency: true,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Checkout',
          style: TextStyle(color: pColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CheckoutHeader(),
      ),
    );
  }
}
