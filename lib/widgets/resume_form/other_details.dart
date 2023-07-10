import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resume_builder_ui/constants/app_constants.dart';
import 'package:resume_builder_ui/providers/app_state_providers.dart';
import 'package:resume_builder_ui/services/theme/app_theme.dart';
import 'package:resume_builder_ui/services/theme/custom_colors.dart';
import 'package:resume_builder_ui/widgets/shared/alert_dialogbox.dart';
import 'package:resume_builder_ui/widgets/shared/custom_text_form_field.dart';
import 'package:resume_builder_ui/widgets/shared/wrapping_container.dart';
import 'package:rich_text_controller/rich_text_controller.dart';

class OtherDetails extends StatefulWidget {
  final RichTextController jobController;
  final RichTextController carrerObjectiveController;
  const OtherDetails({
    super.key,
    required this.jobController,
    required this.carrerObjectiveController,
  });

  @override
  State<OtherDetails> createState() => _OtherDetailsState();
}

class _OtherDetailsState extends State<OtherDetails> {
  RichTextController getRichTextController(RegExp regex, TextStyle style) {
    final richTextController = RichTextController(
        patternMatchMap: {
          regex: style,
        },
        deleteOnBack: true,
        regExpUnicode: true,
        onMatch: (matches) {
          print(matches);
        });
    return richTextController;
  }

  Widget skillSuffix(RichTextController controller, BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return IconButton(
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
                      validator: (val) =>
                          val!.isEmpty ? "This is a required field" : null,
                      controller: urlController,
                    ),
                    Text("Enter Anchor text"),
                    TextFormField(
                      validator: (val) =>
                          val!.isEmpty ? "This is a required field" : null,
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
                      if (dialogBoxFormKey.currentState!.validate()) {
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
        icon: Icon(Icons.link));
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    bool isMobile = width < 600;
    return Consumer(builder: (context, ref, child) {
      final skillsList = ref.watch(skillListStateProvider);

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
                    'Other Details',
                    style: titleTextStyle,
                  ),
                  CustomTextFormField(
                    labelText: "Job Profile",
                    controller: widget.jobController,
                  ),
                  CustomTextFormField(
                    labelText: "Career Objective",
                    controller: widget.carrerObjectiveController,
                  ),
                  const Text("Skills"),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: skillsList.length,
                      itemBuilder: (context, index) {
                        RichTextController skillController =
                            getRichTextController(
                                ANCHOR_TAG_REGEX,
                                const TextStyle(
                                    color: Colors.blue,
                                    decoration: TextDecoration.underline));
                        skillController.text = skillsList[index]!;
                        return CustomTextFormField(
                          controller: skillController,
                          labelText: 'Skill ${index + 1}',
                          onChanged: (val) {
                            ref.read(skillListStateProvider)[index] = val;
                          },
                          suffix: SizedBox(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                skillSuffix(skillController, context),
                                IconButton(
                                    onPressed: () {
                                      if (ref
                                              .read(skillListStateProvider)
                                              .length >
                                          1) {
                                        ref
                                            .read(skillListStateProvider)
                                            .removeAt(index);
                                        setState(() {});
                                      }
                                    },
                                    icon: const Icon(
                                      Icons.delete_outline,
                                      color: kSadRed,
                                    )),
                              ],
                            ),
                          ),
                        );
                      }),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () {
                        ref.read(skillListStateProvider).add("");
                        setState(() {});
                      },
                      icon: const Icon(
                        Icons.add_circle_outline_outlined,
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
        ),
      );
    });
  }
}
