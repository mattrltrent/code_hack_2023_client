import 'package:client/anims/init_border_radius.dart';
import 'package:client/anims/init_scale.dart';
import 'package:client/anims/scale.dart';
import 'package:client/screens/auth.dart';
import 'package:client/styles/typography.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CoreData extends StatelessWidget {
  const CoreData({super.key, required this.title, required this.body});

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InitScale(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.lightBlue.withOpacity(0.3),
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
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
                        body,
                        style: kBody.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  ScaleAnim(
                      child: const Icon(
                        CupertinoIcons.xmark,
                        size: 35,
                        color: Colors.black,
                      ),
                      onTap: () =>
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const AuthScreen()))),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
