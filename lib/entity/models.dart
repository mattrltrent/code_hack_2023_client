class Model {
  final String rfid;
  final String legalName;
  final String signatureId;
  final String sex;
  final String dateOfBirth;
  final bool wifeyMaterial;
  final Medication medication;
  final Insurance insurance;
  final Allergies allergies;
  final Conditions conditions;
  final LabResults labResults;
  final RadiologyResults radiologyResults;
  final HospitalReports hospitalReports;
  final InvolvedClinicians involvedClinicians;
  final ClinicVisitNotes clinicVisitNotes;
  final AdvancedCarePlanning advancedCarePlanning;

  Model({
    required this.dateOfBirth,
    required this.legalName,
    required this.rfid,
    required this.sex,
    required this.signatureId,
    required this.wifeyMaterial,
    required this.medication,
    required this.insurance,
    required this.allergies,
    required this.conditions,
    required this.labResults,
    required this.radiologyResults,
    required this.hospitalReports,
    required this.involvedClinicians,
    required this.clinicVisitNotes,
    required this.advancedCarePlanning,
  });

  factory Model.fromJson(Map<String, dynamic> json) {
    return Model(
      rfid: json["rfid"] as String,
      legalName: json["legalName"] as String,
      signatureId: json["signatureId"] as String,
      dateOfBirth: json["dateOfBirth"] as String,
      sex: json["sex"] as String,
      wifeyMaterial: json["wifeyMaterial"] as bool,
      medication: Medication.fromJson(json["medication"]),
      insurance: Insurance.fromJson(json["insurance"]),
      allergies: Allergies.fromJson(json["allergies"]),
      conditions: Conditions.fromJson(json["conditions"]),
      labResults: LabResults.fromJson(json["labResults"]),
      radiologyResults: RadiologyResults.fromJson(json["radiologyResults"]),
      hospitalReports: HospitalReports.fromJson(json["hospitalReports"]),
      involvedClinicians: InvolvedClinicians.fromJson(json["involvedClinicians"]),
      clinicVisitNotes: ClinicVisitNotes.fromJson(json["clinicVisitNotes"]),
      advancedCarePlanning: AdvancedCarePlanning.fromJson(json["advancedCarePlanning"]),
    );
  }
}

class Medication {
  final String description;
  final List<MedicationInfo> medsList;

  Medication({required this.description, required this.medsList});

  factory Medication.fromJson(Map<String, dynamic> json) {
    return Medication(
      description: json["description"] as String,
      medsList: List<MedicationInfo>.from(
        json["medsList"].map((x) => MedicationInfo.fromJson(x)),
      ),
    );
  }
}

class MedicationInfo {
  final String name;
  final int frequency;
  final int dosage;
  final String description;

  MedicationInfo({
    required this.name,
    required this.frequency,
    required this.dosage,
    required this.description,
  });

  factory MedicationInfo.fromJson(Map<String, dynamic> json) {
    return MedicationInfo(
      name: json["name"] as String,
      frequency: json["frequency"] as int,
      dosage: json["dosage"] as int,
      description: json["description"] as String,
    );
  }
}

class Insurance {
  final String description;
  final List<InsuranceInfo> insuranceList;

  Insurance({required this.description, required this.insuranceList});

  factory Insurance.fromJson(Map<String, dynamic> json) {
    return Insurance(
      description: json["description"] as String,
      insuranceList: List<InsuranceInfo>.from(
        json["insuranceList"].map((x) => InsuranceInfo.fromJson(x)),
      ),
    );
  }
}

class InsuranceInfo {
  final String name;
  final bool? dental;
  final String otherStuff;

  InsuranceInfo({
    required this.name,
    required this.dental,
    required this.otherStuff,
  });

  factory InsuranceInfo.fromJson(Map<String, dynamic> json) {
    return InsuranceInfo(
      name: json["name"] as String,
      dental: json["Dental"] as bool?,
      otherStuff: json["Other stuff"] as String,
    );
  }
}

class Allergies {
  final String description;
  final List<AllergyInfo> allergyList;

  Allergies({required this.description, required this.allergyList});

  factory Allergies.fromJson(Map<String, dynamic> json) {
    return Allergies(
      description: json["description"] as String,
      allergyList: List<AllergyInfo>.from(
        json["alergyList"].map((x) => AllergyInfo.fromJson(x)),
      ),
    );
  }
}

class AllergyInfo {
  final String name;
  final String severity;
  final String description;

  AllergyInfo({
    required this.name,
    required this.severity,
    required this.description,
  });

  factory AllergyInfo.fromJson(Map<String, dynamic> json) {
    return AllergyInfo(
      name: json["name"] as String,
      severity: json["severity"] as String,
      description: json["description"] as String,
    );
  }
}

class Condition {
  final String name;
  final String severity;
  final String description;

  Condition({
    required this.name,
    required this.severity,
    required this.description,
  });

  factory Condition.fromJson(Map<String, dynamic> json) {
    return Condition(
      name: json['name'],
      severity: json['severity'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'severity': severity,
      'description': description,
    };
  }
}

class Conditions {
  final String description;
  final List<Condition> conditionList;

  Conditions({
    required this.description,
    required this.conditionList,
  });

  factory Conditions.fromJson(Map<String, dynamic> json) {
    return Conditions(
      description: json['description'],
      conditionList: List<Condition>.from(json['conditionList'].map((x) => Condition.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'conditionList': List<dynamic>.from(conditionList.map((x) => x.toJson())),
    };
  }
}

class LabResult {
  final String name;
  final String dateReturned;
  final String description;

  LabResult({
    required this.name,
    required this.dateReturned,
    required this.description,
  });

  factory LabResult.fromJson(Map<String, dynamic> json) {
    return LabResult(
      name: json['name'],
      dateReturned: json['dateReturned'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'dateReturned': dateReturned,
      'description': description,
    };
  }
}

class LabResults {
  final String description;
  final List<LabResult> labResultsList;

  LabResults({
    required this.description,
    required this.labResultsList,
  });

  factory LabResults.fromJson(Map<String, dynamic> json) {
    return LabResults(
      description: json['description'],
      labResultsList: List<LabResult>.from(json['labResultsList'].map((x) => LabResult.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'labResultsList': List<dynamic>.from(labResultsList.map((x) => x.toJson())),
    };
  }
}

class RadiologyResult {
  final String name;
  final String dateReturned;
  final String description;

  RadiologyResult({
    required this.name,
    required this.dateReturned,
    required this.description,
  });

  factory RadiologyResult.fromJson(Map<String, dynamic> json) {
    return RadiologyResult(
      name: json['name'],
      dateReturned: json['dateReturned'],
      description: json['description'],
    );
  }
}

class RadiologyResults {
  final String description;
  final List<RadiologyResult> radiologyResultsList;

  RadiologyResults({
    required this.description,
    required this.radiologyResultsList,
  });

  factory RadiologyResults.fromJson(Map<String, dynamic> json) {
    var list = json['radiologyResultsList'] as List;
    List<RadiologyResult> radiologyResultsList = list.map((i) => RadiologyResult.fromJson(i)).toList();

    return RadiologyResults(
      description: json['description'],
      radiologyResultsList: radiologyResultsList,
    );
  }
}

class HospitalReport {
  final String name;
  final String dateReturned;
  final String description;

  HospitalReport({
    required this.name,
    required this.dateReturned,
    required this.description,
  });

  factory HospitalReport.fromJson(Map<String, dynamic> json) {
    return HospitalReport(
      name: json['name'],
      dateReturned: json['dateReturned'],
      description: json['description'],
    );
  }
}

class HospitalReports {
  final String description;
  final List<HospitalReport> hospitalReportsList;

  HospitalReports({
    required this.description,
    required this.hospitalReportsList,
  });

  factory HospitalReports.fromJson(Map<String, dynamic> json) {
    var list = json['hospitalReportsList'] as List;
    List<HospitalReport> hospitalReportsList = list.map((i) => HospitalReport.fromJson(i)).toList();

    return HospitalReports(
      description: json['description'],
      hospitalReportsList: hospitalReportsList,
    );
  }
}

class InvolvedClinician {
  final String name;
  final String specialty;
  final String description;

  InvolvedClinician({
    required this.name,
    required this.specialty,
    required this.description,
  });

  factory InvolvedClinician.fromJson(Map<String, dynamic> json) {
    return InvolvedClinician(
      name: json['name'],
      specialty: json['specialty'],
      description: json['description'],
    );
  }
}

class InvolvedClinicians {
  final String description;
  final List<InvolvedClinician> involvedCliniciansList;

  InvolvedClinicians({
    required this.description,
    required this.involvedCliniciansList,
  });

  factory InvolvedClinicians.fromJson(Map<String, dynamic> json) {
    var list = json['involvedCliniciansList'] as List;
    List<InvolvedClinician> involvedCliniciansList = list.map((i) => InvolvedClinician.fromJson(i)).toList();

    return InvolvedClinicians(
      description: json['description'],
      involvedCliniciansList: involvedCliniciansList,
    );
  }
}

class ClinicVisitNote {
  final String name;
  final String dateReturned;
  final String description;

  ClinicVisitNote({
    required this.name,
    required this.dateReturned,
    required this.description,
  });

  factory ClinicVisitNote.fromJson(Map<String, dynamic> json) {
    return ClinicVisitNote(
      name: json['name'],
      dateReturned: json['dateReturned'],
      description: json['description'],
    );
  }
}

class ClinicVisitNotes {
  final String description;
  final List<ClinicVisitNote> clinicVisitNotesList;

  ClinicVisitNotes({
    required this.description,
    required this.clinicVisitNotesList,
  });

  factory ClinicVisitNotes.fromJson(Map<String, dynamic> json) {
    var clinicVisitNotesListJson = json['clinicVistNotesList'] as List;
    List<ClinicVisitNote> clinicVisitNotesList =
        clinicVisitNotesListJson.map((note) => ClinicVisitNote.fromJson(note)).toList();

    return ClinicVisitNotes(
      description: json['description'],
      clinicVisitNotesList: clinicVisitNotesList,
    );
  }
}

class AdvancedCarePlan {
  final String name;
  final String description;

  AdvancedCarePlan({
    required this.name,
    required this.description,
  });

  factory AdvancedCarePlan.fromJson(Map<String, dynamic> json) {
    return AdvancedCarePlan(
      name: json['name'],
      description: json['description'],
    );
  }
}

class AdvancedCarePlanning {
  final String description;
  final List<AdvancedCarePlan> advancedCarePlanningList;

  AdvancedCarePlanning({
    required this.description,
    required this.advancedCarePlanningList,
  });

  factory AdvancedCarePlanning.fromJson(Map<String, dynamic> json) {
    var advancedCarePlanningListJson = json['advancedCarePlanningList'] as List;
    List<AdvancedCarePlan> advancedCarePlanningList =
        advancedCarePlanningListJson.map((plan) => AdvancedCarePlan.fromJson(plan)).toList();

    return AdvancedCarePlanning(
      description: json['description'],
      advancedCarePlanningList: advancedCarePlanningList,
    );
  }
}
