import 'package:flutter/material.dart';

class FilterWidget extends StatefulWidget {
  const FilterWidget({super.key});

  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  // المتغيرات لحفظ حالة الفلتر
  String selectedArea = 'All Areas';
  bool isOffersSelected = false;
  bool isFreeDeliverySelected = true;

  // الألوان المستخرجة من التصميم
  final Color kDarkGreen = const Color(0xFF2D5F47);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      backgroundColor: Colors.white,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. العنوان
            const Center(
              child: Text(
                'Filter by',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // 2. نص Delivered To مع الأيقونة
            Row(
              children: [
                Text(
                  'Delivered To',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(width: 6),
                Icon(
                  Icons.local_shipping_outlined,
                  size: 16,
                  color: Colors.grey.shade500,
                ),
              ],
            ),
            const SizedBox(height: 12),

            // 3. القائمة المنسدلة (Dropdown)
            Container(
              height: 45,
              padding: const EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300, width: 1.5),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: selectedArea,
                  isExpanded: true,
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.grey.shade700,
                    size: 24,
                  ),
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                    fontWeight: FontWeight.w400,
                  ),
                  items: ['All Areas', 'Cairo', 'Giza'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedArea = value!;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),

            // 4. خيار Offers
            _buildFilterOption(
              title: 'Offers',
              isSelected: isOffersSelected,
              onTap: () {
                setState(() {
                  isOffersSelected = !isOffersSelected;
                });
              },
            ),

            const SizedBox(height: 8),

            // 5. خيار Free Delivery
            _buildFilterOption(
              title: 'Free Delivery',
              isSelected: isFreeDeliverySelected,
              onTap: () {
                setState(() {
                  isFreeDeliverySelected = !isFreeDeliverySelected;
                });
              },
            ),
            const SizedBox(height: 24),

            // 6. زر Apply Filter
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: kDarkGreen,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context, {
                    'area': selectedArea,
                    'offers': isOffersSelected,
                    'freeDelivery': isFreeDeliverySelected,
                  });
                },
                child: const Text(
                  'Apply Filter',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),

            // 7. زر Close
            Center(
              child: InkWell(
                onTap: () => Navigator.pop(context),
                borderRadius: BorderRadius.circular(8),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 6.0,
                  ),
                  child: Text(
                    'Close',
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ويدجت فرعية لرسم خيارات الاختيار
  Widget _buildFilterOption({
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Row(
          children: [
            // رسم الدائرة - فاضية أو فيها صح أخضر
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey.shade400, width: 2),
              ),
              child: isSelected
                  ? Center(
                      child: Icon(Icons.check, size: 16, color: kDarkGreen),
                    )
                  : null,
            ),
            const SizedBox(width: 12),
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black87,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
