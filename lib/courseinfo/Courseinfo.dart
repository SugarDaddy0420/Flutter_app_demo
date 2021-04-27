import 'package:flutter/material.dart';
import 'package:flutter_app/Api/Api.dart';
import 'package:flutter_app/Model/Coach.dart';
import 'package:flutter_app/courseinfo/coach_item.dart';
import 'package:flutter_app/courseinfo/course_item.dart';

class Courseinfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
                bottom: TabBar(
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.white,
                  tabs: [
                    Tab(text: '課程',),
                    Tab(text: '教練',),
                  ],
                ),
                title:Text('Tabs Demo')
        ),
          body: FutureBuilder(
            future: Api.queryCoach(),
            builder: (context,snapshot){
              if(!snapshot.hasData) {
                return Center(
                  child:CircularProgressIndicator(
                    backgroundColor: Colors.red,
                  ),
                );
              }

              //有資料
              var coachData = Coach.fromJson(snapshot.data);
              return
                TabBarView(
                  children: [

                    CourseItem(),
                    CoachItem(coachData),
                  ],
                );

            },
          )


    ),);
  }
}
