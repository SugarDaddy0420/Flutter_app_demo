import 'package:flutter/material.dart';
import 'package:flutter_app/login/loginProvider.dart';
import 'package:flutter_app/login/login_page.dart';
import 'package:flutter_app/main.dart';
import 'package:provider/provider.dart';

class Member extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //抓取LoginProvider登入狀態
     final login = Provider.of<LoginProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('會員中心'),
          actions: <Widget>[
        // ChangeNotifierProvider(
        //     create: (BuildContext context) => LoginProvider(),
        //     child:
            Padding(
              padding: EdgeInsets.all(10.0),
              //登出
              child: IconButton(
                  icon: Icon(Icons.logout),
                  onPressed: () {
                    if (login.state == 1) {
                      login.loginState(false);
                      showDialog(
                          context: context,
                          builder: (context) {
                            Future.delayed(Duration(seconds: 1), () {
                              Navigator.pushNamed(context, '/home');
                            });
                            return AlertDialog(
                                backgroundColor: Colors.blueGrey,
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                ),
                                content: Container(
                                  height: 25,
                                  width: 80,
                                  child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Text(
                                        '登出成功',
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.white),
                                      )),
                                ));
                          });
                    } else {
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/login', (_) => false);
                    }
                  }



                  ),
            )
      ])
      // body: Center(
      //   child: Text('member'),
      // ),
    );
  }
}
