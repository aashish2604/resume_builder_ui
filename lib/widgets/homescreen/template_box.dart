import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resume_builder_ui/providers/app_state_providers.dart';
import 'package:resume_builder_ui/services/theme/custom_colors.dart';

class TemplateBox extends StatefulWidget {
  final Color color;
  final int index;
  const TemplateBox({super.key, required this.color, required this.index});

  @override
  State<TemplateBox> createState() => _TemplateBoxState();
}

class _TemplateBoxState extends State<TemplateBox> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final selectedTemplate = ref.watch(selectedTemplateStateProvider);
      return GestureDetector(
        onTap: () {
          if (selectedTemplate == widget.index) {
            ref
                .read(selectedTemplateStateProvider.notifier)
                .update((state) => 0);
          } else {
            ref
                .read(selectedTemplateStateProvider.notifier)
                .update((state) => widget.index);
          }
        },
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            border: Border.all(
                width: 2,
                color: (selectedTemplate == widget.index)
                    ? Colors.cyan
                    : kSmokeWhiteColor),
            borderRadius: const BorderRadius.all(Radius.circular(20)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 100,
                height: 100,
                color: widget.color,
              ),
              const SizedBox(
                height: 10.0,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  print("preview");
                },
                icon: Icon(
                  Icons.remove_red_eye_sharp,
                  size: 24.0,
                ),
                label: Text('Preview'), // <-- Text
              ),
            ],
          ),
        ),
      );
    });
  }
}
