import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resume_builder_ui/constants/app_constants.dart';
import 'package:resume_builder_ui/providers/app_state_providers.dart';
import 'package:resume_builder_ui/services/theme/custom_colors.dart';
import 'package:resume_builder_ui/widgets/homescreen/full_screen_image_viewer.dart';

class TemplateBox extends StatefulWidget {
  final int index;
  const TemplateBox({super.key, required this.index});

  @override
  State<TemplateBox> createState() => _TemplateBoxState();
}

class _TemplateBoxState extends State<TemplateBox> {
  late String imagePath;

  @override
  void initState() {
    if (widget.index == 3) {
      imagePath = LINKED_TEMPLATE_PATH;
    } else if (widget.index == 2) {
      imagePath = IMAGE_TEMPLATE_PATH;
    } else {
      imagePath = BASIC_TEMPLATE_PATH;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
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
                width: (selectedTemplate == widget.index) ? 2.5 : 1,
                color: (selectedTemplate == widget.index)
                    ? Colors.cyan
                    : kSmoothBlack.withOpacity(0.3)),
            borderRadius: const BorderRadius.all(Radius.circular(20)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 250,
                height: 300,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(imagePath), fit: BoxFit.fill)),
              ),
              const SizedBox(
                height: 20.0,
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black.withOpacity(0.65)),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          FullScreenImageViewer(image: imagePath)));
                },
                icon: const Icon(
                  Icons.remove_red_eye_sharp,
                  size: 24.0,
                ),
                label: const Text('Preview'), // <-- Text
              ),
            ],
          ),
        ),
      );
    });
  }
}
