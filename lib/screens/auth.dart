import 'package:client/cubit/patient_data_cubit.dart';
import 'package:client/screens/perms.dart';
import 'package:client/widgets/button.dart';
import 'package:client/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../styles/typography.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  late TextEditingController phnController;

  @override
  void initState() {
    phnController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    phnController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 1 / 3,
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
                controller: TextEditingController(),
                topText: "Admin username",
              ),
              const SizedBox(height: 25),
              TextfieldLayout(
                password: true,
                controller: TextEditingController(),
                topText: "Admin password",
              ),
              const SizedBox(height: 25),
              ButtonLayout(
                bgColor: Colors.amber,
                onTap: () {
                  String phn = phnController.value.text;
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => BlocProvider(
                        create: (context) => PatientDataCubit(),
                        child: PermScreens(phn: phn),
                      ),
                    ),
                  );
                  phnController.clear();
                },
                text: "Search for patient",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
