import 'package:flutter/material.dart';

Future<void> showUtilityDialogBox(
    {required String title,
    required Widget content,
    required List<Widget> actions,
    required BuildContext context,
    required BoxConstraints? constraints}) async {
  double height = MediaQuery.of(context).size.height;
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: ConstrainedBox(
              constraints:
                  constraints ?? BoxConstraints(maxHeight: height * 0.2),
              child: content),
          actions: actions,
        );
      });
}
