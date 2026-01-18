import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';

class PhoneInputField extends StatelessWidget {
  const PhoneInputField({super.key,  this.controller});
final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45, // زودتها سنة بسيطة عشان متقصش الكلام
      child: TextFormField(
        validator: (value){
          if(value==null||value.isEmpty){
            return 'Field is required';
          }
        },
        controller: controller,
        keyboardType: TextInputType.phone,
        style: const TextStyle(fontSize: 15, color: Colors.black),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 18,
          ),

          // التعديل هنا: شلنا الـ width الثابت وخليناه ياخد مساحته
          prefixIcon: Container(
            // width: 100, // <--- شلت السطر ده عشان الكلام يظهر كامل
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
            ), // ضفت right padding
            child: CountryCodePicker(
              onChanged: (country) => print(country.dialCode),
              initialSelection: 'KW',
              favorite: const ['+20', 'EG', '+965', 'KW'],
              showCountryOnly: true,

              builder: (CountryCode? country) {
                return Row(
                  mainAxisSize: MainAxisSize.min, // عشان ياخد مساحة المحتوى بس
                  children: [
                    const Icon(
                      Icons.keyboard_arrow_down,
                      color: Color(0xFF757575),
                      size: 20,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      country?.code ?? 'KW',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(width: 10), // مسافة قبل الخط
                    // الخط الفاصل العمودي
                    Container(
                      height: 30, // قللت الطول سنة عشان يبقى متناسق
                      width: 1,
                      color: const Color(0xFFE7E7E7),
                    ),

                    const SizedBox(width: 12), // مسافة بين الخط والكلمة
                    // كلمة الموبايل نمبر (بنفس ستايل الـ Hint اللي في فيجما)
                    const Text(
                      'Mobile Number',
                      style: TextStyle(
                        color: Colors.black, // لون رمادي زي الديزاين
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),

          enabledBorder: buildBorder(),
          focusedBorder: buildBorder(
            color: const Color(0xFF355E3B),
            width: 1.5,
          ),
          errorBorder: buildBorder(color: Colors.red),
          focusedErrorBorder: buildBorder(color: Colors.red, width: 1.5),
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder({
    Color color = const Color(0xFFE7E7E7),
    double width = 1.0,
  }) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(color: color, width: width),
    );
  }
}
