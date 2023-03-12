import 'package:client/anims/scale.dart';
import 'package:client/styles/typography.dart';
import 'package:flutter/material.dart';

class ButtonLayout extends StatelessWidget {
  const ButtonLayout({
    super.key,
    required this.text,
    required this.onTap,
    required this.bgColor,
  });

  final String text;
  final VoidCallback onTap;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return ScaleAnim(
      onTap: () => onTap(),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 20, offset: const Offset(2, 1))]),
        child: Center(
          child: Text(
            text,
            style: kBody.copyWith(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
