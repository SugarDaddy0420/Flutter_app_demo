
import 'package:flutter/material.dart';
import 'package:flutter_app/Model/Coach.dart';
import 'package:flutter_app/courseinfo/coachdetail_item.dart';

class CoachDetail extends StatelessWidget {
  Result coachResult;

  CoachDetail(this.coachResult) :super();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('教練資訊'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            expandedHeight: 350,
            backgroundColor: Colors.transparent,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network('${coachResult.coachPhoto}'),
            ),
          ),
         SliverList(
             delegate: SliverChildListDelegate([

               coachDetailItem(context,coachResult)


             ])


         )
        ],

    ),
    );
  }
}
