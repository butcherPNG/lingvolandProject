
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../styles/styles.dart';


class CardWidget extends StatefulWidget {
    Color backgr;
    String title;
    String price;
    String img;
    CardWidget({
    required this.backgr,
    required this.title,
    required this.price,
    required this.img,
  });
  @override
  _CardWidgetState createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context){
    return Container(
      width: 384,
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
                  child: Image.network(widget.img, fit: BoxFit.cover
                  )

              ),
            ),
          ),
          Container(
              width: 387,
              height: 181,
              decoration: BoxDecoration(
                color: widget.backgr, // цвет фона в формате ARGB
                border: widget.backgr == Colors.black ? null : Border.all(color: Color(0xFFE1E1E1), width: 1),
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
                        Text(widget.title, style: middleTxt(fontSize: 24, color: widget.backgr == Colors.black ? Colors.white : Colors.black),),
                        Spacer(),
                        Row(
                          children: [
                            Text(widget.price, style: courseTxt(color: widget.backgr == Colors.black ? Colors.white : Colors.black),),
                            Spacer(),


                            InkResponse(
                                onHover: (hover) {
                                  setState(() {
                                    isHovered = hover;
                                  });
                                },
                                onTap: (){},
                                child: Container(
                                  width: 39,
                                  height: 39,
                                  decoration: BoxDecoration(
                                    color:  widget.backgr == Colors.black ?
                                    isHovered ? Colors.white : Colors.transparent
                                        : isHovered ? Colors.black : Colors.transparent,
                                    border: Border.all(color: widget.backgr == Colors.black ? Colors.white : Colors.black, width: 2),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Center(
                                    child: SvgPicture.asset('assets/arrow.svg',
                                      width: 7,
                                      height: 14,
                                      color: widget.backgr == Colors.black ?
                                      isHovered ? Colors.black : Colors.white
                                          : isHovered ? Colors.white  : Colors.black,
                                    ),
                                  ),
                                )
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
}