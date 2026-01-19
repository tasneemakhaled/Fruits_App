import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fruit_app/core/cubits/cubit/products_cubit.dart';
import 'package:fruit_app/core/utils/constants.dart';
import 'package:fruit_app/features/SellerStore/presentation/views/widgets/custom_product.dart';
import 'package:fruit_app/features/home/presentation/views/widgets/custom_seller.dart';
import 'package:fruit_app/features/productDetails/presentation/views/product_details.dart';

class SellerStore extends StatelessWidget {
  const SellerStore({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit()..getProducts(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search, color: Colors.black),
            ),
          ],
          title: Text(
            'Fruit Market',
            style: TextStyle(color: pColor, fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const CustomSeller(),
              const SizedBox(height: 10),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Categories',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildCategoryItem('assets/images/multiFruits.png', 'Fruits'),
                  _buildCategoryItem(
                    'assets/images/vegetables.png',
                    'Vegetables',
                  ),
                  _buildCategoryItem('assets/images/phone.png', 'Phone'),
                  _buildCategoryItem('assets/images/pet.png', 'Pets'),
                ],
              ),
              const SizedBox(height: 20),
              const Row(
                children: [
                  Text(
                    'Products',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Spacer(),
                  Icon(FontAwesomeIcons.arrowDownShortWide),
                ],
              ),
              const SizedBox(height: 10),
              Expanded(
                child: BlocBuilder<ProductsCubit, ProductsState>(
                  builder: (context, state) {
                    if (state is ProductsSuccess) {
                      // استخراج قائمة المنتجات من الموديل
                      final productsList = state.productModel.data?.data ?? [];

                      if (productsList.isEmpty) {
                        return const Center(
                          child: Text('No products available'),
                        );
                      }

                      return ListView.builder(
                        itemCount: productsList.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>  ProductDetails(product:  productsList[index],),
                                ),
                              );
                            },
                            child: CustomProduct(product: productsList[index]),
                          );
                        },
                      );
                    } else if (state is ProductsFailure) {
                      return Center(child: Text(state.errMessage));
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ويدجت صغير للكود المكرر في الكاتيجوري
  Widget _buildCategoryItem(String image, String label) {
    return Column(
      children: [
        Image.asset(image, height: 50, width: 50),
        const SizedBox(height: 4),
        Text(label),
      ],
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:fruit_app/core/utils/constants.dart';
// import 'package:fruit_app/features/SellerStore/presentation/views/widgets/custom_product.dart';
// import 'package:fruit_app/features/home/presentation/views/widgets/custom_seller.dart';
// import 'package:fruit_app/features/productDetails/presentation/views/product_details.dart';

// class SellerStore extends StatelessWidget {
//   const SellerStore({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
//         title: Text(
//           'Fruit Market',
//           style: TextStyle(color: pColor, fontWeight: FontWeight.bold),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//             CustomSeller(),
//             Align(
//               alignment: Alignment.topLeft,
//               child: Text(
//                 'Categories',
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Column(
//                   children: [
//                     Image.asset('assets/images/multiFruits.png'),
//                     Text('Fruits'),
//                   ],
//                 ),
//                 Column(
//                   children: [
//                     Image.asset('assets/images/vegetables.png'),
//                     Text('Vegetables'),
//                   ],
//                 ),
//                 Column(
//                   children: [
//                     Image.asset('assets/images/phone.png'),
//                     Text('phone'),
//                   ],
//                 ),
//                 Column(
//                   children: [
//                     Image.asset('assets/images/pet.png'),
//                     Text('Pets'),
//                   ],
//                 ),
//               ],
//             ),
//             Row(
//               children: [
//                 Text('Products', style: TextStyle(fontWeight: FontWeight.bold)),
//                 Spacer(),
//                 Icon(FontAwesomeIcons.arrowDownShortWide),
//               ],
//             ),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: 2,
//                 itemBuilder: (context, index) {
//                   return GestureDetector(
//                     onTap: () {
//                       Navigator.of(context).push(
//                         MaterialPageRoute(
//                           builder: (context) {
//                             return ProductDetails();
//                           },
//                         ),
//                       );
//                     },
//                     child: CustomProduct(),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
