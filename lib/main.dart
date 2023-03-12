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

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) => sl<PatientDataCubit>(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Client",
        home: AuthScreen(),
      ),
    );
  }
}
