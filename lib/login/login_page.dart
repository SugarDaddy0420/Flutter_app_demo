import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Api/Api.dart';
import 'package:flutter_app/Model/Account.dart';
import 'package:flutter_app/home/Home.dart';
import 'package:flutter_app/main.dart';
import 'package:provider/provider.dart';

import 'loginProvider.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Account account;

  var accountCtor = TextEditingController();
  var pwdCtor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("登入"),
      ),
      body: ChangeNotifierProvider(
        create: (BuildContext context)
        {
          LoginProvider();


        },
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Image.asset('assets/images/noname.png'),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextField(
                  controller: accountCtor,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: '請輸入帳號',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextField(
                  controller: pwdCtor,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '請輸入密碼',
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    child: Text(
                      '登入',
                      style: TextStyle(fontSize: 20),
                    ),

                    // 點擊登入按鈕後才會連接API並確認帳號密碼是否錯誤
                    onPressed: () {
                      Api.queryAccount(accountCtor.text, pwdCtor.text)
                          .then((value) {
                        var data = Account.fromJson(value);
                        print(value);

                        // rs == 0 代表通過
                        // rs == 4 代表失敗
                        if (data.rs == 0) {
                          Provider.of<LoginProvider>(context, listen: false)
                              .loginState(true);
                          showDialog(
                              context: context,
                              builder: (context) {
                                Future.delayed(Duration(seconds: 1), () {
                                  // 回到 Home 頁面
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => MyHomePage()));
                                });
                                return AlertDialog(
                                  backgroundColor: Colors.grey[800],
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15))),
                                  content: Column(
                                    // 對齊方式
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,

                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Icon(
                                        Icons.account_circle,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(right: 20),
                                      ),
                                      Text(
                                        '登入成功',
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                );
                              });
                        } else {
                          // 跳錯誤訊息
                          showDialog(
                              context: context,
                              builder: (context) {
                                Future.delayed(Duration(seconds: 3), () {
                                  Navigator.pop(context);
                                });
                                return AlertDialog(
                                  backgroundColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15))),
                                  content: Column(
                                    // 對齊方式
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,

                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Icon(
                                        Icons.announcement_outlined,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(right: 20),
                                      ),
                                      Text(
                                        data.rsmessage,
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                );
                              });
                        }
                      });
                      // Navigator.pop(context);
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
