// To parse this JSON data, do
//
//     final coach = coachFromJson(jsonString);

import 'dart:convert';

Coach coachFromJson(String str) => Coach.fromJson(json.decode(str));

String coachToJson(Coach data) => json.encode(data.toJson());

class Coach {
  Coach({
    this.resultCode,
    this.status,
    this.data,
  });

  String resultCode;
  String status;
  Data data;

  factory Coach.fromJson(Map<String, dynamic> json) => Coach(
    resultCode: json["ResultCode"],
    status: json["Status"],
    data: Data.fromJson(json["Data"]),
  );

  Map<String, dynamic> toJson() => {
    "ResultCode": resultCode,
    "Status": status,
    "Data": data.toJson(),
  };
}

class Data {
  Data({
    this.isSuccess,
    this.message,
    this.result,
  });

  bool isSuccess;
  String message;
  List<Result> result;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    isSuccess: json["IsSuccess"],
    message: json["Message"],
    result: List<Result>.from(json["Result"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "IsSuccess": isSuccess,
    "Message": message,
    "Result": List<dynamic>.from(result.map((x) => x.toJson())),
  };
}

class Result {
  Result({
    this.coachId,
    this.coachName,
    this.coachEmpertise,
    this.coachContent,
    this.coachAwards,
    this.coachLicense,
    this.coachHistory,
    this.coachPhoto,
    this.coachOrderno,
    this.coachCreatedate,
  });

  String coachId;
  String coachName;
  String coachEmpertise;
  String coachContent;
  String coachAwards;
  String coachLicense;
  String coachHistory;
  String coachPhoto;
  int coachOrderno;
  String coachCreatedate;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    coachId: json["coach_id"],
    coachName: json["coach_name"],
    coachEmpertise: json["coach_empertise"] == null ? null : json["coach_empertise"],
    coachContent: json["coach_content"] == null ? null : json["coach_content"],
    coachAwards: json["coach_awards"] == null ? null : json["coach_awards"],
    coachLicense: json["coach_license"] == null ? null : json["coach_license"],
    coachHistory: json["coach_history"],
    coachPhoto: json["coach_photo"],
    coachOrderno: json["coach_orderno"],
    coachCreatedate: json["coach_createdate"],
  );

  Map<String, dynamic> toJson() => {
    "coach_id": coachId,
    "coach_name": coachName,
    "coach_empertise": coachEmpertise == null ? null : coachEmpertise,
    "coach_content": coachContent == null ? null : coachContent,
    "coach_awards": coachAwards == null ? null : coachAwards,
    "coach_license": coachLicense == null ? null : coachLicense,
    "coach_history": coachHistory,
    "coach_photo": coachPhoto,
    "coach_orderno": coachOrderno,
    "coach_createdate": coachCreatedate,
  };
}
