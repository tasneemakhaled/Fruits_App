import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/core/utils/constants.dart';
import 'package:fruit_app/features/authentication/presentation/view_models/cubits/cubit/register_user_cubit.dart';
import 'package:fruit_app/features/authentication/presentation/views/login_view.dart';
import 'package:fruit_app/features/authentication/presentation/views/widgets/custom_button.dart';
import 'package:fruit_app/features/authentication/presentation/views/widgets/custom_text_form_field.dart';
import 'package:fruit_app/features/authentication/presentation/views/widgets/phone_input_field.dart';
import 'package:fruit_app/features/home/presentation/views/main_view.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterUserCubit(),
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
                    'Sign Up To Wikala',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Full Name *',
                      style: TextStyle(color: Color(0xff858D9A)),
                    ),
                  ),
                  CustomTextFormField(
                    controller: nameController,
                    hintText: 'First and Last Name',
                  ),
                  SizedBox(height: 5),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Phone Number with Whatsapp *',
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
                  SizedBox(
                    width: 300,
                    height: 45,
                    child: BlocConsumer<RegisterUserCubit, RegisterUserState>(
                      listener: (context, state) {
                        if (state is RegisterUserSuccess) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Registered Successfuly')),
                          );
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return MainView();
                              },
                            ),
                          );
                        } else if (state is RegisterUserFailure) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'failed to sign up ,please try again!',
                              ),
                            ),
                          );
                        }
                      },
                      builder: (context, state) {
                        return state is RegisterUserLoading
                            ? Center(child: CircularProgressIndicator())
                            : CustomButton(
                                onPressed: () async {
                                  if (formKey.currentState!.validate()) {
                                    context
                                        .read<RegisterUserCubit>()
                                        .registerUser(
                                          name: nameController.text,
                                          mobile: phoneController.text,
                                          password: passwordController.text,
                                        );
                                  }

                                  //                   AuthService service = AuthService();

                                  // // بننادي الوظيفة وبنستنى الرد
                                  // var user = await service.registerUser(
                                  //   name: "خالد",
                                  //   email: "tasneem@gmail.com",
                                  //   mobile: "01012345679",
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
                                text: 'Sign Up',
                                buttonColor: pColor,
                                textColor: Colors.white,
                              );
                      },
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
