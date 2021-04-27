// To parse this JSON data, do
//
//     final news = newsFromJson(jsonString);

import 'dart:convert';

News newsFromJson(String str) => News.fromJson(json.decode(str));

String newsToJson(News data) => json.encode(data.toJson());

class News {
  News({
    this.resultCode,
    this.status,
    this.data,
  });

  String resultCode;
  String status;
  Data data;

  factory News.fromJson(Map<String, dynamic> json) => News(
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
    this.newsGuid,
    this.newsFirstTitle,
    this.newsSecTitle,
    this.newsContent,
    this.newsImgUrl,
    this.newsSendDatetime,
    this.newsIsSent,
    this.newsCreateDate,
    this.newsCreateUser,
    this.newsUpdateDate,
    this.newsUpdateUser,
  });

  String newsGuid;
  String newsFirstTitle;
  String newsSecTitle;
  String newsContent;
  String newsImgUrl;
  String newsSendDatetime;
  bool newsIsSent;
  String newsCreateDate;
  String newsCreateUser;
  dynamic newsUpdateDate;
  dynamic newsUpdateUser;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    newsGuid: json["News_GUID"],
    newsFirstTitle: json["News_FirstTitle"],
    newsSecTitle: json["News_SecTitle"],
    newsContent: json["News_Content"],
    newsImgUrl: json["News_ImgUrl"],
    newsSendDatetime: json["News_SendDatetime"],
    newsIsSent: json["News_IsSent"],
    newsCreateDate: json["News_CreateDate"],
    newsCreateUser: json["News_CreateUser"],
    newsUpdateDate: json["News_UpdateDate"],
    newsUpdateUser: json["News_UpdateUser"],
  );

  Map<String, dynamic> toJson() => {
    "News_GUID": newsGuid,
    "News_FirstTitle": newsFirstTitle,
    "News_SecTitle": newsSecTitle,
    "News_Content": newsContent,
    "News_ImgUrl": newsImgUrl,
    "News_SendDatetime": newsSendDatetime,
    "News_IsSent": newsIsSent,
    "News_CreateDate": newsCreateDate,
    "News_CreateUser": newsCreateUser,
    "News_UpdateDate": newsUpdateDate,
    "News_UpdateUser": newsUpdateUser,
  };
}
