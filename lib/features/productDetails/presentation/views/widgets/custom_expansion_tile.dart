import 'package:flutter/material.dart';

class CustomExpansionTile extends StatefulWidget {
  const CustomExpansionTile({super.key});

  @override
  State<CustomExpansionTile> createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile> {
  String? selectedWeight;

  String? selectedAddons;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExpansionTile(
          title: Text(
            'Select weight',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          children: [
            RadioListTile(
              title: Text('50 Gram - 4.00 KD'),
              value: '50gram',
              groupValue: selectedWeight,
              onChanged: (value) {
                setState(() {
                  selectedWeight = value;
                });
              },
            ),
            RadioListTile(
              title: Text('1 Kg - 6.25 KD'),
              value: '1kg',
              groupValue: selectedWeight,
              onChanged: (value) {
                setState(() {
                  selectedWeight = value;
                });
              },
            ),
            RadioListTile(
              title: Text('2 Kg - 12.00 KD'),
              value: '2kg',
              groupValue: selectedWeight,
              onChanged: (value) {
                setState(() {
                  selectedWeight = value;
                });
              },
            ),
          ],
        ),
        ExpansionTile(
          title: Text(
            'Select Addons',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          children: [
            RadioListTile(
              value: '50 Gram - 4.00 KD',
              groupValue: selectedAddons,
              onChanged: (value) {
                setState(() {
                  selectedAddons = value;
                });
              },

              title: Text('50 Gram'),
            ),
            RadioListTile(
              value: '1 Kg',
              groupValue: selectedAddons,
              onChanged: (value) {
                setState(() {
                  selectedAddons = value;
                });
              },

              title: Text('1 Kg - 6.25 KD'),
            ),
          ],
        ),
      ],
    );
  }
}
