import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/core/cubits/cubit/get_favourite_products_cubit.dart';
import 'package:fruit_app/core/utils/constants.dart';
import 'package:fruit_app/core/utils/models/get_favourite_products_model/datum_favourite.dart';

class FavouriteView extends StatelessWidget {
  const FavouriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // تشغيل الجلب فور فتح الصفحة
      create: (context) => FavouriteProductsCubit()..getFavouriteProducts(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            'Favourite',
            style: TextStyle(color: pColor, fontWeight: FontWeight.bold),
          ),
        ),
        body: BlocBuilder<FavouriteProductsCubit, FavouriteProductsState>(
          builder: (context, state) {
            if (state is FavouriteProductsSuccess) {
              final productsList = state.favouriteProducts;
              
              if (productsList.isEmpty) {
                return const Center(child: Text("No Favourites yet."));
              }

              return ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: productsList.length, // العدد الحقيقي من السيرفر
                itemBuilder: (context, index) {
                  return _buildFavouriteCard(productsList[index]);
                },
              );
            } else if (state is FavouriteProductsFailure) {
              return Center(child: Text(state.errMessage));
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }

  Widget _buildFavouriteCard(DatumFavourite item) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                'assets/images/vegetables.png',
                height: 80,
                width: 80,
              ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.product?.nameEn ?? 'No Name',
                      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "${ item.product!.price} KD",
                      style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.cancel, color: Colors.red, size: 22),
            ],
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:fruit_app/core/cubits/cubit/get_favourite_products_cubit.dart';
// import 'package:fruit_app/core/utils/constants.dart';
// import 'package:fruit_app/core/utils/models/get_favourite_products_model/datum_favourite.dart';
// import 'package:fruit_app/core/utils/models/product_model/datum.dart';

// class FavouriteView extends StatefulWidget {
//   const FavouriteView({super.key});

//   @override
//   State<FavouriteView> createState() => _FavouriteViewState();
// }

// class _FavouriteViewState extends State<FavouriteView> {
//   Datum favouriteModel = Datum();

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => FavouriteProductsCubit()..getFavouriteProducts(),
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//           forceMaterialTransparency: true,
//           backgroundColor: Colors.white,
//           centerTitle: true,
//           title: Text(
//             'Favourite',
//             style: TextStyle(color: pColor, fontWeight: FontWeight.bold),
//           ),
//         ),
//         body: BlocConsumer<FavouriteProductsCubit, FavouriteProductsState>(
//           listener: (context, state) {
           
//           },
//           builder: (context, state) {
//             return OrientationBuilder(
//               builder: (context, orientation) {
//                 return orientation == Orientation.portrait
//                     ? ListView.builder(
//                         padding: EdgeInsets.all(8),
//                         itemCount: 6,
//                         itemBuilder: (context, index) {
//                           return _buildFavouriteCard();
//                         },
//                       )
//                     : GridView.builder(
//                         padding: EdgeInsets.all(8),
//                         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                           crossAxisCount: 2,
//                           childAspectRatio: 2.5,
//                           crossAxisSpacing: 10,
//                           mainAxisSpacing: 10,
//                         ),
//                         itemCount: 6,
//                         itemBuilder: (context, index) {
//                           return _buildFavouriteCard();
//                         },
//                       );
//               },
//             );
//           },
//         ),
//       ),
//     );
//   }

//   Widget _buildFavouriteCard() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4.0),
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20),
//           color: Colors.white,
//           border: Border.all(color: Colors.grey.shade200),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(12.0),
//           child: Row(
//             children: [
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(10),
//                 child: Image.asset(
//                   'assets/images/vegetables.png',
//                   height: 70,
//                   width: 70,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               SizedBox(width: 12),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       favouriteModel.nameEn??'no name',
//                       style: TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.bold,
//                       ),
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                     SizedBox(height: 4),
//                     Row(
//                       children: [
//                         Text(
//                           favouriteModel.price.toString(),
//                           style: TextStyle(
//                             fontSize: 13,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                         Text(
//                           favouriteModel.price.toString(),
//                           style: TextStyle(
//                             color: Colors.grey,
//                             decoration: TextDecoration.lineThrough,
//                             fontSize: 12,
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 4),
//                     Text(
//                       'Store Name : Store 1',
//                       style: TextStyle(
//                         fontSize: 12,
//                         color: Colors.grey.shade600,
//                       ),
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                   ],
//                 ),
//               ),
//               Icon(Icons.cancel, color: Colors.grey.shade300, size: 22),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
