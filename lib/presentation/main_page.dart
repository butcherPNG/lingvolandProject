
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:linguasphere/presentation/responsive/main_page_desktop.dart';
import 'package:linguasphere/presentation/responsive/main_page_mobile.dart';
import 'package:linguasphere/presentation/responsive/main_page_tablet.dart';
import 'package:linguasphere/presentation/responsive/responsive_layout.dart';
import 'package:linguasphere/widgets/banner.dart';

import '../styles/styles.dart';
import '../widgets/appBar.dart';
import '../widgets/courses_page.dart';
import '../widgets/features.dart';
import '../widgets/footer.dart';
import '../widgets/offers.dart';
import '../widgets/onHoverWidget.dart';
import '../widgets/questions.dart';
import '../widgets/skills.dart';






class MainPage extends StatefulWidget {



  @override
  _MainPageState createState() => _MainPageState();
}


class _MainPageState extends State<MainPage> {



  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
     ScrollController _scrollController = ScrollController();
    return LayoutBuilder(
        builder: (context, screen){
          return MainPageDesktop(screen: screen,);
        }
    );
  }


}

