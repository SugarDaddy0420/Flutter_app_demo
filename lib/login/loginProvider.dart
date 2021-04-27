import 'package:flutter/material.dart';
//用provider儲存使用者登入狀態
class LoginProvider extends ChangeNotifier{
  //login 1
  //not login 0
  int _state = 0;
  int get state => _state;

  void loginState(bool item){
    if(item == true){
      _state = 1;
    }
    else{
      _state = 0;
    }

    notifyListeners();
  }
}