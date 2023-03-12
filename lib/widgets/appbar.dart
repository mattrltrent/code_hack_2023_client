import 'package:client/styles/typography.dart';
import 'package:flutter/material.dart';

class AppbarLayout extends StatelessWidget {
  const AppbarLayout({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        color: Colors.amber,
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Text(
            text,
            style: kTitle.copyWith(
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
