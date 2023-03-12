import 'package:flutter/material.dart';

class PatientDataScreen extends StatelessWidget {
  const PatientDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("Patient data screen"),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Go back"),
          ),
        ],
      ),
    ));
  }
}
