import 'package:flutter/material.dart';
import 'package:fruit_app/core/utils/constants.dart';


// ignore: must_be_immutable
class CustomBottomNavigationBar extends StatelessWidget {
  CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });
  int currentIndex = 0;
  final Function(int) onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      decoration: BoxDecoration(
        color: pColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              onTap(0);
            },
            child: currentIndex == 0
                ? Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.home, color: Colors.black),
                        Text('Home', style: TextStyle(color: Colors.black)),
                      ],
                    ),
                  )
                : Icon(Icons.home, color: Colors.white),
          ),
          InkWell(
            onTap: () {
              onTap(1);
            },
            child: currentIndex == 1
                ? Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.format_list_bulleted, color: Colors.black),
                        Text('Orders', style: TextStyle(color: Colors.black)),
                      ],
                    ),
                  )
                : Icon(Icons.format_list_bulleted, color: Colors.white),
          ),
          InkWell(
            onTap: () {
              onTap(2);
            },
            child: currentIndex == 2
                ? Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.shopping_cart, color: Colors.black),
                        Text('Basket', style: TextStyle(color: Colors.black)),
                      ],
                    ),
                  )
                : Icon(Icons.shopping_cart, color: Colors.white),
          ),
          InkWell(
            onTap: () {
              onTap(3);
            },
            child: currentIndex == 3
                ? Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.favorite_border, color: Colors.black),
                        Text(
                          'Favourites',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  )
                : Icon(Icons.favorite_border, color: Colors.white),
          ),
          InkWell(
            onTap: () {
              onTap(4);
            },
            child: currentIndex == 4
                ? Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.menu, color: Colors.black),
                        Text('More', style: TextStyle(color: Colors.black)),
                      ],
                    ),
                  )
                : Icon(Icons.menu, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

























// // import 'package:flutter/material.dart';
// import 'package:fruit_app/core/utils/constants.dart';

// class CustomBottomNavigationBar extends StatelessWidget {
//   const CustomBottomNavigationBar({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       showSelectedLabels: true,
//       showUnselectedLabels: false,
//       backgroundColor: pColor,
//       type: BottomNavigationBarType.fixed,
//       items: const [
//         BottomNavigationBarItem(
//           icon: Icon(Icons.home, color: Colors.white),
//           label: 'Home',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.format_list_bulleted, color: Colors.white),
//           label: 'List',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.shopping_cart, color: Colors.white),
//           label: 'Cart',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.favorite_border, color: Colors.white),
//           label: 'Favorites',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.menu, color: Colors.white),
//           label: 'Menu',
//         ),
//       ],
//     );
//   }
// // }
// import 'package:flutter/material.dart';
// import 'package:fruit_app/core/utils/constants.dart';

// class CustomBottomNavigationBar extends StatefulWidget {
//   @override
//   State<CustomBottomNavigationBar> createState() =>
//       _CustomBottomNavigationBarState();
// }

// class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
//   int currentIndex = 0;

//   final List<IconData> icons = [
//     Icons.home,
//     Icons.format_list_bulleted,
//     Icons.shopping_basket_outlined,
//     Icons.favorite_border,
//     Icons.menu,
//   ];

//   final List<String> labels = ["Home", "List", "Cart", "Favorite", "Menu"];

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(vertical: 8),
//       decoration: BoxDecoration(
//         color: pColor,
//         borderRadius: const BorderRadius.only(
//           topLeft: Radius.circular(25),
//           topRight: Radius.circular(25),
//         ),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: List.generate(icons.length, (i) {
//           bool isSelected = currentIndex == i;
//           return GestureDetector(
//             onTap: () {
            
//    setState(() {
//    currentIndex = i;
// } );
//             } ,
//             child: AnimatedContainer(
//               duration: const Duration(milliseconds: 250),
//               padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
//               decoration: BoxDecoration(
//                 color: isSelected ? Colors.white : Colors.transparent,
//                 borderRadius: BorderRadius.circular(25),
//               ),
//               child: Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Icon(
//                     icons[i],
//                     color: isSelected ? pColor : Colors.white,
//                     size: 24,
//                   ),
//                   if (isSelected) ...[
//                     const SizedBox(width: 6),
//                     Text(
//                       labels[i],
//                       style: TextStyle(
//                         color: pColor,
//                         fontWeight: FontWeight.w600,
//                         fontSize: 13,
//                       ),
//                     ),
//                   ],
//                 ],
//               ),
//             ),
//           );
//         }),
//       ),
//     );
//   }
// }
