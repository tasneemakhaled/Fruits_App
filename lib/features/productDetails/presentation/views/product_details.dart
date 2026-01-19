import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:fruit_app/core/cubits/cubit/add_products_to_favourites_cubit.dart';
import 'package:fruit_app/core/utils/constants.dart';
import 'package:fruit_app/core/utils/models/product_model/datum.dart'; // تأكد من استيراد موديل المنتج
import 'package:fruit_app/features/productDetails/presentation/views/widgets/custom_product_details_body.dart';

class ProductDetails extends StatefulWidget {
  final Datum product; // استقبال المنتج من صفحة المتجر
  const ProductDetails({super.key, required this.product});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  bool isFavourite = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddProductsToFavouritesCubit(), // إنشاء الكيوبيت بدون تشغيل تلقائي
      child: BlocConsumer<AddProductsToFavouritesCubit, AddProductsToFavouritesState>(
        listener: (context, state) {
          if (state is AddProductsToFavouritesSuccess) {
            setState(() => isFavourite = !isFavourite); // تبديل الحالة عند النجاح
            ScaffoldMessenger.of(context).showSnackBar(
               SnackBar(content: Text(isFavourite ? 'Added to Favourites' : 'Removed from Favourites'))
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: Text('Fruit Market', style: TextStyle(color: pColor, fontWeight: FontWeight.bold)),
              actions: [
                IconButton(
                  onPressed: () {
                    // نرسل طلب للسيرفر عند الضغط فقط
                    context.read<AddProductsToFavouritesCubit>().addProductToFavourites(
                      favProductId: widget.product.id!,
                    );
                  },
                  icon: Icon(
                    isFavourite ? Icons.favorite : Icons.favorite_border, // القلب الأحمر الممتلئ
                    color: isFavourite ? Colors.red : Colors.grey,
                  ),
                ),
                IconButton(onPressed: () {}, icon: const Icon(FeatherIcons.share)),
              ],
            ),
            body: CustomProductDetailsBody(product: widget.product), // مررنا المنتج هنا
          );
        },
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_feather_icons/flutter_feather_icons.dart';
// import 'package:fruit_app/core/cubits/cubit/add_products_to_favourites_cubit.dart';

// import 'package:fruit_app/core/utils/constants.dart';
// import 'package:fruit_app/core/utils/models/get_favourite_products_model/datum_favourite.dart';
// import 'package:fruit_app/core/utils/models/product_model/datum.dart';
// import 'package:fruit_app/features/favourite/presentation/views/favourite_view.dart';

// import 'package:fruit_app/features/productDetails/presentation/views/widgets/custom_product_details_body.dart';

// class ProductDetails extends StatefulWidget {
//   const ProductDetails({super.key});

//   @override
//   State<ProductDetails> createState() => _ProductDetailsState();
// }

// class _ProductDetailsState extends State<ProductDetails> {
  
//  final Datum favourite ;
//   bool isFavouite=false;

//   _ProductDetailsState(this.favourite);
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) =>
//           AddProductsToFavouritesCubit()
//             ..addProductToFavourites(favProductId: favourite.id!),
//       child: BlocConsumer<AddProductsToFavouritesCubit, AddProductsToFavouritesState>(
//         listener: (context, state) {
//           if (state is AddProductsToFavouritesSuccess){
//             ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Product is added to favourites Successfully')));
            
//           }else if (state is AddProductsToFavouritesFailure){
//              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to add Product to favourits')));
//           }
//         },
//         builder: (context, state) {
//           return Scaffold(
//             backgroundColor: Colors.white,
//             appBar: AppBar(
//               backgroundColor: Colors.white,
//               actions: [
//                 IconButton(
//                   onPressed: () {
//                   isFavouite=true;
//                     // Navigator.of(context).push(
//                     //   MaterialPageRoute(
//                     //     builder: (context) {
//                     //       return FavouriteView();
//                     //     },
//                     //   ),
//                     // );
//                   },
//                   icon:Icon(Icons.favorite_border,color: isFavouite?Colors.red:null,),
//                 ),
//                 IconButton(onPressed: () {}, icon: Icon(FeatherIcons.share)),
//               ],
//               title: Text(
//                 'Fruit Market',
//                 style: TextStyle(color: pColor, fontWeight: FontWeight.bold),
//               ),
//             ),
//             body: CustomProductDetailsBody(product: favourite,),
//           );
//         },
//       ),
//     );
//   }
// }
