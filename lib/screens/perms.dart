import 'package:alert_banner/exports.dart';
import 'package:client/anims/init_scale.dart';
import 'package:client/anims/init_transform.dart';
import 'package:client/cubit/patient_data_cubit.dart';
import 'package:client/screens/patient_data.dart';
import 'package:client/styles/typography.dart';
import 'package:client/widgets/accordian.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../di.dart';
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
      return Hero(
        tag: 'd',
        child: Material(
          color: Colors.transparent,
          child: ListView.builder(
            cacheExtent: 99999999,
            itemCount: state.categories.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return const SizedBox(height: 10);
              } else if (index == state.categories.length + 2) {
                return const SizedBox(height: 25);
              } else {
                return InitScale(
                  delayDurationInMilliseconds: 150 * index,
                  durationOfScaleInMilliseconds: 150,
                  child: Accordian(
                    id: state.categories[index - 1].id,
                    title: state.categories[index - 1].name,
                    desc: state.categories[index - 1].desc,
                  ),
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
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: SafeArea(
                  bottom: false,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "What data do you need from your patient?",
                        style: kHeader.copyWith(color: Colors.black),
                      ),
                      const SizedBox(height: 25),
                      Text(
                        "PHN: ${widget.phn}, Kate Wilson",
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
                              onTap: () {
                                if (context.read<PatientDataCubit>().state is Data) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const PatientDataScreen(),
                                    ),
                                  );
                                } else {
                                  showAlertBanner(
                                    context,
                                    () {},
                                    Container(
                                      decoration: const BoxDecoration(
                                        color: Colors.redAccent,
                                        borderRadius: BorderRadius.all(Radius.circular(10)),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(20),
                                        child: Text(
                                          "Unable to ask patient for permission if data hasn't loaded!",
                                          textAlign: TextAlign.center,
                                          style: kBody.copyWith(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              },
                              text: "Ask patient for permission ->",
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                width: double.infinity,
                color: Colors.grey.withOpacity(0.2),
                child: SafeArea(
                  bottom: false,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Center(
                      child: BlocBuilder<PatientDataCubit, PatientDataState>(
                        key: UniqueKey(),
                        builder: (context, state) {
                          return AnimatedSwitcher(
                            duration: const Duration(milliseconds: 850),
                            child: children(state),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
