import 'package:client/cubit/patient_data_cubit.dart';
import 'package:client/screens/results.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../styles/typography.dart';
import '../widgets/accordian.dart';
import '../widgets/button.dart';

class PatientDataScreen extends StatefulWidget {
  const PatientDataScreen({super.key});

  @override
  State<PatientDataScreen> createState() => _PatientDataScreenState();
}

class _PatientDataScreenState extends State<PatientDataScreen> {
  Widget children(PatientDataState state) {
    if (state is Loading) {
      return const CupertinoActivityIndicator();
    } else if (state is Data) {
      return Hero(
        tag: 'd',
        child: Material(
          color: Colors.transparent,
          child: ListView.builder(
            itemCount: state.categories.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return const SizedBox(height: 10);
              } else if (index == state.categories.length + 2) {
                return const SizedBox(height: 25);
              } else {
                return Accordian(
                  isSelectedShown: false,
                  id: state.categories[index - 1].id,
                  title: state.categories[index - 1].name,
                  desc: state.categories[index - 1].desc,
                );
              }
            },
          ),
        ),
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "So, uh, something went wrong...",
            style: kTitle.copyWith(color: Colors.black),
          ),
          const SizedBox(height: 25),
          SizedBox(
            width: 150,
            child: ButtonLayout(
              bgColor: Colors.amber,
              onTap: () => context.read<PatientDataCubit>().loadData("name", "phn"),
              text: "Retry",
            ),
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false, // disables back button

      child: Scaffold(
          body: Center(
        child: SafeArea(
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 2 / 3,
                  child: Text(
                    "Do you consent to your healthcare provider accessing this data?",
                    textAlign: TextAlign.center,
                    style: kHeader.copyWith(color: Colors.black),
                  ),
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 200,
                      child: ButtonLayout(
                        bgColor: Colors.amber,
                        onTap: () => Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const ResultScreen(type: ResultType.notAccept))),
                        text: "NO",
                      ),
                    ),
                    const SizedBox(width: 25),
                    SizedBox(
                      width: 200,
                      child: ButtonLayout(
                        bgColor: Colors.amber,
                        onTap: () => Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const ResultScreen(type: ResultType.accept))),
                        text: "YES",
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                Expanded(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 350),
                    child: BlocBuilder<PatientDataCubit, PatientDataState>(
                      key: UniqueKey(),
                      builder: (context, state) {
                        return children(state);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
