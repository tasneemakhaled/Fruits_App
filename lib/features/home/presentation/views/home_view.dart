import 'package:flutter/material.dart';
import 'package:fruit_app/core/utils/constants.dart';
import 'package:fruit_app/features/home/presentation/views/widgets/custom_bottom_navigation_bar.dart';
import 'package:fruit_app/features/home/presentation/views/widgets/custom_seller.dart';
import 'package:fruit_app/features/search/presentation/views/search_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return SearchView();
                  },
                ),
              );
            },
            icon: Icon(Icons.search),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.tune)),
        ],
        title: Text(
          'Fruit Market',
          style: TextStyle(
            color: pColor,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.asset('assets/images/firstPhoto.png'),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset('assets/images/resturants.png'),
                Image.asset('assets/images/farms.png'),
                Image.asset('assets/images/coffee.png'),
                Image.asset('assets/images/pharmasy.png'),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Sellers', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('Show All', style: TextStyle(color: Colors.blue)),
              ],
            ),

            CustomSeller(),

            CustomSeller(),
          ],
        ),
      ),
    );
  }
}
