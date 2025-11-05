import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';


class PhoneInputField extends StatelessWidget {
  const PhoneInputField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        hintText: 'Enter your phone number',
        prefixIcon: Container(
          padding: const EdgeInsets.only(left: 8),
          child: CountryCodePicker(
            onChanged: (code) {
              print(code.dialCode); // كود الدولة اللي المستخدم اختاره
            },
            initialSelection: 'EG', // الدولة الافتراضية (مصر مثلاً)
            favorite: const ['+20', 'EG'],
            showCountryOnly: false,
            showOnlyCountryWhenClosed: false,
            alignLeft: false,
            flagWidth: 28,
            padding: EdgeInsets.zero,
            textStyle: const TextStyle(fontSize: 16, color: Colors.black),
          ),
        ),
        prefixIconConstraints: const BoxConstraints(
          minWidth: 0,
          minHeight: 0,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30), // تخليها دايرة زي الديزاين
          borderSide: const BorderSide(color: Colors.grey),
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      ),
    );
  }
}
