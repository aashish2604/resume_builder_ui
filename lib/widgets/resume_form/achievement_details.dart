import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resume_builder_ui/constants/app_constants.dart';
import 'package:resume_builder_ui/models/achievement_details_model.dart';
import 'package:resume_builder_ui/providers/app_state_providers.dart';
import 'package:resume_builder_ui/services/theme/app_theme.dart';
import 'package:resume_builder_ui/services/theme/custom_colors.dart';
import 'package:resume_builder_ui/widgets/shared/custom_text_form_field.dart';
import 'package:resume_builder_ui/widgets/shared/wrapping_container.dart';
import 'package:rich_text_controller/rich_text_controller.dart';

class AchievementDetails extends StatefulWidget {
  const AchievementDetails({super.key});

  @override
  State<AchievementDetails> createState() => _AchievementDetailsState();
}

class _AchievementDetailsState extends State<AchievementDetails> {
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
      final achievementDetailsModelList =
          ref.watch(achievementDetailsListStateProvider);
      return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: achievementDetailsModelList.length,
                  itemBuilder: (context, index) {
                    RichTextController fieldController = getRichTextController(
                        ANCHOR_TAG_REGEX,
                        const TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline));
                    RichTextController awardController = getRichTextController(
                        ANCHOR_TAG_REGEX,
                        const TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline));
                    fieldController.text =
                        achievementDetailsModelList[index].field!;
                    awardController.text =
                        achievementDetailsModelList[index].award!;
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: SizedBox(
                        width: isMobile ? width : width * 0.6,
                        child: WrappingContainer(
                          padding: EdgeInsets.symmetric(
                              horizontal: width * 0.05, vertical: 30.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Center(
                                  child: Text(
                                    'Achievement details ${index + 1}',
                                    style: titleTextStyle,
                                  ),
                                ),
                                CustomTextFormField(
                                  controller: fieldController,
                                  labelText: "Field",
                                  onChanged: (val) {
                                    ref
                                        .read(achievementDetailsListStateProvider)[
                                            index]
                                        .field = val;
                                  },
                                ),
                                CustomTextFormField(
                                    controller: awardController,
                                    labelText: "Award",
                                    onChanged: (val) {
                                      ref
                                          .read(achievementDetailsListStateProvider)[
                                              index]
                                          .award = val;
                                    }),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                IconButton(
                                    onPressed: () {
                                      if (ref
                                              .read(
                                                  achievementDetailsListStateProvider)
                                              .length >
                                          1) {
                                        ref
                                            .read(
                                                achievementDetailsListStateProvider)
                                            .removeAt(index);
                                        setState(() {});
                                      }
                                    },
                                    icon: const Icon(
                                      Icons.delete_outline,
                                      color: kSadRed,
                                    )),
                              ]),
                        ),
                      ),
                    );
                  }),
              const SizedBox(
                height: 20.0,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: CircleAvatar(
                  backgroundColor: Colors.black,
                  child: IconButton(
                    onPressed: () {
                      ref
                          .read(achievementDetailsListStateProvider)
                          .add(AchievementDetailsModel(field: "", award: ""));
                      setState(() {});
                    },
                    icon: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ));
    });
  }
}
