import 'package:flutter/material.dart';
import 'package:fruit_app/core/utils/constants.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'My Orders',
          style: TextStyle(
            color: pColor,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),

      // ✅ محتاج ListView بس بدون ScrollView
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: _buildOrderItem(context),
            );
          },
        ),
      ),
    );
  }

  Widget _buildOrderItem(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 8,
            spreadRadius: 2,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // صورة المنتج
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              'assets/images/order.png',
              width: 70,
              height: 70,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.shopping_bag_outlined,
                    size: 40,
                    color: pColor,
                  ),
                );
              },
            ),
          ),

          const SizedBox(width: 12),

          // تفاصيل
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  '#243188 - 37 KD',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(height: 6),
                Text(
                  '9 Sep',
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
                SizedBox(height: 6),
                Text(
                  'Status: Delivering',
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          // أيقونة الحالة
          Image.asset(
            'assets/images/delivering.png',
            width: 50,
            height: 50,
            errorBuilder: (context, error, stackTrace) {
              return Icon(
                Icons.local_shipping_outlined,
                size: 50,
                color: Colors.orange,
              );
            },
          ),
        ],
      ),
    );
  }
}
