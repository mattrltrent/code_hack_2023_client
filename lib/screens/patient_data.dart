import 'package:client/cubit/patient_data_cubit.dart';
import 'package:client/screens/results.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../entity/ups.dart';
import '../styles/typography.dart';
import '../widgets/accordian.dart';
import '../widgets/button.dart';

class PatientDataScreen extends StatefulWidget {
  const PatientDataScreen({super.key});

  @override
  State<PatientDataScreen> createState() => _PatientDataScreenState();
}

class _PatientDataScreenState extends State<PatientDataScreen> {
  bool doesContain(List<Ups?> ups, String id) {
    bool found = false;
    for (var up in ups) {
      if (up!.id == id) {
        found = true;
      }
    }
    return found;
  }

  Widget createChild(Data state) {
    return state.ups!.isEmpty
        ? Text(
            "They didn't ask for anything!",
            style: kTitle.copyWith(color: Colors.black),
          )
        : ListView.builder(
            itemCount: state.ups!.length,
            itemBuilder: (context, index) {
              return Accordian(
                isSelectedShown: false,
                id: state.ups![index].id,
                title: state.categories.where((e) => e.id == state.ups![index].id).first.name,
                desc: state.categories.where((e) => e.id == state.ups![index].id).first.desc,
              );
            },
          );
  }

  Widget children(PatientDataState state) {
    if (state is Loading) {
      return const CupertinoActivityIndicator();
    } else if (state is Data) {
      return state.ups!.isEmpty
          ? createChild(state)
          : Hero(
              tag: 'd',
              child: Material(
                color: Colors.transparent,
                child: createChild(state),
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
