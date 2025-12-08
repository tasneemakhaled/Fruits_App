import 'package:flutter/material.dart';
import 'package:fruit_app/core/utils/constants.dart';
import 'package:fruit_app/features/basket/presentation/views/widgets/custom_basket_price.dart';

class BasketView extends StatelessWidget {
  BasketView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        forceMaterialTransparency: true,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Basket',
          style: TextStyle(color: pColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return SingleChildScrollView(
            child: Column(
              children: [
                orientation == Orientation.portrait
                    ? ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return _buildBasketCard();
                        },
                      )
                    : GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.all(8),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 2.5,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return _buildBasketCard();
                        },
                      ),
                CustomBasketPrice(),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildBasketCard() {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  border: Border.all(color: Colors.grey.shade100),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(32),
                  child: Image.asset('assets/images/vegetables.png'),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Product Name',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 2),
                      Row(
                        children: [
                          Text('12.00KD ', style: TextStyle(fontSize: 13)),
                          Text(
                            '14.00KD',
                            style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                              color: Colors.red,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 2),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xffDF958F),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          'Up To 10%',
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.delete_forever, size: 20),
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.grey.shade300),
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.remove, size: 14),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6.0),
                          child: Text('1', style: TextStyle(fontSize: 12)),
                        ),
                        Icon(Icons.add, size: 14),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
