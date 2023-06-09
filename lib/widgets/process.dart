import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../styles/styles.dart';

class ProcessScreen extends StatefulWidget {
  final String header;
  final String content;
  final bool? first;
  final bool? last;
  final double imgSize;
  final String img;
  ProcessScreen({
    required this.header,
    required this.content,
    this.first,
    this.last,
    required this.imgSize,
    required this.img,
  });
  @override
  _ProcessScreenState createState() => _ProcessScreenState();
}

class _ProcessScreenState extends State<ProcessScreen> {
  bool _isExpanded = false;
  final myBoxKey = GlobalKey();
  double _childHeight = 0;
  double _headerChild = 0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraits){
          return LayoutBuilder(
              builder: (context, screen){
                if(screen.minWidth <= 600){
                  return Container(
                      width: 288,
                      height: _headerChild + _childHeight + 64 + 8,
                      decoration: BoxDecoration(
                        border: Border(
                          top: widget.first == true ? BorderSide.none : BorderSide(width: 1.0, color: Color(0xFFE0E0E0)),
                          bottom: widget.last == true ? BorderSide.none : BorderSide(width: 1.0, color: Color(0xFFE0E0E0)),
                        ),
                      ),

                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 16),
                            child: Container(
                              width: 38,
                              height: 38,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(width: 2, color: Color(0xffE0E0E0)),
                              ),
                              child: Center(
                                child: widget.img == 'assets/brain3.png' ? Image.asset(widget.img, width: widget.imgSize, height: widget.imgSize,) : SvgPicture.asset(widget.img, width: widget.imgSize, height: widget.imgSize,),
                              ),
                            ),
                          ),
                          Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(height: 16,),
                              Container(
                                  width: 212,
                                  height: _headerChild,
                                  child: Header(
                                    onLayout: (Size size) {
                                      setState(() {
                                        _headerChild = size.height;

                                      });
                                    },
                                    content: widget.header,
                                    size: 18,

                                  )
                              ),
                              SizedBox(height: 8,),
                              Container(
                                width: 212,
                                height: _childHeight,
                                child: Content(
                                  onLayout: (Size size) {
                                    setState(() {
                                      _childHeight = size.height;

                                    });
                                  },
                                  content: widget.content,
                                  size: 14,
                                ),
                              )

                            ],
                          ),
                        ],
                      )
                  );
                }else{
                  return Container(
                      width: 1200,
                      height: _headerChild + _childHeight + 64 + 8,
                      decoration: BoxDecoration(
                        border: Border(
                          top: widget.first == true ? BorderSide.none : BorderSide(width: 1.0, color: Color(0xFFE0E0E0)),
                          bottom: widget.last == true ? BorderSide.none : BorderSide(width: 1.0, color: Color(0xFFE0E0E0)),
                        ),
                      ),

                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 32),
                            child: Container(
                              width: 82,
                              height: 82,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(width: 2, color: Color(0xffE0E0E0)),
                              ),
                              child: Center(
                                child: widget.img == 'assets/brain3.png' ? Image.asset(widget.img, width: widget.imgSize, height: widget.imgSize,) : SvgPicture.asset(widget.img, width: widget.imgSize, height: widget.imgSize,),
                              ),
                            ),
                          ),
                          Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  width: 484,
                                  height: _headerChild,
                                  child: Header(
                                    onLayout: (Size size) {
                                      setState(() {
                                        _headerChild = size.height;

                                      });
                                    },
                                    content: widget.header,

                                  )
                              ),
                              SizedBox(height: 8,),
                              Container(
                                width: 575,
                                height: _childHeight,
                                child: Content(
                                  onLayout: (Size size) {
                                    setState(() {
                                      _childHeight = size.height;

                                    });
                                  },
                                  content: widget.content,
                                ),
                              )

                            ],
                          ),
                        ],
                      )
                  );
                }
              }
          );
        }
    );
  }
}


class Content extends StatelessWidget {
  final Function(Size size) onLayout;
  final String content;
  final double? size;
  Content({required this.onLayout, required this.content, this.size});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final textSpan = TextSpan(text: content, style: GoogleFonts.manrope(
          textStyle: TextStyle(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w300,
            fontSize: size ?? 20.0,
            height: 1.6, // или 32.0 для line-height
            color: Color(0xFF646A77),
          ),
        ));
        final textPainter = TextPainter(
          text: textSpan,
          textDirection: TextDirection.ltr,
          maxLines: null,
        )..layout(maxWidth: constraints.maxWidth);

        final textSize = textPainter.size;
        WidgetsBinding.instance.addPostFrameCallback((_) {
          onLayout(textSize);
        });
        return SizedBox(
          width: 575,
          height: textSize.height,
          child: SelectableText(content, style: GoogleFonts.manrope(
            textStyle: TextStyle(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w300,
              fontSize: size ?? 20.0,
              height: 1.6,
              color: Color(0xFF646A77),
            ),

          ),
          ),
        );
      },

    );
  }
}

class Header extends StatelessWidget {
  final Function(Size size) onLayout;
  final String content;
  final double? size;
  Header({required this.onLayout, required this.content, this.size});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final textSpan = TextSpan(text: content, style: GoogleFonts.manrope(
          textStyle: TextStyle(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
            fontSize: size ?? 32.0,
            height: 1.6, // or 160%
            color: Color(0xFF060C1D),// соответствует цвету #060C1D в формате ARGB
          ),
        ));
        final textPainter = TextPainter(
          text: textSpan,
          textDirection: TextDirection.ltr,
          maxLines: null,
        )..layout(maxWidth: constraints.maxWidth);

        final textSize = textPainter.size;
        WidgetsBinding.instance.addPostFrameCallback((_) {
          onLayout(textSize);
        });
        return SizedBox(
          width: 484,
          height: textSize.height,
          child: SelectableText(content, style: GoogleFonts.manrope(
            textStyle: TextStyle(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w500,
              fontSize: size ?? 32.0,
              height: 1.6, // or 160%
              color: Color(0xFF060C1D),// соответствует цвету #060C1D в формате ARGB
            ),

          ),
          ),
        );
      },

    );
  }
}