import 'package:flutter/material.dart';
import 'package:fruit_app/core/utils/constants.dart';
import 'package:fruit_app/features/authentication/presentation/views/widgets/custom_text_form_field.dart';
import 'package:fruit_app/features/authentication/presentation/views/widgets/phone_input_field.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(backgroundColor: Colors.white),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.grey.shade200,
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.grey.shade300,
                          width: 2,
                        ),
                      ),
                      child: Icon(
                        Icons.camera_alt,
                        size: 16,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ),
                ],
              ),
              Align(alignment: Alignment.topLeft, child: Text('Full Name *')),
              CustomTextFormField(hintText: 'First and Last Name'),
              SizedBox(height: 5),
              Align(
                alignment: Alignment.topLeft,
                child: Text('Phone Number *'),
              ),
              SizedBox(height: 5),
              PhoneInputField(),
              Align(alignment: Alignment.topLeft, child: Text('Password *')),
              SizedBox(height: 5),
              CustomTextFormField(hintText: 'Password'),
              SizedBox(height: 10),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: pColor),
                  onPressed: () {},
                  child: Text('Update', style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
