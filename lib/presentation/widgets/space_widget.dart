import 'package:flutter/material.dart';

class Space extends StatelessWidget {
  final double size;
  const Space({super.key, this.size=0.0});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 10+size,
      width: 10+size,
    );
  }
}