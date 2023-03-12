import 'package:flutter/material.dart';

class FullDataScreen extends StatelessWidget {
  const FullDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false, // disables back button

      child: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text("test data"),
            ],
          ),
        ),
      ),
    );
  }
}
