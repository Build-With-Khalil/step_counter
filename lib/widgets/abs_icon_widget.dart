import 'package:flutter/material.dart';

class AbsIconWidget extends StatelessWidget {
  final String path;
  final double size;

  const AbsIconWidget({required this.path, this.size = 80});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      path,
      width: size,
      height: size,
      fit: BoxFit.contain,
    );
  }
}