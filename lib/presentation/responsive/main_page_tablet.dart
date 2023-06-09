// import 'dart:async';
//
// import 'package:auto_route/auto_route.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:linguasphere/widgets/banner.dart';
//
// import '../../styles/styles.dart';
// import '../../widgets/appBar.dart';
// import '../../widgets/courses_page.dart';
// import '../../widgets/features.dart';
// import '../../widgets/footer.dart';
// import '../../widgets/offers.dart';
// import '../../widgets/onHoverWidget.dart';
// import '../../widgets/questions.dart';
// import '../../widgets/skills.dart';
//
//
// late List<Widget?> cards;
//
//
//
//
//
//
// class MainPageTablet extends StatefulWidget {
//
//
//
//   @override
//   _MainPageTabletState createState() => _MainPageTabletState();
// }
//
//
// class _MainPageTabletState extends State<MainPageTablet> {
//
//   Future<List<Widget?>> loadCourses() async {
//     final courses = <Widget?>[];
//
//     final snapshot = await FirebaseFirestore.instance.collection('courses').get();
//     final docs = snapshot.docs;
//
//     for (var element in docs) {
//       courses.add(tabletCourseCard(
//           backgr: element.data()['cardColor'] == 'black' ? dark : white,
//           title: element.data()['title'],
//           price: element.data()['price'],
//           img: element.data()['img'],
//           tap: element.data()['title'] == 'Индивидуальное онлайн обучение' ? (){
//             AutoRouter.of(context).pushNamed('/detail_page');
//           } : (){}
//       ));
//     }
//
//     setState(() {
//       cards = courses.take(6).toList();
//     });
//
//     return cards;
//   }
//
//   @override
//   void initState() {
//     loadCourses();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     ScrollController _scrollController = ScrollController();
//     return Scaffold(
//       appBar: myAppBarTablet(),
//       endDrawer: Drawer(
//         backgroundColor: Color(0xff060C1D),
//         child: ListView(
//           padding: EdgeInsets.only(left: 24, top: 36),
//           children: [
//             InkWell(
//               onTap: (){
//                 AutoRouter.of(context).pushNamed('/');
//               },
//               child: OnHoverWidget(
//                 builder: (bool isHovered) {
//                   return Text('Главная', style: navTxt(color: isHovered? Color(0xFF828282) : Colors.white, fontSize: 16, weight: FontWeight.w400),);
//                 },
//               ),
//             ),
//             SizedBox(height: 16,),
//             InkWell(
//               onTap: (){
//                 AutoRouter.of(context).pushNamed('/courses');
//               },
//               child: OnHoverWidget(
//                 builder: (bool isHovered) {
//                   return Text('Курсы', style: navTxt(color: isHovered? Color(0xFF828282) : Colors.white, fontSize: 16, weight: FontWeight.w400),);
//                 },
//               ),
//             ),
//             SizedBox(height: 16,),
//             InkWell(
//               onTap: (){},
//               child: OnHoverWidget(
//                 builder: (bool isHovered) {
//                   return Text('Блог', style: navTxt(color: isHovered? Color(0xFF828282) : Colors.white, fontSize: 16, weight: FontWeight.w400),);
//                 },
//               ),
//             ),
//             SizedBox(height: 16,),
//             InkWell(
//               onTap: (){},
//               child: OnHoverWidget(
//                 builder: (bool isHovered) {
//                   return Text('О центре', style: navTxt(color: isHovered? Color(0xFF828282) : Colors.white, fontSize: 16, weight: FontWeight.w400),);
//                 },
//               ),
//             ),
//             SizedBox(height: 16,),
//             InkWell(
//               onTap: (){},
//               child: OnHoverWidget(
//                 builder: (bool isHovered) {
//                   return Text('Контакты', style: navTxt(color: isHovered? Color(0xFF828282) : Colors.white, fontSize: 16, weight: FontWeight.w400),);
//                 },
//               ),
//             ),
//             SizedBox(height: 16,),
//             InkWell(
//               onTap: (){},
//               child: OnHoverWidget(
//                 builder: (bool isHovered) {
//                   return Text('Вопрос-ответ', style: navTxt(color: isHovered? Color(0xFF828282) : Colors.white, fontSize: 16, weight: FontWeight.w400),);
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//       body: ListView(
//         children: [
//
//           BannerScreen(),
//           SizedBox(height: 64,),
//           OfferScreen(),
//           SizedBox(height: 64,),
//           CoursesScreen(scrollController: scrollController, futureCards: futureCards),
//
//           SizedBox(height: 64,),
//           FeaturesScreen(),
//           SizedBox(height: 64,),
//           SkillsScreen(),
//           SizedBox(height: 64,),
//           QuestionsScreen(),
//           const FooterTablet()
//
//         ],
//       ),
//     );
//   }
//
//
// }