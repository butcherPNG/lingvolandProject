


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../styles/styles.dart';

class ImgSlider extends StatelessWidget {
  double width;
  double height;
  double container;
  String img;
  String text;
  ImgSlider({
    Key? key,
    required this.height,
    required this.width,
    required this.img,
    required this.container,
    required this.text
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(100),
              bottomLeft: Radius.circular(100),
            ),
          ),
          child: ClipRRect(

            child: Image.asset(img, fit: BoxFit.fill,),
          ),
        ),
        
        Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height - 153 - 128, left: 40),
            child: Container(
              width: container,
              height: 153,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(100),
                  bottomLeft: Radius.circular(100),
                ),
              ),
              child: SelectableText(text, style: GoogleFonts.manrope(
                textStyle: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w600,
                  fontSize: 32.0,
                  height: 1.6,
                  color: Colors.white,
                )
              ),),
            ),
        )
      ],
    );
  }
}