import 'package:client/cubit/patient_data_cubit.dart';
import 'package:client/screens/patient_data.dart';
import 'package:client/styles/typography.dart';
import 'package:client/widgets/accordian.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/button.dart';

class PermScreens extends StatefulWidget {
  const PermScreens({super.key, required this.phn});

  final String phn;

  @override
  State<PermScreens> createState() => _PermScreensState();
}

class _PermScreensState extends State<PermScreens> {
  @override
  void initState() {
    context.read<PatientDataCubit>().loadData(widget.phn, widget.phn);
    super.initState();
  }

  Widget children(PatientDataState state) {
    if (state is Loading) {
      return const CupertinoActivityIndicator();
    } else if (state is Data) {
      return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: const [
            SizedBox(height: 10),
            Accordian(),
            Accordian(),
            Accordian(),
            Accordian(),
            Accordian(),
            Accordian(),
            Accordian(),
            Accordian(),
            Accordian(),
            SizedBox(height: 25),
          ],
        ),
      );
    } else {
      return const Text("Error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "What data do you need from the patient?",
                        style: kHeader.copyWith(color: Colors.black),
                      ),
                      const SizedBox(height: 25),
                      Text(
                        "John Doe • PHN: ${widget.phn}",
                        style: kBody.copyWith(color: Colors.black),
                      ),
                      const SizedBox(height: 25),
                      Container(color: Colors.grey.withOpacity(0.5), height: 1, width: double.infinity),
                      const SizedBox(height: 25),
                      Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: ButtonLayout(
                              bgColor: Colors.amber,
                              onTap: () => Navigator.pop(context),
                              text: "<- Go back",
                            ),
                          ),
                          const SizedBox(height: 12.5),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: ButtonLayout(
                              bgColor: Colors.amber,
                              onTap: () => Navigator.push(
                                  context, MaterialPageRoute(builder: (context) => const PatientDataScreen())),
                              text: "Ask patient for permission ->",
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Center(
                  child: BlocBuilder<PatientDataCubit, PatientDataState>(
                    key: UniqueKey(),
                    builder: (context, state) {
                      return AnimatedSwitcher(
                        duration: const Duration(milliseconds: 750),
                        child: children(state),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
