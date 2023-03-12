import 'package:client/cubit/patient_data_cubit.dart';
import 'package:client/screens/auth.dart';
import 'package:client/screens/full_data.dart';
import 'package:client/styles/typography.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/button.dart';

enum ResultType { accept, notAccept }

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key, required this.type});

  final ResultType type;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  void initState() {
    if (widget.type == ResultType.accept) {
      context.read<PatientDataCubit>().sendData(context.read<PatientDataCubit>().state);
    }
    super.initState();
  }

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
                    widget.type == ResultType.accept ? CupertinoIcons.check_mark : CupertinoIcons.xmark,
                    size: MediaQuery.of(context).size.width * .1,
                    color: Colors.black,
                  ),
                  const SizedBox(height: 25),
                  Text(
                    "Your patient, John Doe, has ${widget.type == ResultType.notAccept ? "NOT " : ""}accepted your data access request!",
                    textAlign: TextAlign.center,
                    style: kHeader.copyWith(color: Colors.black),
                  ),
                  const SizedBox(height: 25),
                  widget.type == ResultType.accept
                      ? Column(
                          children: [
                            Text(
                              "This access request has been logged.",
                              textAlign: TextAlign.center,
                              style: kBody.copyWith(color: Colors.black),
                            ),
                            const SizedBox(height: 25),
                          ],
                        )
                      : Container(),
                  SizedBox(
                    width: 200,
                    child: ButtonLayout(
                      bgColor: Colors.amber,
                      onTap: () {
                        if (widget.type == ResultType.accept) {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const FullDataScreen()));
                        } else {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => const AuthScreen(), fullscreenDialog: true));
                        }
                      },
                      text: widget.type == ResultType.accept ? "View Data" : "<- Back to start",
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
