import 'package:flutter/material.dart';
import 'package:fruit_app/core/utils/models/product_model/datum.dart';

class CustomProduct extends StatelessWidget {
  final Datum product; // استقبال بيانات منتج واحد

  const CustomProduct({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
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
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/images/vegetables.png',
                height: 80,
                width: 80,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.nameEn ?? product.name ?? 'No Name',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('${product.price ?? 0.0} \$'),
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffDF958F),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: Text(
                      'Up to 10% Off',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Image.asset('assets/images/cart.png'),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:fruit_app/core/cubits/cubit/products_cubit.dart';
// import 'package:fruit_app/core/utils/models/product_model/datum.dart';
// import 'package:fruit_app/core/utils/models/product_model/product_model.dart';

// class CustomProduct extends StatefulWidget {
//   const CustomProduct({super.key});

//   @override
//   State<CustomProduct> createState() => _CustomProductState();
// }

// class _CustomProductState extends State<CustomProduct> {
//  Datum productModel=Datum();

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => ProductsCubit(),
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20),
//           color: Colors.white,
//           border: Border.all(color: Colors.grey.shade200),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               ClipRRect(
//                 borderRadius: BorderRadiusGeometry.circular(10),
//                 child: Image.asset(
//                   'assets/images/vegetables.png',
//                   height: 80,
//                   width: 80,
//                 ),
//               ),
//               BlocConsumer<ProductsCubit, ProductsState>(
//                 listener: (context, state) {
//                   if (state is ProductsFailure) {
//                     Center(child: Text('Error Loading products'));
//                   }
//                 },
//                 builder: (context, state) {
//                   return state is ProductsLoading
//                       ? CircularProgressIndicator()
//                       : Column(
//                           children: [
//                             Text(
//                               productModel.nameEn!,
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             Text(productModel.price.toString()),
//                             Container(
//                               decoration: BoxDecoration(
//                                 color: Color(0xffDF958F),
//                                 borderRadius: BorderRadius.circular(16),
//                               ),
//                               child: Padding(
//                                 padding: const EdgeInsets.all(4.0),
//                                 child: Text(
//                                   'Up to 10% Off',
//                                   style: TextStyle(color: Colors.white),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         );
//                 },
//               ),
//               Image.asset('assets/images/cart.png'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
