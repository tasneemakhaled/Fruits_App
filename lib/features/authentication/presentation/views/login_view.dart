import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/core/utils/constants.dart';
import 'package:fruit_app/features/authentication/data/services/auth_service.dart';
import 'package:fruit_app/features/authentication/presentation/view_models/cubits/cubit/login_user_cubit.dart';
import 'package:fruit_app/features/authentication/presentation/views/forget_password_view.dart';
import 'package:fruit_app/features/authentication/presentation/views/sign_up_view.dart';

import 'package:fruit_app/features/authentication/presentation/views/widgets/custom_text_form_field.dart';
import 'package:fruit_app/features/authentication/presentation/views/widgets/phone_input_field.dart';
import 'package:fruit_app/features/home/presentation/views/home_view.dart';
import 'package:fruit_app/features/home/presentation/views/main_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginUserCubit(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(backgroundColor: Colors.white),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
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
                  PhoneInputField(controller: phoneController),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Password *',
                      style: TextStyle(color: Color(0xff858D9A)),
                    ),
                  ),
                  SizedBox(height: 5),
                  CustomTextFormField(
                    controller: passwordController,
                    hintText: 'Password',
                  ),
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
                  BlocConsumer<LoginUserCubit, LoginUserState>(
                    listener: (context, state) {
                      if (state is LoginUserSuccess) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Login Successfuly')),
                        );
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return MainView();
                            },
                          ),
                        );
                      } else if (state is LoginUserFailure) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Login Failure')),
                        );
                      }
                    },
                    builder: (context, state) {
                      return state is LoginUserLoading
                          ? Center(child: CircularProgressIndicator())
                          : SizedBox(
                              width: 300,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: pColor,
                                ),
                                onPressed: () async {
                                  if (formKey.currentState!.validate()) {
                                    context.read<LoginUserCubit>().loginUser(
                                      phone_email: phoneController.text,
                                      password: passwordController.text,
                                    );
                                  }
                                  // AuthService service = AuthService();

                                  // // بننادي الوظيفة وبنستنى الرد
                                  // var user = await service.loginUser(
                                  //   phone_email: "01012345679",
                                  //   password: "password123",
                                  // );

                                  // // بنختبر النتيجة
                                  // if (user != null) {
                                  //   print("نجح التسجيل! التوكن هو: ${user.token}");
                                  // } else {
                                  //   print("فشل التسجيل، الرد رجع فاضي");
                                  // }
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
                            );
                    },
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
        ),
      ),
    );
  }
}
