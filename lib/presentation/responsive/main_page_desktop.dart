import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:linguasphere/widgets/banner.dart';

import '../../styles/styles.dart';
import '../../widgets/appBar.dart';
import '../../widgets/courses_page.dart';
import '../../widgets/features.dart';
import '../../widgets/footer.dart';
import '../../widgets/offers.dart';
import '../../widgets/onHoverWidget.dart';
import '../../widgets/questions.dart';
import '../../widgets/skills.dart';


late List<Widget?> cards;
late List<Widget?> cardsTablet;
late List<Widget?> cardsMobile;

SizedBox margin_top(double width){
  if (width < 1200 && width > 601){
    return SizedBox(height: 64,);
  }else if(width <= 600){
    return SizedBox(height: 54,);
  }else{
    return SizedBox(height: 200,);
  }
}




class MainPageDesktop extends StatefulWidget {

  final BoxConstraints screen;
  MainPageDesktop({required this.screen});

  @override
  _MainPageDesktopState createState() => _MainPageDesktopState();
}


class _MainPageDesktopState extends State<MainPageDesktop> {
  Completer<void> coursesCompleter = Completer<void>();
  Future<void> loadCourses() async {
    final courses = <Widget?>[];
    final coursesTablet = <Widget?>[];
    final coursesMobile = <Widget?>[];

    final snapshot = await FirebaseFirestore.instance.collection('courses').get();
    final docs = snapshot.docs;

    for (var element in docs) {
      courses.add(courseCard(
          backgr: element.data()['cardColor'] == 'black' ? dark : white,
          title: element.data()['title'],
          price: element.data()['price'],
          img: element.data()['img'],
          tap: (){
            context.goNamed('detail_page', pathParameters: {'id': element.data()['id']});
          }
      ));
      coursesMobile.add(mobileCourseCard(
          backgr: element.data()['cardColor'] == 'black' ? dark : white,
          title: element.data()['title'],
          price: element.data()['price'],
          img: element.data()['img'],
          tap: (){
            context.goNamed('detail_page', pathParameters: {'id': element.data()['id']});
          }
      ));
      coursesTablet.add(tabletCourseCard(
          backgr: element.data()['cardColor'] == 'black' ? dark : white,
          title: element.data()['title'],
          price: element.data()['price'],
          img: element.data()['img'],
          tap: (){
            context.goNamed('detail_page', pathParameters: {'id': element.data()['id']});
          }
      ));

    }

    setState(() {
      cards = courses.take(6).toList();
      cardsMobile = coursesMobile.take(6).toList();
      cardsTablet = coursesTablet.take(6).toList();
    });

    coursesCompleter.complete();
  }

  @override
  void initState() {
    loadCourses();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController = ScrollController();
    return FutureBuilder(
        future: coursesCompleter.future,
        builder: (context, snap){
          if(snap.connectionState == ConnectionState.done){
            return Scaffold(
              appBar: myAppBar(),
              endDrawer: widget.screen.maxWidth < 1200
                  ? Drawer(
                backgroundColor: Color(0xff060C1D),
                child: ListView(
                  padding: EdgeInsets.only(left: 24, top: 36),
                  children: [
                    InkResponse(
                      onTap: () {
                        context.goNamed('home');
                      },
                      child: OnHoverWidget(
                        builder: (bool isHovered) {
                          return Text(
                            'Главная',
                            style: navTxt(
                                color: GoRouter.of(context)
                                    .location
                                    .toString() ==
                                    '/'
                                    ? Color(0xFF828282) :
                                isHovered ? Color(0xFF828282) : Colors.white,
                                fontSize: 16,
                                weight: FontWeight.w400),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    InkResponse(
                      onTap: () {
                        context.goNamed('courses');
                      },
                      child: OnHoverWidget(
                        builder: (bool isHovered) {
                          return Text(
                            'Курсы',
                            style: navTxt(
                                color: GoRouter.of(context)
                                    .location
                                    .toString() ==
                                    '/courses'
                                    ? Color(0xFF828282) :
                                isHovered ? Color(0xFF828282) : Colors.white,
                                fontSize: 16,
                                weight: FontWeight.w400),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    InkResponse(
                      onTap: () {},
                      child: OnHoverWidget(
                        builder: (bool isHovered) {
                          return Text(
                            'Блог',
                            style: navTxt(
                                color: GoRouter.of(context)
                                    .location
                                    .toString() ==
                                    '/blog'
                                    ? Color(0xFF828282) :
                                isHovered ? Color(0xFF828282) : Colors.white,
                                fontSize: 16,
                                weight: FontWeight.w400),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    InkResponse(
                      onTap: () {},
                      child: OnHoverWidget(
                        builder: (bool isHovered) {
                          return Text(
                            'О центре',
                            style: navTxt(
                                color: GoRouter.of(context)
                                    .location
                                    .toString() ==
                                    '/about'
                                    ? Color(0xFF828282) :
                                isHovered ? Color(0xFF828282) : Colors.white,
                                fontSize: 16,
                                weight: FontWeight.w400),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    InkResponse(
                      onTap: () {},
                      child: OnHoverWidget(
                        builder: (bool isHovered) {
                          return Text(
                            'Контакты',
                            style: navTxt(
                                color: GoRouter.of(context)
                                    .location
                                    .toString() ==
                                    '/contacts'
                                    ? Color(0xFF828282) :
                                isHovered ? Color(0xFF828282) : Colors.white,
                                fontSize: 16,
                                weight: FontWeight.w400),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    InkResponse(
                      onTap: () {context.goNamed('faq');},
                      child: OnHoverWidget(
                        builder: (bool isHovered) {
                          return Text(
                            'Вопрос-ответ',
                            style: navTxt(
                                color: GoRouter.of(context)
                                    .location
                                    .toString() ==
                                    '/faq'
                                    ? Color(0xFF828282) :
                                isHovered ? Color(0xFF828282) : Colors.white,
                                fontSize: 16,
                                weight: FontWeight.w400),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              )
                  : SizedBox.shrink(),
              body: ListView(
                children: [

                  BannerScreen(),
                  margin_top(widget.screen.maxWidth),
                  OfferScreen(),
                  margin_top(widget.screen.maxWidth),
                  CoursesScreen(scrollController: _scrollController, futureCards: Future.value(cards), futureCardsTablet: Future.value(cardsTablet), futureCardsMobile: Future.value(cardsMobile),),

                  margin_top(widget.screen.maxWidth),
                  FeaturesScreen(),
                  margin_top(widget.screen.maxWidth),
                  SkillsScreen(),
                  margin_top(widget.screen.maxWidth),
                  QuestionsScreen(),
                  Footer()

                ],
              ),
            );
          }else{
            return Scaffold(
              appBar: myAppBar(),
              endDrawer: widget.screen.maxWidth < 1200
                  ? Drawer(
                backgroundColor: Color(0xff060C1D),
                child: ListView(
                  padding: EdgeInsets.only(left: 24, top: 36),
                  children: [
                    InkResponse(
                      onTap: () {
                        context.goNamed('home');
                      },
                      child: OnHoverWidget(
                        builder: (bool isHovered) {
                          return Text(
                            'Главная',
                            style: navTxt(
                                color: GoRouter.of(context)
                                    .location
                                    .toString() ==
                                    '/'
                                    ? Color(0xFF828282) :
                                isHovered ? Color(0xFF828282) : Colors.white,
                                fontSize: 16,
                                weight: FontWeight.w400),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    InkResponse(
                      onTap: () {
                        context.goNamed('courses');
                      },
                      child: OnHoverWidget(
                        builder: (bool isHovered) {
                          return Text(
                            'Курсы',
                            style: navTxt(
                                color: GoRouter.of(context)
                                    .location
                                    .toString() ==
                                    '/courses'
                                    ? Color(0xFF828282) :
                                isHovered ? Color(0xFF828282) : Colors.white,
                                fontSize: 16,
                                weight: FontWeight.w400),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    InkResponse(
                      onTap: () {},
                      child: OnHoverWidget(
                        builder: (bool isHovered) {
                          return Text(
                            'Блог',
                            style: navTxt(
                                color: GoRouter.of(context)
                                    .location
                                    .toString() ==
                                    '/blog'
                                    ? Color(0xFF828282) :
                                isHovered ? Color(0xFF828282) : Colors.white,
                                fontSize: 16,
                                weight: FontWeight.w400),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    InkResponse(
                      onTap: () {},
                      child: OnHoverWidget(
                        builder: (bool isHovered) {
                          return Text(
                            'О центре',
                            style: navTxt(
                                color: GoRouter.of(context)
                                    .location
                                    .toString() ==
                                    '/about'
                                    ? Color(0xFF828282) :
                                isHovered ? Color(0xFF828282) : Colors.white,
                                fontSize: 16,
                                weight: FontWeight.w400),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    InkResponse(
                      onTap: () {},
                      child: OnHoverWidget(
                        builder: (bool isHovered) {
                          return Text(
                            'Контакты',
                            style: navTxt(
                                color: GoRouter.of(context)
                                    .location
                                    .toString() ==
                                    '/contacts'
                                    ? Color(0xFF828282) :
                                isHovered ? Color(0xFF828282) : Colors.white,
                                fontSize: 16,
                                weight: FontWeight.w400),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    InkResponse(
                      onTap: () {context.goNamed('faq');},
                      child: OnHoverWidget(
                        builder: (bool isHovered) {
                          return Text(
                            'Вопрос-ответ',
                            style: navTxt(
                                color: GoRouter.of(context)
                                    .location
                                    .toString() ==
                                    '/faq'
                                    ? Color(0xFF828282) :
                                isHovered ? Color(0xFF828282) : Colors.white,
                                fontSize: 16,
                                weight: FontWeight.w400),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              )
                  : SizedBox.shrink(),
              body: Container(),
            );
          }
        }
    );
  }


}