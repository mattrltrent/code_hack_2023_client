import 'dart:convert';

import 'package:client/cubit/patient_data_cubit.dart';
import 'package:client/styles/typography.dart';
import 'package:client/widgets/thread.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import '../widgets/button.dart';
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
        children: [
          CoreData(
            title: state.model.legalName,
            body: "DOB: ${state.model.dateOfBirth} • SEX: ${state.model.sex}",
          ),
          const SizedBox(height: 25),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Here go some specific notes about the patient.",
                    style: kBody.copyWith(color: Colors.black),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 12.5),
                  Thread(
                    depth: 1,
                    title: "Medication",
                    body: state.model.medication.description,
                  ),
                  ...state.model.medication.medsList
                      .map(
                        (i) => Thread(
                          depth: 2,
                          title: i.name,
                          body: "${i.description} • ${i.dosage} • ${i.frequency}",
                        ),
                      )
                      .toList(),
                  Thread(
                    depth: 1,
                    title: "Insurance",
                    body: state.model.insurance.description,
                  ),
                  ...state.model.insurance.insuranceList
                      .map(
                        (i) => Thread(
                          depth: 2,
                          title: i.name,
                          body: "${i.dental} • ${i.otherStuff}",
                        ),
                      )
                      .toList(),
                  Thread(
                    depth: 1,
                    title: "Allergies",
                    body: state.model.allergies.description,
                  ),
                  ...state.model.allergies.allergyList
                      .map(
                        (i) => Thread(
                          depth: 2,
                          title: i.name,
                          body: "${i.description} • ${i.severity}",
                        ),
                      )
                      .toList(),
                  Thread(
                    depth: 1,
                    title: "Conditions",
                    body: state.model.conditions.description,
                  ),
                  ...state.model.conditions.conditionList
                      .map(
                        (i) => Thread(
                          depth: 2,
                          title: i.name,
                          body: "${i.description} • ${i.severity}",
                        ),
                      )
                      .toList(),
                  Thread(
                    depth: 1,
                    title: "Lab results",
                    body: state.model.labResults.description,
                  ),
                  ...state.model.labResults.labResultsList
                      .map(
                        (i) => Thread(
                          depth: 2,
                          title: i.name,
                          body: "${i.description} • ${i.dateReturned}",
                        ),
                      )
                      .toList(),
                  Thread(
                    depth: 1,
                    title: "Radiology results",
                    body: state.model.radiologyResults.description,
                  ),
                  ...state.model.radiologyResults.radiologyResultsList
                      .map(
                        (i) => Thread(
                          depth: 2,
                          title: i.name,
                          body: "${i.description} • ${i.dateReturned}",
                        ),
                      )
                      .toList(),
                  Thread(
                    depth: 1,
                    title: "Hospital reports",
                    body: state.model.hospitalReports.description,
                  ),
                  ...state.model.hospitalReports.hospitalReportsList
                      .map(
                        (i) => Thread(
                          depth: 2,
                          title: i.name,
                          body: "${i.description} • ${i.dateReturned}",
                        ),
                      )
                      .toList(),
                  Thread(
                    depth: 1,
                    title: "Involved clinicians",
                    body: state.model.involvedClinicians.description,
                  ),
                  ...state.model.involvedClinicians.involvedCliniciansList
                      .map(
                        (i) => Thread(
                          depth: 2,
                          title: i.name,
                          body: "${i.description} • ${i.specialty}",
                        ),
                      )
                      .toList(),
                  Thread(
                    depth: 1,
                    title: "Clinic visit notes",
                    body: state.model.clinicVisitNotes.description,
                  ),
                  ...state.model.clinicVisitNotes.clinicVisitNotesList
                      .map(
                        (i) => Thread(
                          depth: 2,
                          title: i.name,
                          body: "${i.description} • ${i.dateReturned}",
                        ),
                      )
                      .toList(),
                  Thread(
                    depth: 1,
                    title: "Advanced care planning",
                    body: state.model.advancedCarePlanning.description,
                  ),
                  ...state.model.advancedCarePlanning.advancedCarePlanningList
                      .map(
                        (i) => Thread(
                          depth: 2,
                          title: i.name,
                          body: i.description,
                        ),
                      )
                      .toList(),
                  SizedBox(height: MediaQuery.of(context).padding.bottom),
                ],
              ),
            ),
          ),
        ],
      );
    }
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
            onTap: () => context.read<PatientDataCubit>().fetchAllData(),
            text: "Retry",
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false, // disables back button
      child: Scaffold(
        body: SafeArea(
          bottom: false,
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
