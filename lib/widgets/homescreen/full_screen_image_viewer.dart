import 'package:flutter/material.dart';

class FullScreenImageViewer extends StatelessWidget {
  final String image;
  const FullScreenImageViewer({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.contain,
        )),
      ),
    );
  }
}
