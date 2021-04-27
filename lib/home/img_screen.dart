import 'package:flutter/material.dart';

class ImgScreen extends StatelessWidget {
  String imgSrc;

  ImgScreen(this.imgSrc) : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Center(

          child: Hero(
            tag:'imageHero',
            child: Image.network('$imgSrc'),

        ),
        ),
        onTap: () {
          Navigator.pop(context);
          },
          )
    );
        }


  }

