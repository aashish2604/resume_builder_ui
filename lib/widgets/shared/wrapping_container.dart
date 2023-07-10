import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class WrappingContainer extends StatelessWidget {
  final Widget? child;
  final EdgeInsets padding;
  const WrappingContainer(
      {this.child, this.padding = EdgeInsets.zero, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
                blurRadius: 8.0, spreadRadius: 2.0, color: Colors.black26),
          ]),
      child: child,
    );
  }
}
