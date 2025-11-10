import 'package:flutter/material.dart';
import 'package:fruit_app/core/utils/constants.dart';
import 'package:fruit_app/features/authentication/presentation/views/login_view.dart';
import 'package:fruit_app/features/authentication/presentation/views/widgets/custom_button.dart';
import 'package:fruit_app/features/authentication/presentation/views/widgets/custom_text_form_field.dart';
import 'package:fruit_app/features/authentication/presentation/views/widgets/phone_input_field.dart';

import 'package:fruit_app/features/home/presentation/views/main_view.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

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
              'Sign Up To Wikala',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            Align(alignment: Alignment.topLeft, child: Text('Full Name *')),
            CustomTextFormField(hintText: 'First and Last Name'),
            SizedBox(height: 5),
            Align(
              alignment: Alignment.topLeft,
              child: Text('Phone Number with Whatsapp *'),
            ),
            SizedBox(height: 5),
            PhoneInputField(),
            Align(alignment: Alignment.topLeft, child: Text('Password *')),
            SizedBox(height: 5),
            CustomTextFormField(hintText: 'Password'),
            SizedBox(height: 10),
            SizedBox(
              width: 300,
              child: CustomButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return MainView();
                      },
                    ),
                  );
                },
                text: 'Sign UP',
                buttonColor: pColor,
                textColor: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account ?',
                  style: TextStyle(fontSize: 16),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return LoginView();
                        },
                      ),
                    );
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 16,
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
