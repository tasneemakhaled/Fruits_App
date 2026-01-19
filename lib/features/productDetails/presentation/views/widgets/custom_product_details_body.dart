import 'package:flutter/material.dart';
import 'package:fruit_app/core/utils/constants.dart';
import 'package:fruit_app/core/utils/models/product_model/datum.dart';
import 'package:fruit_app/features/productDetails/presentation/views/widgets/custom_expansion_tile.dart';

class CustomProductDetailsBody extends StatelessWidget {
  final Datum product; // استقبال المنتج
  const CustomProductDetailsBody({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                // صورة المنتج الحقيقية
               Image.asset('assets/images/fruit_shop.png'),
                
                Positioned(
                  top: 10, right: 10,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                    child: const Text('10 % Off Discount'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  product.name ?? 'Category', 
                  style: TextStyle(color: pColor, fontWeight: FontWeight.bold),
                ),
                const Text('Price', style: TextStyle(color: Colors.grey)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  product.nameEn ?? 'Product Name', 
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Row(
                  children: [
                    Text("${product.price} KD", style: const TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(width: 8),
                    const Text("1400 KD", style: TextStyle(decoration: TextDecoration.lineThrough, color: Colors.red)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              product.detailsEn ?? 'No description available for this product.',
              style: const TextStyle(color: Colors.grey),
            ),
            const CustomExpansionTile(),
            const SizedBox(height: 20),
            // زر الإضافة للسلة
            Align(
              alignment: Alignment.bottomRight,
              child: SizedBox(
                width: 150,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: pColor),
                  onPressed: () {},
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.shopping_basket, color: Colors.white),
                      Text('Add To Cart', style: TextStyle(color: Colors.white)),
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





// import 'package:flutter/material.dart';
// import 'package:fruit_app/core/utils/constants.dart';
// import 'package:fruit_app/core/utils/models/product_model/datum.dart';
// import 'package:fruit_app/features/productDetails/presentation/views/widgets/custom_expansion_tile.dart';

// class CustomProductDetailsBody extends StatelessWidget {
//   const CustomProductDetailsBody({super.key,required this.product});
//  final Datum product;
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: SingleChildScrollView(
//         child: Column(
//           children: [
//             Stack(
//               // alignment: Alignment.topRight,
//               children: [
//                 Image.asset('assets/images/fruit_shop.png'),
//                 Positioned(
//                   top: 10,
//                   right: 10,
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Text('10 % Off Discount'),
//                   ),
//                 ),
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Align(
//                   alignment: Alignment.topLeft,
//                   child: Text(
//                     'Category Name',
//                     style: TextStyle(
//                       color: pColor,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),

//                 Align(
//                   alignment: Alignment.centerRight,
//                   child: Text('Price', style: TextStyle()),
//                 ),
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Align(
//                   alignment: Alignment.topLeft,
//                   child: Text(product.nameEn ?? 'Product Name', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//                 ),

//                 Row(
//                   children: [
//                     Align(
//                       alignment: Alignment.topRight,
//                       child: Text(
//                         "${product.price} KD",
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                     SizedBox(width: 8),
//                     Align(
//                       alignment: Alignment.topRight,
//                       child: Text(
//                         'KD1400',
//                         style: TextStyle(
//                           decoration: TextDecoration.lineThrough,
//                           color: Colors.red,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),

//             Text(
//               product.detailsEn??'',
//               style: TextStyle(color: Colors.grey),
//             ),

//             Align(
//               alignment: Alignment.topLeft,
//               child: Text(
//                 'Sell Per : Kartoon',
//                 style: TextStyle(color: Colors.grey),
//               ),
//             ),
//             CustomExpansionTile(),
//             Align(
//               alignment: Alignment.bottomRight,
//               child: SizedBox(
//                 width: 150,
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(backgroundColor: pColor),
//                   onPressed: () {},
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Icon(Icons.shopping_basket, color: Colors.white),
//                       Text(
//                         'Add To Cart',
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
