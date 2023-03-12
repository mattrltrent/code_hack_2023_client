import 'package:client/anims/init_transform.dart';
import 'package:client/entity/category.dart';
import 'package:client/styles/typography.dart';
import 'package:client/widgets/visibility.dart';
import 'package:flutter/material.dart';

class Accordian extends StatelessWidget {
  const Accordian({
    super.key,
    required this.title,
    required this.desc,
    this.isSelectedShown = true,
    required this.id,
  });

  final String title;
  final String desc;
  final String id;
  final bool isSelectedShown;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2), borderRadius: const BorderRadius.all(Radius.circular(10))),
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: kHeader.copyWith(
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 12.5),
                Text(
                  desc,
                  style: kBody.copyWith(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 25),
          isSelectedShown
              ? VisibilityLayout(
                  id: id,
                  desc: desc,
                  title: title,
                  type: VisibilityType.visible,
                )
              : Container(),
        ],
      ),
    );
  }
}
