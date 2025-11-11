import 'package:flutter/material.dart';
import 'package:fruit_app/core/utils/constants.dart';

class FilterWidget extends StatelessWidget {
  const FilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 300,
        child: Column(
          children: [
            Text(
              'Filter By',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            DropdownButtonFormField(
              decoration: InputDecoration(border: OutlineInputBorder()),
              items: [DropdownMenuItem(child: Text('All Areas'))],
              onChanged: (value) {},
            ),
            RadioListTile(value: false, title: Text('Offers')),
            RadioListTile(value: false, title: Text('Free Delivery')),
            SizedBox(
              width: 250,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: pColor),
                onPressed: () {},
                child: Text(
                  'Apply Filter',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close', style: TextStyle(color: Colors.grey)),
            ),
          ],
        ),
      ),
    );
  }
}
