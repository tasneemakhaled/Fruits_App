import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fruit_app/core/utils/constants.dart';

import 'package:fruit_app/features/authentication/presentation/views/widgets/custom_text_form_field.dart';

class ContactView extends StatefulWidget {
  const ContactView({super.key});

  @override
  State<ContactView> createState() => _ContactViewState();
}

class _ContactViewState extends State<ContactView> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'Contact Us',
          style: TextStyle(color: pColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(alignment: Alignment.topLeft, child: Text('Name')),
              SizedBox(height: MediaQuery.of(context).size.height * 0.001),
              CustomTextFormField(controller: nameController),
              SizedBox(height: MediaQuery.of(context).size.height * 0.001),
              Align(alignment: Alignment.topLeft, child: Text('Mobile Number')),
              CustomTextFormField(controller: phoneController),
              SizedBox(height: MediaQuery.of(context).size.height * 0.001),
              Align(alignment: Alignment.topLeft, child: Text('Message')),
              CustomTextFormField(maxLines: 4),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: pColor),
                  onPressed: () {},
                  child: Text('Submit', style: TextStyle(color: Colors.white)),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.grey.shade300,
                        width: 1.5,
                      ),
                    ),
                    child: Icon(Icons.phone, color: Colors.green, size: 24),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.grey.shade300,
                        width: 1.5,
                      ),
                    ),
                    child: Icon(Icons.facebook, color: Colors.blue, size: 24),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.grey.shade300,
                        width: 1.5,
                      ),
                    ),
                    child: Icon(
                      FontAwesomeIcons.instagram,
                      color: Colors.purple,
                      size: 24,
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.grey.shade300,
                        width: 1.5,
                      ),
                    ),
                    child: Icon(
                      Icons.play_circle_fill,
                      color: Colors.red,
                      size: 24,
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
