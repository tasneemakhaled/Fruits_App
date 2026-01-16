import 'package:flutter/material.dart';
import 'package:fruit_app/core/utils/constants.dart';
import 'package:fruit_app/features/authentication/data/services/auth_service.dart';
import 'package:fruit_app/features/authentication/presentation/views/forget_password_view.dart';
import 'package:fruit_app/features/authentication/presentation/views/sign_up_view.dart';

import 'package:fruit_app/features/authentication/presentation/views/widgets/custom_text_form_field.dart';
import 'package:fruit_app/features/authentication/presentation/views/widgets/phone_input_field.dart';
import 'package:fruit_app/features/home/presentation/views/home_view.dart';
import 'package:fruit_app/features/home/presentation/views/main_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
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
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Phone Number *',
                  style: TextStyle(color: Color(0xff858D9A)),
                ),
              ),
              SizedBox(height: 5),
              PhoneInputField(),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Password *',
                  style: TextStyle(color: Color(0xff858D9A)),
                ),
              ),
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
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Color(0xff004D8E),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 300,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: pColor),
                  onPressed: ()async {
                    AuthService service = AuthService();
  
  // بننادي الوظيفة وبنستنى الرد
  var user = await service.loginUser(
   
    phone_email:"01012345679",
    password: "password123",
  );

  // بنختبر النتيجة
  if (user != null) {
    print("نجح التسجيل! التوكن هو: ${user.token}");
  } else {
    print("فشل التسجيل، الرد رجع فاضي");
  }
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (context) {
                    //       return MainView();
                    //     },
                    //   ),
                    // );
                  },
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
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return SignUpView();
                          },
                        ),
                      );
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Color(0xff004D8E),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
