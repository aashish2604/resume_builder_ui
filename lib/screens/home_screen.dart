import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resume_builder_ui/providers/app_state_providers.dart';
import 'package:resume_builder_ui/screens/resume_form.dart';
import 'package:resume_builder_ui/services/theme/custom_colors.dart';
import 'package:resume_builder_ui/widgets/homescreen/template_box.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(builder: (context, ref, child) {
        // final isTemplateSelected = ref.watch(isTemplateSelectedStateProvider);
        final selectedTemplated = ref.watch(selectedTemplateStateProvider);
        double height = MediaQuery.of(context).size.height;
        double width = MediaQuery.of(context).size.width;
        return SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: height * 0.05,
              ),
              Text(
                "Resume Builder",
                style: GoogleFonts.righteous(fontSize: 40.0),
              ),
              SizedBox(
                width: 260,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Build resume ',
                      style: GoogleFonts.righteous(
                        fontSize: (width > 600) ? 25.0 : 20.0,
                      ),
                    ),
                    DefaultTextStyle(
                      style: GoogleFonts.raleway(
                        color: kSmoothBlack,
                        fontSize: (width > 600) ? 25.0 : 20.0,
                      ),
                      child: AnimatedTextKit(
                        repeatForever: true,
                        animatedTexts: [
                          TypewriterAnimatedText('faster',
                              speed: const Duration(milliseconds: 100)),
                          TypewriterAnimatedText("better",
                              speed: const Duration(milliseconds: 100)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.1,
              ),
              const Text(
                "Choose a resume template",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: height * 0.035,
              ),
              const Center(
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  runAlignment: WrapAlignment.center,
                  alignment: WrapAlignment.center,
                  runSpacing: 20.0,
                  children: [
                    TemplateBox(
                      index: 1,
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    TemplateBox(
                      index: 2,
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    TemplateBox(
                      index: 3,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.04,
              ),
              Visibility(
                  visible: (selectedTemplated != 0),
                  child: TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ResumeForm(
                                  templateId: selectedTemplated.toString(),
                                )));
                      },
                      child: const Text("Continue"))),
              const SizedBox(
                height: 40.0,
              ),
            ],
          ),
        );
      }),
    );
  }
}
