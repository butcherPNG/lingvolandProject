import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';


import '../main.dart';
import '../widgets/onHoverWidget.dart';


Color red = Color(0xffF44336);
Color dark = Color(0xff2C3944);
Color blue = Color(0xff6B99C3);
Color light_blue = Color(0xffEFF8FF);
Color pink = Color(0xffFFDDDD);
Color white = Colors.white;

TextStyle offerTxt({double? size}){
  return GoogleFonts.manrope(
      textStyle: TextStyle(
        fontSize: size ?? 72,
        fontWeight: FontWeight.bold,
        color: dark,
      )
  );
}

TextStyle blockTxt({Color? color, double? size}){
  return GoogleFonts.manrope(
    textStyle: TextStyle(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        fontSize: size?? 20,
        height: 1.6,
        color: color ?? dark,
    )
);
}

TextStyle courseTxt({
    Color? color,
    double? size
  }){
  return GoogleFonts.manrope(
      textStyle: TextStyle(
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.normal,
          fontSize: size ?? 16.0,
          height: 1.2, //line height
          color: color ?? dark
      )
  );
}

TextStyle navTxt({
  Color? color,
  required double fontSize,
  required FontWeight weight,
  bool? underline
}){
  return GoogleFonts.manrope(
      textStyle: TextStyle(
          fontStyle: FontStyle.normal,
          fontWeight: weight,
          fontSize: fontSize,
          height: 1.6, //line height
          color: color ?? dark,
          decoration: underline == true ? TextDecoration.underline : TextDecoration.none
      )
  );
}

TextStyle headerTxt({Color? color, double? size}){
  return GoogleFonts.manrope(
      textStyle: TextStyle(
        fontSize: size ?? 64,
        fontWeight: FontWeight.bold,
        color: color ?? dark,
      )
  );
}

TextStyle subHeaderTxt({Color? color, double? size}){
  return GoogleFonts.manrope(
      textStyle: TextStyle(
        fontSize: size ?? 40,
        fontWeight: FontWeight.bold,
        color: color ?? dark,
      )
  );
}

TextStyle middleTxt({required double fontSize, Color? color}){
  return GoogleFonts.manrope(
      textStyle: TextStyle(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
        fontSize: fontSize,
        height: 1.2,
        color: color ?? dark,

      )
  );
}

Widget courseCard({
    required Color backgr,
    required String title,
    required String price,
    required String img,
    required Function() tap
  }){


    return Container(
      width: 387,
      height: 442,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(47, 47, 47, 0.06),
            blurRadius: 24,
            offset: Offset(0, 4),
          ),
        ],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Color(0xFFE1E1E1), width: 1),

      ),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 171, 0, 0),
            child: Container(
              width: 387,
              height: 271,
              child: ClipRRect(
                  borderRadius: BorderRadius. circular(8.0),
                  child: Image.network(img, fit: BoxFit.cover
                  )

              ),
            ),
          ),
          Container(
              width: 387,
              height: 181,
              decoration: BoxDecoration(
                color: backgr, // цвет фона в формате ARGB
                border: backgr == dark ? null : Border.all(color: Color(0xFFE1E1E1), width: 1),
                borderRadius: BorderRadius.circular(8), // радиус границ
              ),
              child: Padding(
                  padding: EdgeInsets.fromLTRB(24, 38, 24, 38),
                  child: Container(
                    width: 338,
                    height: 95,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title, style: middleTxt(fontSize: 24, color: backgr == dark ? white : dark),),
                        Spacer(),
                        Row(
                          children: [
                            Text(price, style: courseTxt(color: backgr == dark ? white : dark),),
                            Spacer(),


                            InkResponse(
                                onTap: tap,
                                child: OnHoverWidget(
                                  builder: (bool isHovered) {
                                    return Container(
                                      width: 39,
                                      height: 39,
                                      decoration: BoxDecoration(
                                        color:  backgr == dark ?
                                        isHovered ? white : Colors.transparent
                                            : isHovered ? dark : Colors.transparent,
                                        border: Border.all(color: backgr == dark ? white : dark, width: 2),
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: Center(
                                        child: SvgPicture.asset('assets/arrow.svg',
                                          width: 7,
                                          height: 14,
                                          color: backgr == dark ?
                                          isHovered ? dark : white
                                              : isHovered ? white  : dark,
                                        ),
                                      ),
                                    );
                                  },)
                            )

                          ],
                        )

                      ],
                    ),
                  )
              )
          )
        ],
      ),
    );

}

Widget tabletCourseCard({
  required Color backgr,
  required String title,
  required String price,
  required String img,
  required Function() tap
}){
  return Container(
    width: 235,
    height: 268,
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Color.fromRGBO(47, 47, 47, 0.06),
          blurRadius: 24,
          offset: Offset(0, 4),
        ),
      ],
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: Color(0xFFE1E1E1), width: 1),

    ),
    child: Stack(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(0, 103, 0, 0),
          child: Container(
            width: 235,
            height: 165,
            child: ClipRRect(
                borderRadius: BorderRadius. circular(8.0),
                child: Image.network(img, fit: BoxFit.cover
                )

            ),
          ),
        ),
        Container(
            width: 235,
            height: 110,
            decoration: BoxDecoration(
              color: backgr, // цвет фона в формате ARGB
              border: backgr == dark ? null : Border.all(color: Color(0xFFE1E1E1), width: 1),
              borderRadius: BorderRadius.circular(8), // радиус границ
            ),
            child: Padding(
                padding: EdgeInsets.fromLTRB(14, 16, 14, 20),
                child: Container(
                  width: 207,
                  height: 75,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: middleTxt(fontSize: 16, color: backgr == dark ? white : dark),),
                      Spacer(),
                      Row(
                        children: [
                          Text(price, style: courseTxt(size: 14, color: backgr == dark ? white : dark),),
                          Spacer(),

                          InkResponse(
                              onTap: tap,
                              child: OnHoverWidget(
                                builder: (bool isHovered) {
                                  return Container(
                                    width: 24,
                                    height: 24,
                                    decoration: BoxDecoration(
                                      color:  backgr == dark ?
                                      isHovered ? white : Colors.transparent
                                          : isHovered ? dark : Colors.transparent,
                                      border: Border.all(color: backgr == dark ? white : dark, width: 1),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: Center(
                                      child: SvgPicture.asset('assets/arrow.svg',
                                        width: 5,
                                        height: 9,
                                        color: backgr == dark ?
                                        isHovered ? dark : white
                                            : isHovered ? white  : dark,
                                      ),
                                    ),
                                  );
                                },)
                          )

                        ],
                      )

                    ],
                  ),
                )
            )
        )
      ],
    ),
  );
}

Widget mobileCourseCard({
  required Color backgr,
  required String title,
  required String price,
  required String img,
  required Function() tap
}){
  return Container(
    width: 190,
    height: 221,
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Color.fromRGBO(47, 47, 47, 0.06),
          blurRadius: 24,
          offset: Offset(0, 4),
        ),
      ],
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: Color(0xFFE1E1E1), width: 1),

    ),
    child: Stack(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(0, 85, 0, 0),
          child: Container(
            width: 190,
            height: 136,
            child: ClipRRect(
                borderRadius: BorderRadius. circular(4.0),
                child: Image.network(img, fit: BoxFit.cover
                )

            ),
          ),
        ),
        Container(
            width: 190,
            height: 89,
            decoration: BoxDecoration(
              color: backgr, // цвет фона в формате ARGB
              border: backgr == dark ? null : Border.all(color: Color(0xFFE1E1E1), width: 1),
              borderRadius: BorderRadius.circular(4), // радиус границ
            ),
            child: Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Container(
                  width: 170,
                  height: 55,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 130,
                        child: Text(title, maxLines: 3, overflow: TextOverflow.ellipsis, style: middleTxt(fontSize: 14, color: backgr == dark ? white : dark),),
                      ),
                      Spacer(),
                      InkResponse(
                          onTap: tap,
                          child: OnHoverWidget(
                            builder: (bool isHovered) {
                              return Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                  color:  backgr == dark ?
                                  isHovered ? white : Colors.transparent
                                      : isHovered ? dark : Colors.transparent,
                                  border: Border.all(color: backgr == dark ? white : dark, width: 1),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Center(
                                  child: SvgPicture.asset('assets/arrow.svg',
                                    width: 4,
                                    height: 8,
                                    color: backgr == dark ?
                                    isHovered ? dark : white
                                        : isHovered ? white  : dark,
                                  ),
                                ),
                              );
                            },)
                      )

                    ],
                  ),
                )
            )
        )
      ],
    ),
  );
}

Widget mainCourseCard({
  required Color backgr,
  required String title,
  required String price,
  required String img
}){
  return Container(
    width: 387,
    height: 327,
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Color.fromRGBO(47, 47, 47, 0.06),
          blurRadius: 24,
          offset: Offset(0, 4),
        ),
      ],
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: Color(0xFFE1E1E1), width: 1),

    ),
    child: Stack(
      children: [
        Container(
            width: 387,
            height: 155,
            decoration: BoxDecoration(
              color: backgr, // цвет фона в формате ARGB
              border: Border.all(color: Color(0xFFE1E1E1), width: 1),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)), // радиус границ
            ),
            child: Padding(
                padding: EdgeInsets.fromLTRB(24, 24, 24, 38),
                child: Container(
                  width: 338,
                  height: 95,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 269,
                            child: Text(title, style: middleTxt(fontSize: 24, color: dark),),
                          ),
                          Spacer(),


                          InkResponse(
                              onTap: (){},
                              child: OnHoverWidget(
                                builder: (bool isHovered) {
                                  return Container(
                                    width: 39,
                                    height: 39,
                                    decoration: BoxDecoration(
                                      color: isHovered ? dark : Colors.transparent,
                                      border: Border.all(color: dark, width: 2),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: Center(
                                      child: SvgPicture.asset('assets/arrow.svg',
                                        width: 7,
                                        height: 14,
                                        color: isHovered ? white  : dark,
                                      ),
                                    ),
                                  );
                                },)
                          )

                        ],
                      ),
                      Spacer(),
                      Text(price, style: courseTxt(color: backgr == dark ? white : dark),),


                    ],
                  ),
                )
            )
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 149, 0, 0),
          child: Container(
            width: 387,
            height: 187,
            child: ClipRRect(
                borderRadius: BorderRadius. circular(8.0),
                child: Image.asset(img, fit: BoxFit.cover
                )

            ),
          ),
        ),

      ],
    ),
  );
}

Widget mainCourseCardTablet({
  required Color backgr,
  required String title,
  required String price,
  required String img
}){
  return Container(
    width: 235,
    height: 226,
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Color.fromRGBO(47, 47, 47, 0.06),
          blurRadius: 24,
          offset: Offset(0, 4),
        ),
      ],
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: Color(0xFFE1E1E1), width: 1),

    ),
    child: Stack(
      children: [
        Container(
            width: 235,
            height: 128,
            decoration: BoxDecoration(
              color: backgr, // цвет фона в формате ARGB
              border: Border.all(color: Color(0xFFE1E1E1), width: 1),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)), // радиус границ
            ),
            child: Padding(
                padding: EdgeInsets.fromLTRB(14, 16, 14, 26),
                child: Container(
                  width: 207,
                  height: 57,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 159,
                            child: Text(title, maxLines: 3, overflow: TextOverflow.ellipsis, style: middleTxt(fontSize: 16, color: dark),),
                          ),
                          Spacer(),


                          InkResponse(
                              onTap: (){},
                              child: OnHoverWidget(
                                builder: (bool isHovered) {
                                  return Container(
                                    width: 24,
                                    height: 24,
                                    decoration: BoxDecoration(
                                      color: isHovered ? dark : Colors.transparent,
                                      border: Border.all(color: dark, width: 1),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: Center(
                                      child: SvgPicture.asset('assets/arrow.svg',
                                        width: 4,
                                        height: 8,
                                        color: isHovered ? white  : dark,
                                      ),
                                    ),
                                  );
                                },)
                          )

                        ],
                      ),
                      Spacer(),
                      Text(price, style: courseTxt(color: backgr == dark ? white : dark, size: 14),),


                    ],
                  ),
                )
            )
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 118, 0, 0),
          child: Container(
            width: 235,
            height: 108,
            child: ClipRRect(
                borderRadius: BorderRadius. circular(8.0),
                child: Image.asset(img, fit: BoxFit.cover
                )

            ),
          ),
        ),

      ],
    ),
  );
}

Widget niceContainer({required Widget child, required double screen}){
  return Container(
    decoration: BoxDecoration(
      color: const Color(0xFFFFFFFF),
      boxShadow: [
        BoxShadow(
          color: const Color(0xFF000000).withOpacity(0.15),
          blurRadius: 16.0,
          offset: Offset(6.0, 6.0),
        ),
      ],
      borderRadius: screen <= 600 ? BorderRadius.circular(10.0) : BorderRadius.circular(20.0),
    ),
    child: Padding(
      padding:  screen <= 600 ? EdgeInsets.all(16) : EdgeInsets.all(32),
      child: child,
    ),
  );
}

Widget mainCourseCardMobile({
  required Color backgr,
  required String title,
  required String price,
  required String img
}){
  return Container(
    width: 188,
    height: 171,
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Color.fromRGBO(47, 47, 47, 0.06),
          blurRadius: 24,
          offset: Offset(0, 4),
        ),
      ],
      borderRadius: BorderRadius.circular(4),
      border: Border.all(color: Color(0xFFE1E1E1), width: 1),

    ),
    child: Stack(
      children: [
        Container(
            width: 188,
            height: 93,
            decoration: BoxDecoration(
              color: backgr, // цвет фона в формате ARGB
              border: Border.all(color: Color(0xFFE1E1E1), width: 1),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(4), topRight: Radius.circular(4)), // радиус границ
            ),
            child: Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Center(
                  child: Container(
                    width: 168,
                    height: 51,
                    child: Row(
                      children: [
                        Container(
                          width: 122,
                          child: Text(title, maxLines: 3, overflow: TextOverflow.ellipsis, style: middleTxt(fontSize: 14, color: dark),),
                        ),
                        Spacer(),


                        InkResponse(
                            onTap: (){},
                            child: OnHoverWidget(
                              builder: (bool isHovered) {
                                return Container(
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    color: isHovered ? dark : Colors.transparent,
                                    border: Border.all(color: dark, width: 1),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Center(
                                    child: SvgPicture.asset('assets/arrow.svg',
                                      width: 4,
                                      height: 8,
                                      color: isHovered ? white  : dark,
                                    ),
                                  ),
                                );
                              },)
                        )

                      ],
                    ),
                  ),
                )
            )
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 85, 0, 0),
          child: Container(
            width: 188,
            height: 86,
            child: ClipRRect(
                borderRadius: BorderRadius. circular(4.0),
                child: Image.asset(img, fit: BoxFit.cover
                )

            ),
          ),
        ),

      ],
    ),
  );
}

BoxDecoration boxDecoration = BoxDecoration(
  color: white,
  border: Border.all(
    color: const Color(0xFFF8F8F8),
    width: 1,
  ),
  boxShadow: [
    BoxShadow(
      color: const Color(0xFF2F2F2F).withOpacity(0.06),
      offset: Offset(0, 4),
      blurRadius: 24,
    ),
  ],
  borderRadius: BorderRadius.circular(8),
);

ElevatedButton button({
  required Function() onClick,
  required String text,
  double? height,
  double? width,
  Color? color,
  double? radius,
  double? size,
  Key? key
  }){
  return ElevatedButton(
      key: key,
  style: ElevatedButton.styleFrom(
      fixedSize: Size(width ?? 285, height ?? 48),
      backgroundColor: color ?? red,
      shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(radius ?? 8),
    ),
  ),
  onPressed: onClick,
  child: Text(text, style: GoogleFonts.manrope(
    fontWeight: FontWeight.w700,
    fontSize: size ?? 16,
    height: 1.6,
    color: white,
  ),));
}