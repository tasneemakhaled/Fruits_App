import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fruit_app/core/utils/constants.dart';
import 'package:fruit_app/features/authentication/presentation/views/widgets/custom_button.dart';
import 'package:fruit_app/features/authentication/presentation/views/widgets/custom_text_form_field.dart';
import 'package:fruit_app/features/home/presentation/views/home_view.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpCodeView extends StatelessWidget {
  const OtpCodeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            Center(
              child: Text(
                'Fruit Market',
                style: TextStyle(
                  color: pColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
            ),
            SizedBox(height: 15),
            Text(
              'Enter Received OTP',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            PinCodeTextField(
              appContext: context,
              length: 4,
              keyboardType: TextInputType.number,
              onChanged: (value) {
                log(value);
              },
              cursorColor: Colors.green,
              animationType: AnimationType.fade,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.circle,
                fieldHeight: 60,
                fieldWidth: 60,
                inactiveColor: Colors.grey.shade300,
                activeColor: Colors.green,
                selectedColor: Colors.green,
              ),
              textStyle: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 20),
            SizedBox(
              width: 300,
              child: CustomButton(
                text: 'Confirm',
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return HomeView();
                      },
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Text(
              '60',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Not Received? ', style: TextStyle(fontSize: 16)),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Send Again',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
