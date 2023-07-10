import 'dart:io';

import 'package:flutter/material.dart';
import 'package:resume_builder_ui/constants/app_constants.dart';
import 'package:resume_builder_ui/widgets/shared/alert_dialogbox.dart';
import 'package:rich_text_controller/rich_text_controller.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class CustomTextFormField extends StatelessWidget {
  final RichTextController controller;
  final String labelText;
  final bool showSuffix;
  final void Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final Widget? suffix;
  const CustomTextFormField(
      {super.key,
      required this.controller,
      required this.labelText,
      this.showSuffix = true,
      this.onChanged,
      this.validator,
      this.suffix});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return TextFormField(
      onChanged: onChanged,
      validator: validator ??
          (val) => val!.isEmpty ? 'This is a required field' : null,
      decoration: InputDecoration(
          hintText: labelText,
          suffix: showSuffix
              ? suffix ??
                  IconButton(
                      onPressed: () {
                        String controllerValue = controller.text;
                        final urlController = TextEditingController();
                        final tagTextController = TextEditingController();
                        final dialogBoxFormKey = GlobalKey<FormState>();
                        showUtilityDialogBox(
                            title: "Add HyperLink",
                            content: Form(
                              key: dialogBoxFormKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Enter url'),
                                  TextFormField(
                                    validator: (val) {
                                      if (val!.isEmpty) {
                                        return "This is a required field";
                                      }
                                      if (!URL_REGEX.hasMatch(val)) {
                                        return "Enter valid url of the form https://";
                                      }
                                      return null;
                                    },
                                    controller: urlController,
                                  ),
                                  const SizedBox(
                                    height: 8.0,
                                  ),
                                  const Text("Enter Anchor text"),
                                  TextFormField(
                                    validator: (val) => val!.isEmpty
                                        ? "This is a required field"
                                        : null,
                                    controller: tagTextController,
                                  ),
                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                  const Text(
                                      "If you enter https://google.com in url and google in anchor text then the field will show it as https://google.com[google] but your generated resume will have the anchor text in desired form")
                                ],
                              ),
                            ),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("Cancel")),
                              TextButton(
                                  onPressed: () {
                                    if (dialogBoxFormKey.currentState!
                                        .validate()) {
                                      String finalTextValue =
                                          "$controllerValue${urlController.text}[${tagTextController.text}]";
                                      controller.text = finalTextValue;
                                      Navigator.pop(context);
                                    }
                                  },
                                  child: Text("Done")),
                            ],
                            context: context,
                            constraints: BoxConstraints(
                                maxWidth: kIsWeb
                                    ? width * 0.4
                                    : (Platform.isAndroid
                                        ? width - 10
                                        : width * 0.4),
                                minWidth: kIsWeb
                                    ? width * 0.3
                                    : (Platform.isAndroid
                                        ? width - 15
                                        : width * 0.3),
                                maxHeight: kIsWeb
                                    ? 300
                                    : (Platform.isAndroid ? 350 : 300)));
                      },
                      icon: Icon(Icons.link))
              : null),
      controller: controller,
    );
  }
}
