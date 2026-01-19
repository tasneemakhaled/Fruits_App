// ============== AddressWidget ==============
import 'package:flutter/material.dart';
import 'package:fruit_app/core/utils/constants.dart';

class AddressWidget extends StatelessWidget {
  final VoidCallback onContinue;

  const AddressWidget({super.key, required this.onContinue});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Select Delivery Address',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.grey.shade400),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('Add New Location'), Icon(Icons.add)],
              ),
            ),
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Address 1',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          color: pColor,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.grey, width: 2),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Align(alignment: Alignment.topLeft, child: Text('John Doe')),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text('010113333344'),
                  ),
                  Text(
                    'Room # 1 - Ground Floor, Al Najoum Building, 24 B Street, Dubai - United Arab Emirates',
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height / 10),
          SizedBox(
            width: MediaQuery.sizeOf(context).width * (3.5 / 4),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: pColor),
              onPressed: onContinue, // استخدمت الـ function هنا
              child: Text('Continue', style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}
