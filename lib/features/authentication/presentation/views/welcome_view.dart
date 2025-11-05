import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fruit_app/core/utils/constants.dart';
import 'package:fruit_app/features/authentication/presentation/views/sign_up_view.dart';
import 'package:fruit_app/features/authentication/presentation/views/widgets/custom_button.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.close, color: Colors.black),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return SignUpView();
                  },
                ),
              );
            },
          ),
        ),
        body: Column(
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
            SizedBox(height: 20),
            Text(
              'Welcome To Our App',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            SizedBox(height: 50),
            SizedBox(
              width: 300,
              child: CustomButton(
                buttonColor: Colors.white,
                prefixIcon: Icon(Icons.phone, color: Colors.black),
                onPressed: () {},
                text: 'Sign in With Phone Number',
                textColor: Colors.black,
              ),
            ),
            SizedBox(
              width: 300,
              child: CustomButton(
                buttonColor: Colors.white,
                onPressed: () {},
                prefixIcon: Icon(FontAwesomeIcons.google, color: Colors.black),
                text: 'Sign In With Google',
                textColor: Colors.black,
              ),
            ),
            SizedBox(
              width: 300,
              child: CustomButton(
                onPressed: () {},
                buttonColor: Color(0xff235C95),
                prefixIcon: Icon(
                  FontAwesomeIcons.facebook,
                  color: Colors.black,
                ),
                text: 'Sign In With Facebook',
                textColor: Colors.black,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already Member ?', style: TextStyle(fontSize: 16)),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Sign in',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'By Continue You agree to Our ',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    TextSpan(
                      text: 'Terms of service',
                      style: TextStyle(color: Colors.blue, fontSize: 16),
                    ),
                    TextSpan(
                      text: '  and our ',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    TextSpan(
                      text: 'privacy policy',
                      style: TextStyle(color: Colors.blue, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
