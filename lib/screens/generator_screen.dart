import 'package:flutter/material.dart';
import 'package:resume_builder_ui/models/resume_model.dart';

class GeneratorScreen extends StatelessWidget {
  final ResumeModel resumeModel;
  const GeneratorScreen({super.key, required this.resumeModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: const Center(child: Text("Generator")),
    );
  }
}
