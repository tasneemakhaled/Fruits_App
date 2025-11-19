import 'package:flutter/material.dart';
import 'package:fruit_app/core/utils/constants.dart';
import 'package:fruit_app/features/SellerStore/presentation/views/seller_store.dart';
import 'package:fruit_app/features/home/presentation/views/widgets/custom_seller.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    // 1. إضافة SingleChildScrollView هنا لجعل الشاشة كلها تقبل السكرول
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          left: 20,
          right: 20,
          bottom: 20, // إضافة مسافة في الأسفل
        ),
        child: Column(
          children: [
            // 1. جزء الصور المتحركة (Slider)
            SizedBox(
              height: 160,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: 4,
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      'assets/images/firstPhoto.png',
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 10),

            // 2. جزء النقط (Dots Indicator)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(4, (index) => buildDot(index: index)),
            ),

            const SizedBox(height: 24),

            // 3. الأقسام (Categories)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/images/resturants.png', width: 70),
                Image.asset('assets/images/farms.png', width: 70),
                Image.asset('assets/images/coffee.png', width: 70),
                Image.asset('assets/images/pharmasy.png', width: 70),
              ],
            ),

            const SizedBox(height: 24),

            // 4. عنوان Sellers
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Sellers',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'Show All',
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xff235C95),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // 5. قائمة البائعين (التعديل هنا)
            ListView.builder(
              // هذين السطرين هما الحل للمشكلة:
              shrinkWrap: true, // يجعل القائمة تأخذ مساحة عناصرها فقط
              physics:
                  const NeverScrollableScrollPhysics(), // يمنع السكرول الداخلي للقائمة ويعتمد على السكرول الرئيسي
              itemCount: 5,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                    bottom: 10,
                  ), // مسافة بين الكروت
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return const SellerStore(); // تأكد من وجود const إذا أمكن
                          },
                        ),
                      );
                    },
                    child: const CustomSeller(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDot({required int index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(right: 5),
      height: 8,
      width: 8,
      decoration: BoxDecoration(
        color: currentPage == index ? pColor : Colors.transparent,
        shape: BoxShape.circle,
        border: Border.all(color: currentPage == index ? pColor : Colors.grey),
      ),
    );
  }
}
