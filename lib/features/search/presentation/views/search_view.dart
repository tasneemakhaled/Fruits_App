import 'package:flutter/material.dart';
import 'package:fruit_app/core/utils/constants.dart';
import 'package:fruit_app/features/home/presentation/views/widgets/custom_bottom_navigation_bar.dart';
import 'package:fruit_app/features/search/presentation/views/widgets/filter_widget.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(),
      appBar: AppBar(
        title: Text(
          'Fruit Market',
          style: TextStyle(
            color: pColor,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [IconButton(onPressed: () {
          showModalBottomSheet(context: context, builder: (context){
            return FilterWidget();
          });
        }, icon: Icon(Icons.tune))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
                hintText: 'What are you Looking For ?',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
