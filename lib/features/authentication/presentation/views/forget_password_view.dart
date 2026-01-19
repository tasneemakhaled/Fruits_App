import 'package:flutter/material.dart';
import 'package:fruit_app/core/utils/constants.dart';
import 'package:fruit_app/features/authentication/presentation/views/otp_code_view.dart';
import 'package:fruit_app/features/authentication/presentation/views/widgets/custom_button.dart';

import 'package:fruit_app/features/authentication/presentation/views/widgets/phone_input_field.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white),
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
              'Enter Your Number',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            Align(alignment: Alignment.topLeft, child: Text('Phone Number *')),
            SizedBox(height: 5),
            PhoneInputField(controller: phoneController),
            SizedBox(height: 20),
            SizedBox(
              width: 300,
              child: CustomButton(
                text: 'Submit',
                textColor: Colors.white,
                buttonColor: pColor,
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return OtpCodeView();
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
