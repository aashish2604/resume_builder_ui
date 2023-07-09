import 'package:flutter/material.dart';
import 'package:resume_builder_ui/services/theme/app_theme.dart';
import 'package:resume_builder_ui/widgets/shared/sharp_container.dart';

class ResumeForm extends StatelessWidget {
  const ResumeForm({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    double width = MediaQuery.of(context).size.width;
    bool isMobile = width < 600;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
              key: formKey,
              child: Center(
                child: SizedBox(
                  width: isMobile ? width : width * 0.6,
                  child: SharpContainer(
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
                          decoration:
                              const InputDecoration(labelText: 'Room No'),
                          onChanged: (value) {},
                        ),
                      ],
                    ),
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
