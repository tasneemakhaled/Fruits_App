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
// }
import 'package:flutter/material.dart';
import 'package:fruit_app/core/utils/constants.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int currentIndex = 0;

  final List<IconData> icons = [
    Icons.home,
    Icons.format_list_bulleted,
    Icons.shopping_basket_outlined,
    Icons.favorite_border,
    Icons.menu,
  ];

  final List<String> labels = ["Home", "List", "Cart", "Favorite", "Menu"];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: pColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(icons.length, (i) {
          bool isSelected = currentIndex == i;
          return GestureDetector(
            onTap: () => setState(() => currentIndex = i),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                color: isSelected ? Colors.white : Colors.transparent,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    icons[i],
                    color: isSelected ? pColor : Colors.white,
                    size: 24,
                  ),
                  if (isSelected) ...[
                    const SizedBox(width: 6),
                    Text(
                      labels[i],
                      style: TextStyle(
                        color: pColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
