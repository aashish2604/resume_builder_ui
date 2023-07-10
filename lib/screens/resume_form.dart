import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resume_builder_ui/constants/app_constants.dart';
import 'package:resume_builder_ui/models/resume_model.dart';
import 'package:resume_builder_ui/providers/app_state_providers.dart';
import 'package:resume_builder_ui/screens/generator_screen.dart';
import 'package:resume_builder_ui/widgets/resume_form/achievement_details.dart';
import 'package:resume_builder_ui/widgets/resume_form/education_details.dart';
import 'package:resume_builder_ui/widgets/resume_form/experience_details.dart';
import 'package:resume_builder_ui/widgets/resume_form/other_details.dart';
import 'package:resume_builder_ui/widgets/resume_form/personal_details.dart';
import 'package:rich_text_controller/rich_text_controller.dart';

class ResumeForm extends StatefulWidget {
  final String templateId;
  const ResumeForm({super.key, required this.templateId});

  @override
  State<ResumeForm> createState() => _ResumeFormState();
}

class _ResumeFormState extends State<ResumeForm> {
  int currentStep = 0;
  List<GlobalKey<FormState>> formKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  late RichTextController linkedInController;
  late RichTextController jobProfileController;
  late RichTextController careerObjectiveController;

  @override
  void initState() {
    linkedInController = getRichTextController(
        LINKEDIN_PROFILE_REGEX,
        const TextStyle(
            color: Colors.blue, decoration: TextDecoration.underline));
    jobProfileController = getRichTextController(
        ANCHOR_TAG_REGEX,
        const TextStyle(
            color: Colors.blue, decoration: TextDecoration.underline));
    careerObjectiveController = getRichTextController(
        ANCHOR_TAG_REGEX,
        const TextStyle(
            color: Colors.blue, decoration: TextDecoration.underline));
    super.initState();
  }

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

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: Consumer(builder: (context, ref, child) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.1),
            child: Stepper(
              controlsBuilder: (BuildContext ctx, ControlsDetails dtl) {
                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextButton(
                        onPressed: dtl.onStepCancel,
                        child: const Text('Previous'),
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      TextButton(
                        onPressed: dtl.onStepContinue,
                        child: const Text('Next'),
                      ),
                    ],
                  ),
                );
              },
              type: StepperType.horizontal,
              currentStep: currentStep,
              onStepCancel: () => currentStep == 0
                  ? null
                  : setState(() {
                      currentStep -= 1;
                    }),
              onStepContinue: () {
                if (formKeys[currentStep].currentState!.validate()) {
                  bool isLastStep =
                      (currentStep == getSteps(context).length - 1);
                  if (isLastStep) {
                    final skills = ref.read(skillListStateProvider);
                    final education =
                        ref.read(educationDetailsListStateProvider);
                    final experience =
                        ref.read(experienceDetailsListStateProvider);
                    final achievements =
                        ref.read(achievementDetailsListStateProvider);
                    PersonalInformation personalInformation =
                        PersonalInformation(
                            name: nameController.text,
                            lastName: lastnameController.text,
                            emailAddress: emailController.text,
                            phoneNumber: phoneController.text,
                            linkedinUrl: linkedInController.text);
                    ResumeModel resumeData = ResumeModel(
                        templateId: widget.templateId,
                        personalInformation: personalInformation,
                        jobTitle: jobProfileController.text,
                        careerObjective: careerObjectiveController.text,
                        skills: skills,
                        education: education,
                        experience: experience,
                        achievements: achievements);
                    final data = resumeData.toJson();
                    print(data);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            GeneratorScreen(resumeModel: resumeData)));
                  } else {
                    setState(() {
                      currentStep += 1;
                    });
                  }
                }
              },
              steps: getSteps(context),
            ),
          );
        }));
  }

  List<Step> getSteps(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return <Step>[
      Step(
        state: currentStep > 0 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 0,
        title: width > 700 ? const Text("Personal") : const SizedBox.shrink(),
        content: Form(
          key: formKeys[0],
          child: PersonalDetails(
            emailController: emailController,
            phoneController: phoneController,
            lastnameController: lastnameController,
            nameController: nameController,
            linkedInController: linkedInController,
          ),
        ),
      ),
      Step(
          state: currentStep > 1 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 1,
          title:
              width > 700 ? const Text("Education") : const SizedBox.shrink(),
          content: Form(key: formKeys[1], child: const EducationDetails())),
      Step(
        state: currentStep > 2 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 2,
        title: width > 700 ? const Text("Experience") : const SizedBox.shrink(),
        content: Form(key: formKeys[2], child: const ExperienceDetails()),
      ),
      Step(
        state: currentStep > 3 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 3,
        title:
            width > 700 ? const Text("Achievements") : const SizedBox.shrink(),
        content: Form(
          key: formKeys[3],
          child: const AchievementDetails(),
        ),
      ),
      Step(
          state: currentStep > 4 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 4,
          title: width > 600 ? const Text("Others") : const SizedBox.shrink(),
          content: Form(
              key: formKeys[4],
              child: OtherDetails(
                  jobController: jobProfileController,
                  carrerObjectiveController: careerObjectiveController))),
    ];
  }
}
