import 'package:client/styles/typography.dart';
import 'package:client/widgets/visibility.dart';
import 'package:flutter/material.dart';

class Accordian extends StatelessWidget {
  const Accordian({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(20),
      decoration:
          BoxDecoration(color: Colors.grey.withOpacity(0.2), borderRadius: const BorderRadius.all(Radius.circular(10))),
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Allergies",
                  style: kHeader.copyWith(
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 12.5),
                Text(
                  "This is a cool description for this field.",
                  style: kBody.copyWith(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 25),
          const VisibilityLayout(type: VisibilityType.visible),
        ],
      ),
    );
  }
}
