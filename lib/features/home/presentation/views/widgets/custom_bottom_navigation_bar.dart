import 'package:flutter/material.dart';
import 'package:fruit_app/core/utils/constants.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,

      backgroundColor: pColor,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home, color: Colors.white),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.format_list_bulleted, color: Colors.white),
          label: 'List',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart, color: Colors.white),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border, color: Colors.white),
          label: 'Favorites',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu, color: Colors.white),
          label: 'Menu',
        ),
      ],
    );
  }
}
