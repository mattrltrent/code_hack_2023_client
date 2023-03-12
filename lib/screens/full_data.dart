import 'dart:convert';

import 'package:client/cubit/patient_data_cubit.dart';
import 'package:client/styles/typography.dart';
import 'package:client/widgets/thread.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import '../widgets/core_data.dart';

class FullDataScreen extends StatefulWidget {
  const FullDataScreen({super.key});

  @override
  State<FullDataScreen> createState() => _FullDataScreenState();
}

class _FullDataScreenState extends State<FullDataScreen> {
  @override
  void initState() {
    context.read<PatientDataCubit>().fetchAllData();
    super.initState();
  }

  Widget children(PatientDataState state) {
    if (state is Loading) {
      return const CupertinoActivityIndicator();
    } else if (state is FullData) {
      return Column(
        children: const [
          CoreData(),
          SizedBox(height: 25),
          Thread(
            depth: 4,
            title: "Title",
            body: "Body",
          ),
          Thread(
            depth: 5,
            title: "Title",
            body: "Body",
          ),
        ],
      );
    }
    return Text(
      "Error loading data",
      style: kHeader.copyWith(
        color: Colors.black,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false, // disables back button
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Center(
              child: BlocBuilder<PatientDataCubit, PatientDataState>(
                builder: (context, state) {
                  return AnimatedSwitcher(
                    duration: const Duration(
                      milliseconds: 500,
                    ),
                    child: children(state),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
