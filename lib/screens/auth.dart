import 'package:client/screens/perms.dart';
import 'package:client/widgets/button.dart';
import 'package:client/widgets/textfield.dart';
import 'package:flutter/material.dart';

import '../styles/typography.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
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
                  "Find patient by ID",
                  style: kTitle.copyWith(
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 25),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Enter a patient's PHN to find them in the system!",
                  style: kBody.copyWith(
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 25),
              TextfieldLayout(
                controller: controller,
                topText: "Enter patient PHN",
                showTopText: false,
              ),
              const SizedBox(height: 25),
              ButtonLayout(
                bgColor: Colors.amber,
                onTap: () {
                  String phn = controller.value.text;
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => PermScreens(phn: phn),
                    ),
                  );
                  controller.clear();
                },
                text: "Submit",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
