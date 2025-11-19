import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import 'package:fruit_app/core/utils/constants.dart';
import 'package:fruit_app/features/favourite/presentation/views/favourite_view.dart';

import 'package:fruit_app/features/productDetails/presentation/views/widgets/custom_product_details_body.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return FavouriteView();
                  },
                ),
              );
            },
            icon: Icon(Icons.favorite_border),
          ),
          IconButton(onPressed: () {}, icon: Icon(FeatherIcons.share)),
        ],
        title: Text(
          'Fruit Market',
          style: TextStyle(color: pColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: CustomProductDetailsBody(),
    );
  }
}
