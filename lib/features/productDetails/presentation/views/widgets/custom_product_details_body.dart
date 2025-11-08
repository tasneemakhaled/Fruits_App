import 'package:flutter/material.dart';
import 'package:fruit_app/core/utils/constants.dart';
import 'package:fruit_app/features/productDetails/presentation/views/widgets/custom_expansion_tile.dart';

class CustomProductDetailsBody extends StatelessWidget {
  const CustomProductDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                // alignment: Alignment.topRight,
                children: [
                  Image.asset('assets/images/fruit_shop.png'),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text('10 % Off Discount'),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Category Name',
                      style: TextStyle(
                        color: pColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  Align(
                    alignment: Alignment.centerRight,
                    child: Text('Price', style: TextStyle()),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Product Name',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),

                  Row(
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          'KD1200',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(width: 8),
                      Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          'KD1400',
                          style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
                style: TextStyle(color: Colors.grey),
              ),

              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Sell Per : Kartoon',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              CustomExpansionTile(),
              Align(
                alignment: Alignment.bottomRight,
                child: SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: pColor),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.shopping_basket, color: Colors.white),
                        Text(
                          'Add To Cart',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
  }
}