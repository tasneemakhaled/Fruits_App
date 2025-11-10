import 'package:flutter/material.dart';

class CustomBasketCard extends StatelessWidget {
  const CustomBasketCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                border: Border.all(color: Colors.grey.shade100),
              ),
              child: ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(32),
                child: Image.asset('assets/images/vegetables.png'),
              ),
            ),
            Column(
              children: [
                Text(
                  'Product Name,',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Text('12.00KD'),
                    Text(
                      '14.00Kd',
                      style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xffDF958F),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'Up To 10%',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),

            Column(
              children: [
                IconButton(onPressed: () {}, icon: Icon(Icons.delete_forever)),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Icon(Icons.remove), Text('1'), Icon(Icons.add)],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
