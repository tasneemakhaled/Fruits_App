import 'package:flutter/material.dart';
import 'package:fruit_app/core/utils/constants.dart';
import 'package:fruit_app/features/basket/presentation/views/widgets/custom_basket_card.dart';
import 'package:fruit_app/features/basket/presentation/views/widgets/custom_basket_price.dart';

class BasketView extends StatelessWidget {
  const BasketView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Basket',
          style: TextStyle(color: pColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(children: [CustomBasketCard(), CustomBasketCard()]),
            CustomBasketPrice(),
          ],
        ),
      ),
    );
  }
}
