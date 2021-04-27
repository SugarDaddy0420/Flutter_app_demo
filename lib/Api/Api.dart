import 'dart:io';
import 'package:dio/dio.dart';
import 'Urls.dart';

class Api{
  //取回預覽圖
  static Future queryBanner() async{
    Response response;
    var dio = Dio();
    response = await dio.post('$bannerUrl');
    if(response.statusCode == HttpStatus.ok){
      return response.data;
    }
  }
  // 取回最新消息
  static Future queryNews() async{
    Response response;
    response = await Dio().post('$newsUrl');
    if(response.statusCode == HttpStatus.ok) {
      return response.data;
    }
  }
  //取回教練資訊
  static Future queryCoach() async{
    Response response;
    response = await Dio().post('$coachUrl');
    if(response.statusCode == HttpStatus.ok) {
      return response.data;
    }
  }

  static Future queryAccount(account,password) async{
    Response response;
    response = await Dio().post('$loginUrl', data: {


      "authcode": "@#ALLEC#@%\$!",
      "centercode": "jx01",
      "memtel": "$account",
      "pw": "$password",


    });
    if(response.statusCode == HttpStatus.ok) {
      return response.data;
    }
  }

}
