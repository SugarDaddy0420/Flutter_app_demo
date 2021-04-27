// To parse this JSON data, do
//
//     final account = accountFromJson(jsonString);

import 'dart:convert';

Account accountFromJson(String str) => Account.fromJson(json.decode(str));

String accountToJson(Account data) => json.encode(data.toJson());

class Account {
  Account({
    this.rs,
    this.rsmessage,
    this.centercode,
    this.levelname,
    this.eweektimes,
    this.memptype,
  });

  int rs;
  String rsmessage;
  String centercode;
  String levelname;
  int eweektimes;
  int memptype;

  factory Account.fromJson(Map<String, dynamic> json) => Account(
    rs: json["rs"],
    rsmessage: json["rsmessage"],
    centercode: json["centercode"],
    levelname: json["levelname"],
    eweektimes: json["eweektimes"],
    memptype: json["memptype"],
  );

  Map<String, dynamic> toJson() => {
    "rs": rs,
    "rsmessage": rsmessage,
    "centercode": centercode,
    "levelname": levelname,
    "eweektimes": eweektimes,
    "memptype": memptype,
  };
}
