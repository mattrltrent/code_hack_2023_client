import 'package:client/screens/auth.dart';
import 'package:client/styles/typography.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/button.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: SizedBox(
            width: 400,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  CupertinoIcons.check_mark,
                  size: MediaQuery.of(context).size.width * .1,
                  color: Colors.black,
                ),
                const SizedBox(height: 25),
                Text(
                  "Your patient, John Doe, has accepted your data access request!",
                  textAlign: TextAlign.center,
                  style: kHeader.copyWith(color: Colors.black),
                ),
                const SizedBox(height: 25),
                SizedBox(
                  width: 200,
                  child: ButtonLayout(
                    bgColor: Colors.amber,
                    onTap: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => const AuthScreen(), fullscreenDialog: true));
                    },
                    text: "<- Back to start",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
