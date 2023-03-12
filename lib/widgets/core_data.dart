import 'package:client/anims/scale.dart';
import 'package:client/screens/auth.dart';
import 'package:client/styles/typography.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CoreData extends StatelessWidget {
  const CoreData({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
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
                      "John Doe",
                      style: kHeader.copyWith(
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 12.5),
                    Text(
                      "01/01/2000 • Male",
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
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AuthScreen()))),
              ],
            ),
          ),
        ),
        const SizedBox(height: 25),
        Text(
          "These are the personalized patient notes.",
          style: kBody.copyWith(color: Colors.black),
          textAlign: TextAlign.left,
        )
      ],
    );
  }
}
