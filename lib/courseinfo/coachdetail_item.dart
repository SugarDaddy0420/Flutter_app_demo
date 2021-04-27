import 'package:flutter/material.dart';
import 'package:flutter_app/Model/Coach.dart';

Widget coachDetailItem(BuildContext context, Result coachResult) {
  final listTitle = ["學歷", "專長", "獎項", "經歷"];
  final listContent = [
    "${coachResult.coachContent}",
    "${coachResult.coachEmpertise}",
    "${coachResult.coachAwards}",
    "${coachResult.coachHistory}",
  ];

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: List.generate(4, (index) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 10,
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Text('${listTitle[index]}',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[900])),
          ),
          SizedBox(
            width: 20,
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Text('${listContent[index]}',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    )),
          ),
        ],
      );
    }),
  );
}
