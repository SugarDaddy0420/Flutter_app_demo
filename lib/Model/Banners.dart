// To parse this JSON data, do
//
//     final banners = bannersFromJson(jsonString);

import 'dart:convert';

Banners bannersFromJson(String str) => Banners.fromJson(json.decode(str));

String bannersToJson(Banners data) => json.encode(data.toJson());

class Banners {
  Banners({
    this.resultCode,
    this.status,
    this.data,
  });

  String resultCode;
  String status;
  Data data;

  factory Banners.fromJson(Map<String, dynamic> json) => Banners(
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
    this.bannerId,
    this.bannerImageName,
    this.bannerTitle,
    this.bannerLink,
    this.bannerIsEnabled,
    this.bannerCreatDate,
    this.bannerCreateUsr,
  });

  int bannerId;
  String bannerImageName;
  String bannerTitle;
  dynamic bannerLink;
  dynamic bannerIsEnabled;
  dynamic bannerCreatDate;
  dynamic bannerCreateUsr;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    bannerId: json["Banner_Id"],
    bannerImageName: json["Banner_ImageName"],
    bannerTitle: json["Banner_Title"],
    bannerLink: json["Banner_Link"],
    bannerIsEnabled: json["Banner_IsEnabled"],
    bannerCreatDate: json["Banner_CreatDate"],
    bannerCreateUsr: json["Banner_CreateUsr"],
  );

  Map<String, dynamic> toJson() => {
    "Banner_Id": bannerId,
    "Banner_ImageName": bannerImageName,
    "Banner_Title": bannerTitle,
    "Banner_Link": bannerLink,
    "Banner_IsEnabled": bannerIsEnabled,
    "Banner_CreatDate": bannerCreatDate,
    "Banner_CreateUsr": bannerCreateUsr,
  };
}
