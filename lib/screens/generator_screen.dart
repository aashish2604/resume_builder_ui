import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resume_builder_ui/models/resume_model.dart';
import 'package:resume_builder_ui/repository/resume_generator_respository.dart';

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
      body: FutureBuilder(
          future: ResumeGeneratorRespository().generateResume(resumeModel),
          builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.data != null) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(snapshot.data!),
                      const SizedBox(
                        height: 10.0,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            Navigator.of(context).pop();
                          },
                          child: const Text("Go to home"))
                    ],
                  ),
                );
              }
              return const Center(
                child: Text("Some unknown error occured"),
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CupertinoActivityIndicator(),
                    const Text("Generating resume")
                  ],
                ),
              );
            } else {
              return const Center(
                child: Text("Something went wrong"),
              );
            }
          }),
    );
  }
}
