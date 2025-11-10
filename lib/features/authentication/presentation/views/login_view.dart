import 'package:flutter/material.dart';
import 'package:fruit_app/core/utils/constants.dart';
import 'package:fruit_app/features/authentication/presentation/views/forget_password_view.dart';

import 'package:fruit_app/features/authentication/presentation/views/widgets/custom_text_form_field.dart';
import 'package:fruit_app/features/authentication/presentation/views/widgets/phone_input_field.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

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
              'Login To Wikala',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            Align(alignment: Alignment.topLeft, child: Text('Phone Number *')),
            SizedBox(height: 5),
            PhoneInputField(),
            Align(alignment: Alignment.topLeft, child: Text('Password *')),
            SizedBox(height: 5),
            CustomTextFormField(hintText: 'Password'),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return ForgetPasswordView();
                      },
                    ),
                  );
                },
                child: Text(
                  'Forget password ?',
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              ),
            ),
            SizedBox(
              width: 300,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: pColor),
                onPressed: () {},
                child: Text(
                  'Log in',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Don\'t have an account?'),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Sign Up',
                    style: TextStyle(decoration: TextDecoration.underline),
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
