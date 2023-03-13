import 'package:client/anims/init_opacity.dart';
import 'package:client/cubit/patient_data_cubit.dart';
import 'package:client/screens/perms.dart';
import 'package:client/widgets/button.dart';
import 'package:client/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../di.dart';
import '../styles/typography.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  late TextEditingController phnController;
  late TextEditingController t1Controller;
  late TextEditingController t2Controller;

  @override
  void initState() {
    phnController = TextEditingController();
    t1Controller = TextEditingController();
    t2Controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    phnController.dispose();
    t1Controller.dispose();
    t2Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false, // disables back button
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 1 / 3,
            child: InitOpacity(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Find a patient by their PHN, and authenticate with your healthcare credentials.",
                      style: kTitle.copyWith(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  TextfieldLayout(
                    controller: phnController,
                    topText: "Patient PHN",
                  ),
                  const SizedBox(height: 25),
                  TextfieldLayout(
                    controller: t1Controller,
                    topText: "Admin username",
                  ),
                  const SizedBox(height: 25),
                  TextfieldLayout(
                    password: true,
                    controller: t2Controller,
                    topText: "Admin password",
                  ),
                  const SizedBox(height: 25),
                  ButtonLayout(
                    bgColor: Colors.amber,
                    onTap: () {
                      String phn = phnController.value.text;
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => PermScreens(phn: phn),
                        ),
                      );
                      phnController.clear();
                      t1Controller.clear();
                      t2Controller.clear();
                    },
                    text: "Search for patient",
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
