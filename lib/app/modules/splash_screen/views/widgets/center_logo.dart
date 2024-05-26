import 'package:flutter/material.dart';

class CenterLogo extends StatelessWidget {
  const CenterLogo({
    super.key, 
    required this.logo, 
    this.width, 
    this.height
    });

  final String logo;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        logo,
        width: width,
        height: height,
      ),
    );
  }
}