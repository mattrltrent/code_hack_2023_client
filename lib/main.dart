import 'package:client/cubit/patient_data_cubit.dart';
import 'package:client/di.dart';
import 'package:client/screens/auth.dart';
import 'package:client/screens/results.dart';
import 'package:client/styles/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Client",
      home: ResultScreen(),
    );
  }
}
