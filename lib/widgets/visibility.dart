import 'package:client/anims/scale.dart';
import 'package:client/styles/typography.dart';
import 'package:flutter/material.dart';

enum VisibilityType {
  visible,
  hidden,
}

class VisibilityLayout extends StatefulWidget {
  const VisibilityLayout({super.key, required this.type});

  final VisibilityType type;

  @override
  State<VisibilityLayout> createState() => _VisibilityLayoutState();
}

class _VisibilityLayoutState extends State<VisibilityLayout> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return ScaleAnim(
      onTap: () => setState(() => isSelected = !isSelected),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: isSelected ? Colors.greenAccent : Colors.redAccent,
            boxShadow: [
              BoxShadow(
                  color: isSelected ? Colors.green.withOpacity(0.2) : Colors.red.withOpacity(0.2),
                  blurRadius: 20,
                  offset: const Offset(2, 1))
            ]),
        child: Text(
          isSelected ? "Requesting access" : "Don't need it",
          style: kBody.copyWith(color: Colors.black),
        ),
      ),
    );
  }
}