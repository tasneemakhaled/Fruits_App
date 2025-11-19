import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fruit_app/core/utils/constants.dart';
import 'package:fruit_app/features/SellerStore/presentation/views/widgets/custom_product.dart';
import 'package:fruit_app/features/home/presentation/views/widgets/custom_seller.dart';
import 'package:fruit_app/features/productDetails/presentation/views/product_details.dart';

class SellerStore extends StatelessWidget {
  const SellerStore({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
        title: Text(
          'Fruit Market',
          style: TextStyle(color: pColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CustomSeller(),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Categories',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Image.asset('assets/images/multiFruits.png'),
                    Text('Fruits'),
                  ],
                ),
                Column(
                  children: [
                    Image.asset('assets/images/vegetables.png'),
                    Text('Vegetables'),
                  ],
                ),
                Column(
                  children: [
                    Image.asset('assets/images/phone.png'),
                    Text('phone'),
                  ],
                ),
                Column(
                  children: [
                    Image.asset('assets/images/pet.png'),
                    Text('Pets'),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Text('Products', style: TextStyle(fontWeight: FontWeight.bold)),
                Spacer(),
                Icon(FontAwesomeIcons.arrowDownShortWide),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 2,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return ProductDetails();
                          },
                        ),
                      );
                    },
                    child: CustomProduct(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
