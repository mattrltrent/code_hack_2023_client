import 'package:client/screens/auth.dart';
import 'package:client/screens/full_data.dart';
import 'package:client/styles/typography.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/button.dart';

enum ResultType { accept, notAccept }

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.type});

  final ResultType type;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false, // disables back button
      child: Scaffold(
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
                    type == ResultType.accept ? CupertinoIcons.check_mark : CupertinoIcons.xmark,
                    size: MediaQuery.of(context).size.width * .1,
                    color: Colors.black,
                  ),
                  const SizedBox(height: 25),
                  Text(
                    "Your patient, John Doe, has ${type == ResultType.notAccept ? "NOT " : ""}accepted your data access request!",
                    textAlign: TextAlign.center,
                    style: kHeader.copyWith(color: Colors.black),
                  ),
                  const SizedBox(height: 25),
                  SizedBox(
                    width: 200,
                    child: ButtonLayout(
                      bgColor: Colors.amber,
                      onTap: () {
                        if (type == ResultType.accept) {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const FullDataScreen()));
                        } else {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => const AuthScreen(), fullscreenDialog: true));
                        }
                      },
                      text: type == ResultType.accept ? "View Data" : "<- Back to start",
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
