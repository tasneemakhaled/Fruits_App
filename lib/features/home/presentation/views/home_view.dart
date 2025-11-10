import 'package:flutter/material.dart';
import 'package:fruit_app/core/utils/constants.dart';

import 'package:fruit_app/features/home/presentation/views/widgets/home_body.dart';

import 'package:fruit_app/features/search/presentation/views/search_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: HomeBody(),
    );
  }
}
