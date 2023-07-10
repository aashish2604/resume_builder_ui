import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resume_builder_ui/constants/app_constants.dart';
import 'package:resume_builder_ui/models/education_details_model.dart';
import 'package:resume_builder_ui/providers/app_state_providers.dart';
import 'package:resume_builder_ui/services/theme/app_theme.dart';
import 'package:resume_builder_ui/services/theme/custom_colors.dart';
import 'package:resume_builder_ui/widgets/shared/custom_text_form_field.dart';
import 'package:resume_builder_ui/widgets/shared/wrapping_container.dart';
import 'package:rich_text_controller/rich_text_controller.dart';

class EducationDetails extends StatefulWidget {
  const EducationDetails({super.key});

  @override
  State<EducationDetails> createState() => _EducationDetailsState();
}

class _EducationDetailsState extends State<EducationDetails> {
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

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    bool isMobile = width < 600;
    return Consumer(builder: (context, ref, child) {
      final educationDetailsModelList =
          ref.watch(educationDetailsListStateProvider);
      return SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: isMobile ? width - 40 : 700,
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: educationDetailsModelList.length,
                  itemBuilder: (context, index) {
                    RichTextController schoolNameController =
                        getRichTextController(
                            ANCHOR_TAG_REGEX,
                            const TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline));
                    RichTextController passingYearController =
                        getRichTextController(
                            ANCHOR_TAG_REGEX,
                            const TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline));
                    RichTextController descriptionController =
                        getRichTextController(
                            ANCHOR_TAG_REGEX,
                            const TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline));
                    schoolNameController.text =
                        educationDetailsModelList[index].schoolName!;
                    passingYearController.text =
                        educationDetailsModelList[index].passingYear!;
                    descriptionController.text =
                        educationDetailsModelList[index].description!;
                    return Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: WrappingContainer(
                        padding: EdgeInsets.symmetric(
                            horizontal: isMobile ? 20.0 : width * 0.03,
                            vertical: 30.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Text(
                                  'Education details ${index + 1}',
                                  style: formTitleTextStyle,
                                ),
                              ),
                              Text(
                                "School Name",
                                style: formFieldTextStyle,
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                              CustomTextFormField(
                                controller: schoolNameController,
                                labelText: "School Name",
                                onChanged: (val) {
                                  ref
                                      .read(educationDetailsListStateProvider)[
                                          index]
                                      .schoolName = val;
                                },
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              Text(
                                "Passing Year",
                                style: formFieldTextStyle,
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                              CustomTextFormField(
                                  controller: passingYearController,
                                  labelText: "Passing year",
                                  onChanged: (val) {
                                    ref
                                        .read(educationDetailsListStateProvider)[
                                            index]
                                        .passingYear = val;
                                  }),
                              const SizedBox(
                                height: 20.0,
                              ),
                              Text(
                                "Description",
                                style: formFieldTextStyle,
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                              CustomTextFormField(
                                  controller: descriptionController,
                                  labelText: "Description",
                                  onChanged: (val) {
                                    ref
                                        .read(educationDetailsListStateProvider)[
                                            index]
                                        .description = val;
                                  }),
                              const SizedBox(
                                height: 20.0,
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: IconButton(
                                    onPressed: () {
                                      if (ref
                                              .read(
                                                  educationDetailsListStateProvider)
                                              .length >
                                          1) {
                                        ref
                                            .read(
                                                educationDetailsListStateProvider)
                                            .removeAt(index);
                                        setState(() {});
                                      }
                                    },
                                    icon: const Icon(
                                      Icons.delete_outline,
                                      color: kSadRed,
                                    )),
                              ),
                            ]),
                      ),
                    );
                  }),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton.icon(
                label: const Text('Add more'),
                onPressed: () {
                  ref.read(educationDetailsListStateProvider).add(
                      EducationDetailsModel(
                          schoolName: "", passingYear: "", description: ""));
                  setState(() {});
                },
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 40.0,
            )
          ],
        ),
      );
    });
  }
}
