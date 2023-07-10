import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resume_builder_ui/providers/app_state_providers.dart';
import 'package:resume_builder_ui/screens/resume_form.dart';
import 'package:resume_builder_ui/widgets/homescreen/template_box.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(builder: (context, ref, child) {
        // final isTemplateSelected = ref.watch(isTemplateSelectedStateProvider);
        final selectedTemplated = ref.watch(selectedTemplateStateProvider);
        return Center(
            child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TemplateBox(
                    color: Colors.red,
                    index: 1,
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  TemplateBox(
                    color: Colors.blue,
                    index: 2,
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  TemplateBox(
                    color: Colors.green,
                    index: 3,
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
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
                      child: Text("Continue")))
            ],
          ),
        ));
      }),
    );
  }
}
