// ============== TimeWidget ==============
import 'package:flutter/material.dart';
import 'package:fruit_app/core/utils/constants.dart';

class TimeWidget extends StatefulWidget {
  final VoidCallback onContinue;

  const TimeWidget({super.key, required this.onContinue});

  @override
  State<TimeWidget> createState() => _TimeWidgetState();
}

class _TimeWidgetState extends State<TimeWidget> {
  bool isSelected = false;
  bool isDeliveryTimeSelected = false;
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(16),
            ),
            width: MediaQuery.sizeOf(context).height * (3 / 4),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Now', style: TextStyle(fontWeight: FontWeight.bold)),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isSelected = !isSelected;
                      });
                    },
                    child: Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey, width: 2),
                      ),
                      child: Center(
                        child: Container(
                          width: isSelected ? 8 : 0,
                          height: isSelected ? 8 : 0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.black),
            ),
            width: MediaQuery.sizeOf(context).height * (3 / 4),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Select Delivery Time',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            isDeliveryTimeSelected = !isDeliveryTimeSelected;
                          });
                        },
                        child: Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            color: pColor,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.grey, width: 2),
                          ),
                          child: Center(
                            child: isDeliveryTimeSelected
                                ? Icon(
                                    Icons.check,
                                    color: Colors.white,
                                    size: 16,
                                  )
                                : Container(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ExpansionTile(
                  title: Text('Select Date'),
                  shape: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  children: [
                    ListTile(
                      title: Text(
                        "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}",
                      ),
                      trailing: const Icon(Icons.calendar_today),
                      onTap: _pickDate,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height / 9),
          SizedBox(
            width: MediaQuery.sizeOf(context).width * (3.5 / 4),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: pColor),
              onPressed: widget.onContinue, // استخدمت الـ function هنا
              child: Text('Continue', style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _pickDate() async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (date != null) {
      setState(() {
        selectedDate = date;
      });
    }
  }
}
