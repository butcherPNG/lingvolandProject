import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../styles/styles.dart';

class FooterPanel extends StatefulWidget {
  final String header;
  final List<Widget> content;
  FooterPanel({
    required this.header,
    required this.content
  });
  @override
  _FooterPanelState createState() => _FooterPanelState();
}

class _FooterPanelState extends State<FooterPanel> {
  bool _isExpanded = false;
  final myBoxKey = GlobalKey();
  double _childHeight = 0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraits){
          return AnimatedContainer(
            width: 288,
            height: _isExpanded ? 180 : 30,
            duration: Duration(milliseconds: 500),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 200,
                      height: 28,
                      child: Text(widget.header, style: navTxt(color: Colors.white, fontSize: 16, weight: FontWeight.w700),),
                    ),
                    InkResponse(
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        print(_childHeight);
                        setState(() {
                          _isExpanded = !_isExpanded;
                        });
                      },
                      child: Icon(_isExpanded ? Icons.remove : Icons.add, size: 18, color: white,),
                    ),
                  ],
                ),
                Padding(
                  padding: _isExpanded ? EdgeInsets.only(top: 16, bottom: 16) : EdgeInsets.only(top: 0, bottom: 0),
                  child: AnimatedContainer(
                    width: 288,
                    duration: Duration(milliseconds: 500),
                    height: _isExpanded ? 120 : 0,
                    child: ListView.builder(
                      itemCount: widget.content.length,
                        itemBuilder: (context, index){
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              widget.content[index],
                              index == widget.content.length ? SizedBox.shrink() : SizedBox(height: 12,)
                            ],
                          );
                        }
                    ),
                  ),
                )

              ],
            ),
          );
        }
    );
  }
}