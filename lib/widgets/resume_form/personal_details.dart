import 'package:flutter/material.dart';
import 'package:resume_builder_ui/services/theme/app_theme.dart';
import 'package:resume_builder_ui/widgets/shared/custom_text_form_field.dart';
import 'package:resume_builder_ui/widgets/shared/wrapping_container.dart';
import 'package:rich_text_controller/rich_text_controller.dart';

class PersonalDetails extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController lastnameController;
  final RichTextController linkedInController;

  const PersonalDetails(
      {super.key,
      required this.nameController,
      required this.emailController,
      required this.phoneController,
      required this.lastnameController,
      required this.linkedInController});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    bool isMobile = width < 600;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: SizedBox(
            width: isMobile ? width : width * 0.6,
            child: WrappingContainer(
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0.05, vertical: 30.0),
              child: Column(
                children: [
                  Text(
                    'Personal Details',
                    style: titleTextStyle,
                  ),
                  TextFormField(
                    validator: (val) =>
                        val!.isEmpty ? 'This is a required field' : null,
                    decoration: const InputDecoration(labelText: 'Name'),
                    controller: nameController,
                  ),
                  TextFormField(
                    validator: (val) =>
                        val!.isEmpty ? 'This is a required field' : null,
                    decoration: const InputDecoration(labelText: 'Last Name'),
                    controller: lastnameController,
                  ),
                  TextFormField(
                    validator: (val) =>
                        val!.isEmpty ? 'This is a required field' : null,
                    decoration:
                        const InputDecoration(labelText: 'Email Address'),
                    controller: emailController,
                  ),
                  TextFormField(
                    validator: (val) =>
                        val!.isEmpty ? 'This is a required field' : null,
                    decoration:
                        const InputDecoration(labelText: 'Phone Number'),
                    controller: phoneController,
                  ),
                  CustomTextFormField(
                    controller: linkedInController,
                    labelText: "LinkedIn url",
                    showSuffix: false,
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
