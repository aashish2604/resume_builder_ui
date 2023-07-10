import 'package:flutter/material.dart';
import 'package:resume_builder_ui/constants/app_constants.dart';
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
                  horizontal: isMobile ? 20.0 : width * 0.03, vertical: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Personal Details',
                      style: formTitleTextStyle,
                    ),
                  ),
                  Text(
                    "Name",
                    style: formFieldTextStyle,
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  TextFormField(
                    validator: (val) =>
                        val!.isEmpty ? 'This is a required field' : null,
                    decoration: const InputDecoration(hintText: 'Name'),
                    controller: nameController,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    "Last Name",
                    style: formFieldTextStyle,
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  TextFormField(
                    validator: (val) =>
                        val!.isEmpty ? 'This is a required field' : null,
                    decoration: const InputDecoration(hintText: 'Last Name'),
                    controller: lastnameController,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    "Email Address",
                    style: formFieldTextStyle,
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  TextFormField(
                    validator: (val) {
                      if (val!.isEmpty) return "This is a required field";
                      if (!EMAIL_REGEX.hasMatch(val)) {
                        return "Email is invalid";
                      }
                      return null;
                    },
                    decoration:
                        const InputDecoration(hintText: 'Email Address'),
                    controller: emailController,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    "Phone Number",
                    style: formFieldTextStyle,
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  TextFormField(
                    validator: (val) {
                      if (val!.isEmpty) return "This is a required field";
                      if (!PHONE_NUMBER_REGEX.hasMatch(val)) {
                        return "Invalid input. Correct form: +91 91xxx56xx8";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(hintText: 'Phone Number'),
                    controller: phoneController,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    "LinkedIn Profile url",
                    style: formFieldTextStyle,
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  CustomTextFormField(
                    validator: (val) {
                      if (val!.isEmpty) return "This is a required field";
                      if (!LINKEDIN_PROFILE_REGEX.hasMatch(val)) {
                        return "Invalid linkedin profile url";
                      }
                      return null;
                    },
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
