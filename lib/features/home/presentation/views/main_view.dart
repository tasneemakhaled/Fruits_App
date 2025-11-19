import 'package:flutter/material.dart';
import 'package:fruit_app/features/basket/presentation/views/basket_view.dart';
import 'package:fruit_app/features/favourite/presentation/views/favourite_view.dart';
import 'package:fruit_app/features/home/presentation/views/home_view.dart';
import 'package:fruit_app/features/home/presentation/views/widgets/custom_bottom_navigation_bar.dart';
import 'package:fruit_app/features/orders/presentation/views/orders_view.dart';
import 'package:fruit_app/features/setting/presentation/views/setting_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentIndex = 0;

  final List<Widget> pages = [
    HomeView(),
    OrdersView(),
    BasketView(),
    FavouriteView(),
    SettingView(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: pages[currentIndex],
        bottomNavigationBar: CustomBottomNavigationBar(
          // currentIndex: currentIndex,
          // onTap: (index) {
          //   currentIndex = index;
          //   setState(() {});
          // },
        ),
      ),
    );
  }
}
