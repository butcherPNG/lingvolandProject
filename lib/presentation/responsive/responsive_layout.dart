

import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget{

  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  ResponsiveLayout({
    required this.mobile,
    required this.desktop,
    required this.tablet
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints){
          if(constraints.maxWidth < 1200 && constraints.maxWidth > 601){
            return tablet;
          }else if (constraints.minWidth <= 600){
            return mobile;
          }else{
            return desktop;
          }
        }
    );
  }

}