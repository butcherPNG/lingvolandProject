




import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:linguasphere/presentation/responsive/main_page_desktop.dart';
import 'package:linguasphere/styles/styles.dart';
import 'package:linguasphere/widgets/courses_slider.dart';


import '../widgets/appBar.dart';
import '../widgets/footer.dart';
import '../widgets/offline_courses.dart';
import '../widgets/onHoverWidget.dart';
import '../widgets/online_courses.dart';
import '../widgets/questions.dart';
import 'main_page.dart';



late List<Widget?> onlineCourses;
late List<Widget?> offlineCourses;
late List<Widget?> onlineCoursesTablet;
late List<Widget?> offlineCoursesTablet;
late List<Widget> onlineCoursesMobile;
late List<Widget> offlineCoursesMobile;
List<Widget> mainCourses = [
  mainCourseCard(backgr: Color(0xffFFDDDD), title: 'Индивидуальное очное обучение',
      price: 'От 700 руб./занятие', img: 'assets/individual.png'),

  mainCourseCard(backgr: Color(0xffFFDDDD), title: 'Индивидуальное онлайн обучение',
      price: 'От 700 руб./занятие', img: 'assets/individualOnline.png'),

  mainCourseCard(backgr: Color(0xffFFDDDD), title: 'Групповое очное обучение',
      price: 'От 700 руб./занятие', img: 'assets/groupLearning.png'),
];

List<Widget> mainCoursesTablet = [
  mainCourseCardTablet(backgr: Color(0xffFFDDDD), title: 'Индивидуальное очное обучение',
      price: 'От 700 руб./занятие', img: 'assets/individual.png'),

  mainCourseCardTablet(backgr: Color(0xffFFDDDD), title: 'Индивидуальное онлайн обучение',
      price: 'От 700 руб./занятие', img: 'assets/individualOnline.png'),

  mainCourseCardTablet(backgr: Color(0xffFFDDDD), title: 'Групповое очное обучение',
      price: 'От 700 руб./занятие', img: 'assets/groupLearning.png'),
];

List<Widget> mainCoursesMobile = [
  mainCourseCardMobile(backgr: Color(0xffFFDDDD), title: 'Индивидуальное очное обучение',
      price: 'От 700 руб./занятие', img: 'assets/individual.png'),

  mainCourseCardMobile(backgr: Color(0xffFFDDDD), title: 'Индивидуальное онлайн обучение',
      price: 'От 700 руб./занятие', img: 'assets/individualOnline.png'),

  mainCourseCardMobile(backgr: Color(0xffFFDDDD), title: 'Групповое очное обучение',
      price: 'От 700 руб./занятие', img: 'assets/groupLearning.png'),
];

class CoursesPage extends StatefulWidget {


  @override
  _CoursesPageState createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {


  @override
  void initState() {
    super.initState();
    loadCourses();
  }

  Completer<void> coursesCompleter = Completer<void>();
  Future<void> loadCourses() async {
    final online = <Widget?>[];
    final offline = <Widget?>[];
    final onlineTablet = <Widget?>[];
    final offlineTablet = <Widget?>[];
    final onlineMobile = <Widget>[];
    final offlineMobile = <Widget>[];
    final snapshot = await FirebaseFirestore.instance.collection('courses').get();
    final docs = snapshot.docs;
    for (var element in docs) {
      final type = element.data()['type'];
      if (type == 'online') {
        online.add(courseCard(
            backgr: element.data()['cardColor'] == 'black' ? dark : white,
            title: element.data()['title'],
            price: element.data()['price'],
            img: element.data()['img'],
            tap: (){
              context.goNamed('detail_page', pathParameters: {'id': element.data()['id']});
            }
        ));
        onlineTablet.add(tabletCourseCard(
            backgr: element.data()['cardColor'] == 'black' ? dark : white,
            title: element.data()['title'],
            price: element.data()['price'],
            img: element.data()['img'],
            tap: (){
              context.goNamed('detail_page', pathParameters: {'id': element.data()['id']});
            }
        ));
        onlineMobile.add(mobileCourseCard(
            backgr: element.data()['cardColor'] == 'black' ? dark : white,
            title: element.data()['title'],
            price: element.data()['price'],
            img: element.data()['img'],
            tap: (){
              context.goNamed('detail_page', pathParameters: {'id': element.data()['id']});
            }
        ));
      } else if (type == 'offline') {
        offline.add(courseCard(
            backgr: element.data()['cardColor'] == 'black' ? dark : white,
            title: element.data()['title'],
            price: element.data()['price'],
            img: element.data()['img'],
            tap: (){
              context.goNamed('detail_page', pathParameters: {'id': element.data()['id']});
            }
        ));
        offlineTablet.add(tabletCourseCard(
            backgr: element.data()['cardColor'] == 'black' ? dark : white,
            title: element.data()['title'],
            price: element.data()['price'],
            img: element.data()['img'],
            tap: (){
              context.goNamed('detail_page', pathParameters: {'id': element.data()['id']});
            }
        ));
        offlineMobile.add(mobileCourseCard(
            backgr: element.data()['cardColor'] == 'black' ? dark : white,
            title: element.data()['title'],
            price: element.data()['price'],
            img: element.data()['img'],
            tap: (){
              context.goNamed('detail_page', pathParameters: {'id': element.data()['id']});
            }
        ));
      }
    }

    setState(() {
      onlineCourses = online.take(docs.length).toList();
      offlineCourses = offline.take(docs.length).toList();
      onlineCoursesTablet = onlineTablet.take(docs.length).toList();
      offlineCoursesTablet = offlineTablet.take(docs.length).toList();
      onlineCoursesMobile = onlineMobile.take(docs.length).toList();
      offlineCoursesMobile = offlineMobile.take(docs.length).toList();
    });

    coursesCompleter.complete();
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: coursesCompleter.future,
        builder: (context, snap){
          if(snap.connectionState == ConnectionState.done){
            return CoursesPageWidget(
              offlineCourses: offlineCourses != null
                  ? Future.value(offlineCourses)
                  : Future.value([]),
              onlineCourses: onlineCourses != null
                  ? Future.value(onlineCourses)
                  : Future.value([]),
              offlineCoursesTablet: offlineCoursesTablet != null
                  ? Future.value(offlineCoursesTablet)
                  : Future.value([]),
              onlineCoursesTablet: onlineCoursesTablet != null
                  ? Future.value(onlineCoursesTablet)
                  : Future.value([]),
              onlineCoursesMobile: offlineCoursesMobile ?? [],
              offlineCoursesMobile: onlineCoursesMobile ?? [],
            );
          }else{
            return Scaffold(
              appBar: myAppBar(),
              body: Center(child: CircularProgressIndicator(),),
            );
          }
        }
    );
  }
}

class CoursesPageWidget extends StatefulWidget {
  final Future<List<Widget?>> offlineCourses;
  final Future<List<Widget?>> onlineCourses;
  final Future<List<Widget?>> offlineCoursesTablet;
  final Future<List<Widget?>> onlineCoursesTablet;
  final List<Widget> offlineCoursesMobile;
  final List<Widget> onlineCoursesMobile;

  CoursesPageWidget(
      {required this.offlineCourses,
      required this.onlineCourses,
      required this.offlineCoursesTablet,
      required this.onlineCoursesTablet,
      required this.onlineCoursesMobile,
      required this.offlineCoursesMobile
      });
  @override
  _CoursesPageWidgetState createState() => _CoursesPageWidgetState();
}

class _CoursesPageWidgetState extends State<CoursesPageWidget> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey<State<StatefulWidget>> _myWidgetKey = GlobalKey();

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScrollController _scrollControllerMobile = ScrollController();
    ScrollController _scrollControllerMobileOnline = ScrollController();
    ScrollController _scrollControllerMobileOffline = ScrollController();
    return LayoutBuilder(
        builder: (context, screen){
          if(screen.maxWidth < 1200 && screen.maxWidth > 601){
            return Scaffold(
              appBar: myAppBar(),
              body: SingleChildScrollView(
                  controller: _scrollController,
                  child: Column(
                    children: [
                      Stack(

                        children: [
                          Container(
                              width: double.infinity,
                              height: 440,
                              color: const Color(0xFFEFF8FF),
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.only(top: 43),
                                  child: Container(
                                    width: 727,
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 358,
                                              height: 115,
                                              child: SelectableText('Первое занятие бесплатно —', style: offerTxt(size: 40),),
                                            ),
                                            SizedBox(height: 16,),
                                            Container(
                                              width: 190,
                                              child: SelectableText('Выбери свое предложение', style: blockTxt(size: 14),),
                                            ),
                                            SizedBox(height: 32,),
                                            button(onClick: (){
                                              _scrollController.animateTo(550, duration: Duration(milliseconds: 500), // длительность анимации
                                                curve: Curves.easeInOut,);
                                            }, text: 'Посмотреть все курсы'),

                                          ],
                                        ),
                                        Spacer(),
                                        Container(
                                          width: 357,
                                          height: 230,
                                          child: Image.asset('assets/banner2.png', fit: BoxFit.contain,),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                          ),
                          Center(
                            child: Padding(
                              padding: EdgeInsets.only(top: 322),
                              child: Container(
                                width: 727,
                                child: GridView.builder(
                                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      childAspectRatio: 235 / 226,
                                      mainAxisSpacing: 12.0,
                                      crossAxisSpacing: 12.0,
                                    ),
                                    itemCount: mainCourses.length,
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index){
                                      return mainCoursesTablet[index];
                                    }
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      margin_top(screen.maxWidth),
                      Center(
                        child: Container(
                          width: 727,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SelectableText('Очные курсы', style: headerTxt(size: 36),),
                              SizedBox(height: 46,),
                              OfflineCourses(futureCards: widget.offlineCourses, futureCardsTablet: widget.offlineCoursesTablet,)
                            ],
                          ),
                        ),
                      ),

                      margin_top(screen.maxWidth),
                      Center(
                        child: Container(
                          width: 727,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SelectableText('Онлайн курсы', style: headerTxt(size: 36),),
                              SizedBox(height: 46,),
                              OnlineCourses(futureCards: widget.onlineCourses, futureCardsTablet: widget.onlineCoursesTablet,)
                            ],
                          ),
                        ),
                      ),

                      margin_top(screen.maxWidth),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: QuestionsScreen(),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Footer(),
                      ),

                    ],
                  )
              ),
            );
          }else if(screen.minWidth <= 600){
            return Scaffold(
              appBar: myAppBar(),
              endDrawer: Drawer(
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
              ),
              body: SingleChildScrollView(
                  controller: _scrollController,
                  child: Column(
                    children: [
                      Stack(

                        children: [
                          Container(
                              width: double.infinity,
                              height: 641,
                              color: const Color(0xFFEFF8FF),
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.only(top: 20),
                                  child: Container(
                                    width: 288,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 288,
                                              height: 165,
                                              child: SelectableText('Первое занятие бесплатно —', style: offerTxt(size: 40),),
                                            ),
                                            SizedBox(height: 16,),
                                            Container(
                                              width: 288,
                                              child: SelectableText('Выбери свое предложение', style: blockTxt(size: 14),),
                                            ),
                                            SizedBox(height: 32,),
                                            button(onClick: (){
                                              _scrollController.animateTo(750, duration: Duration(milliseconds: 500), // длительность анимации
                                                curve: Curves.easeInOut,);
                                            }, text: 'Посмотреть все курсы', width: 235, height: 39, radius: 4),

                                          ],
                                        ),
                                        SizedBox(height: 48,),
                                        Container(
                                          width: 288,
                                          height: 185,
                                          child: Image.asset('assets/banner2.png', fit: BoxFit.contain,),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                          ),
                          Center(
                            child: Padding(
                              padding: EdgeInsets.only(top: 558),
                              child: CoursesSlider(scrollController: _scrollControllerMobile, cards: mainCoursesMobile, height: 171,)
                            ),
                          )
                        ],
                      ),
                      margin_top(screen.maxWidth),
                      Center(
                        child: Container(
                          width: 288,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SelectableText('Очные курсы', style: headerTxt(size: 36),),
                              SizedBox(height: 38,),
                            ],
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          width: screen.maxWidth,
                          child: CoursesSlider(scrollController: _scrollControllerMobileOffline, cards: widget.offlineCoursesMobile, height: 221)
                        ),
                      ),

                      margin_top(screen.maxWidth),
                      Center(
                        child: Container(
                          width: 288,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SelectableText('Онлайн курсы', style: headerTxt(size: 36),),
                              SizedBox(height: 38,),
                            ],
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                            width: screen.maxWidth,
                            child: CoursesSlider(scrollController: _scrollControllerMobileOnline, cards: widget.onlineCoursesMobile, height: 221)
                        ),
                      ),
                      margin_top(screen.maxWidth),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: QuestionsScreen(),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Footer(),
                      ),

                    ],
                  )
              ),
            );
          }else{
            return Scaffold(
              appBar: myAppBar(),
              body: SingleChildScrollView(
                  controller: _scrollController,
                  child: Column(
                    children: [
                      Stack(

                        children: [
                          Container(
                              width: double.infinity,
                              height: 605,
                              color: const Color(0xFFEFF8FF),
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.only(top: 80),
                                  child: Container(
                                    width: 1200,
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 588,
                                              height: 200,
                                              child: SelectableText('Первое занятие бесплатно —', style: offerTxt(),),
                                            ),
                                            SizedBox(height: 16,),
                                            Container(
                                              width: 488,
                                              child: SelectableText('Выбери свое предложение', style: blockTxt(),),
                                            ),
                                            SizedBox(height: 32,),
                                            button(onClick: (){
                                              _scrollController.animateTo(800, duration: Duration(milliseconds: 500), // длительность анимации
                                                curve: Curves.easeInOut,);
                                            }, text: 'Посмотреть все курсы'),

                                          ],
                                        ),
                                        Spacer(),
                                        Container(
                                          width: 488,
                                          height: 312,
                                          child: Image.asset('assets/banner2.png', fit: BoxFit.contain,),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                          ),
                          Center(
                            child: Padding(
                              padding: EdgeInsets.only(top: 456),
                              child: Container(
                                width: 1200,
                                child: GridView.builder(
                                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      childAspectRatio: 387 / 327,
                                      mainAxisSpacing: 20.0,
                                      crossAxisSpacing: 20.0,
                                    ),
                                    itemCount: mainCourses.length,
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index){
                                      return mainCourses[index];
                                    }
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      Center(
                        child: Container(
                          width: 1200,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 130,),
                              SelectableText('Очные курсы', style: headerTxt(),),
                              SizedBox(height: 130,),
                              OfflineCourses(futureCards: widget.offlineCourses, futureCardsTablet: widget.offlineCoursesTablet,)
                            ],
                          ),
                        ),
                      ),

                      margin_top(screen.maxWidth),
                      Center(
                        child: Container(
                          width: 1200,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 130,),
                              SelectableText('Онлайн курсы', style: headerTxt(),),
                              SizedBox(height: 130,),
                              OnlineCourses(futureCards: widget.onlineCourses, futureCardsTablet: widget.onlineCoursesTablet,)
                            ],
                          ),
                        ),
                      ),

                      margin_top(screen.maxWidth),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: QuestionsScreen(),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Footer(),
                      ),

                    ],
                  )
              ),
            );
          }
        }
    );
  }


}