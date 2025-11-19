import 'package:flutter/material.dart';
import 'package:fruit_app/core/utils/constants.dart'; // تأكدي من استدعاء pColor

class CustomSeller extends StatelessWidget {
  const CustomSeller({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12), // مسافة داخلية للكارت
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade200), // لون حدود خفيف جداً
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1), // ظل خفيف
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start, // محاذاة للأعلى
        children: [
          // 1. صورة البائع
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage('assets/images/seller.png'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),

          const SizedBox(width: 12), // مسافة بين الصورة والنص
          // 2. النصوص (اسم البائع والتفاصيل)
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Seller name',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Delivery Charges : 0.5 KD',
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    // نقطة خضراء صغيرة (مفتوح)
                    Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                        color: pColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      'Open',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.green, // أو pColor
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      width: 4,
                      height: 4,
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'Beverages',
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // 3. التقييم والمسافة
          Column(
            crossAxisAlignment: CrossAxisAlignment.end, // محاذاة لليمين
            children: [
              const Text(
                '4.5',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20), // مسافة عشان تنزل تحت شوية
              Row(
                children: [
                  Text(
                    '2.5 KM',
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                  const SizedBox(width: 4),
                  Icon(Icons.location_on_outlined, size: 16, color: pColor),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
