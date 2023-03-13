import 'package:client/anims/scale.dart';
import 'package:client/cubit/patient_data_cubit.dart';
import 'package:client/styles/typography.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../entity/category.dart';

enum VisibilityType {
  visible,
  hidden,
}

class VisibilityLayout extends StatefulWidget {
  const VisibilityLayout({
    super.key,
    required this.type,
    required this.desc,
    required this.id,
    required this.title,
  });

  final VisibilityType type;
  final String title;
  final String desc;
  final String id;

  @override
  State<VisibilityLayout> createState() => _VisibilityLayoutState();
}

class _VisibilityLayoutState extends State<VisibilityLayout> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return ScaleAnim(
      onTap: () {
        setState(() => isSelected = !isSelected);
        context.read<PatientDataCubit>().setUps(widget.id, isSelected);
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: isSelected ? Colors.greenAccent : Colors.redAccent,
            boxShadow: [
              BoxShadow(
                color: isSelected ? Colors.green.withOpacity(0.4) : Colors.red.withOpacity(0.4),
                blurRadius: 20,
                offset: const Offset(2, 1),
              )
            ]),
        child: Row(
          children: [
            Icon(
              isSelected ? CupertinoIcons.eye : CupertinoIcons.eye_slash,
              color: Colors.black,
            ),
            const SizedBox(width: 12.5),
            Text(
              isSelected ? "Request" : "Irrelevant",
              style: kTitle.copyWith(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
