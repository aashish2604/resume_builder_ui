import 'package:flutter/material.dart';
import 'package:resume_builder_ui/widgets/shared/alert_dialogbox.dart';
import 'package:rich_text_controller/rich_text_controller.dart';

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
          labelText: labelText,
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
                                children: [
                                  Text('Enter url'),
                                  TextFormField(
                                    validator: (val) => val!.isEmpty
                                        ? "This is a required field"
                                        : null,
                                    controller: urlController,
                                  ),
                                  Text("Enter Anchor text"),
                                  TextFormField(
                                    validator: (val) => val!.isEmpty
                                        ? "This is a required field"
                                        : null,
                                    controller: tagTextController,
                                  ),
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
                                maxWidth: width * 0.4,
                                minWidth: width * 0.3,
                                maxHeight: 200));
                      },
                      icon: Icon(Icons.link))
              : null),
      controller: controller,
    );
  }
}
