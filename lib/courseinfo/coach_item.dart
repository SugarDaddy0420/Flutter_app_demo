import 'package:flutter_app/Model/Coach.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/courseinfo/coach_detail.dart';

class CoachItem extends StatelessWidget {
  Coach coach;

  CoachItem(this.coach) : super();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: ListView.separated(
        separatorBuilder: (context, index) {
          return Divider(
            color: Colors.black,
          );
        },
        itemCount: coach.data.result.length,
        itemBuilder: (context, index) {
          return InkWell(
            child: Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Center(
                  child: Text(
                    '${coach.data.result[index].coachName}',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Image.network('${coach.data.result[index].coachPhoto}',height: 200,)
              )
            ],
          ),
            onTap: (){
              var passData = coach.data.result[index];
              Navigator.push(context,MaterialPageRoute(builder: (_) => CoachDetail(passData)));


            },
          );
        },
      ),
    );
  }
}
