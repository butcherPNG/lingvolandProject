import 'package:flutter/material.dart';

import '../presentation/courses_page.dart';
import '../presentation/main_page.dart';

class OnlineCourses extends StatefulWidget {
  final Future<List<Widget?>> futureCards;
  final Future<List<Widget?>> futureCardsTablet;
  const OnlineCourses({Key? key, required this.futureCards, required this.futureCardsTablet}) : super(key: key);

  @override
  _OnlineCoursesState createState() => _OnlineCoursesState();
}

class _OnlineCoursesState extends State<OnlineCourses> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, screen) {
      if (screen.maxWidth < 1200 && screen.maxWidth > 601) {
        return Container(
            width: 1200,
            child: FutureBuilder<List<Widget?>>(
              future: widget.futureCardsTablet,
              builder: (BuildContext context,
                  AsyncSnapshot<List<Widget?>> snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 235 / 268,
                        mainAxisSpacing: 12.0,
                        crossAxisSpacing: 12.0,
                      ),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: onlineCoursesTablet.length,
                      itemBuilder: (context, index) {
                        return onlineCoursesTablet[index]!;
                      });
                } else {
                  return CircularProgressIndicator();
                }
              },
            ));
      } else if (screen.minWidth <= 600) {
        return Container(
            width: 1200,
            child: FutureBuilder<List<Widget?>>(
              future: widget.futureCards,
              builder: (BuildContext context,
                  AsyncSnapshot<List<Widget?>> snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 387 / 442,
                        mainAxisSpacing: 20.0,
                        crossAxisSpacing: 20.0,
                      ),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: onlineCourses.length,
                      itemBuilder: (context, index) {
                        return onlineCourses[index]!;
                      });
                } else {
                  return CircularProgressIndicator();
                }
              },
            ));
      } else {
        return Container(
            width: 1200,
            child: FutureBuilder<List<Widget?>>(
              future: widget.futureCards,
              builder: (BuildContext context,
                  AsyncSnapshot<List<Widget?>> snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 387 / 442,
                        mainAxisSpacing: 20.0,
                        crossAxisSpacing: 20.0,
                      ),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: onlineCourses.length,
                      itemBuilder: (context, index) {
                        return onlineCourses[index]!;
                      });
                } else {
                  return CircularProgressIndicator();
                }
              },
            ));
      }
    });
  }
}