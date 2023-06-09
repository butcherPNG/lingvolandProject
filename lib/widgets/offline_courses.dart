


import 'package:flutter/material.dart';

import '../presentation/courses_page.dart';
import '../presentation/main_page.dart';

class OfflineCourses extends StatefulWidget {
  final Future<List<Widget?>> futureCards;
  final Future<List<Widget?>> futureCardsTablet;
  const OfflineCourses({Key? key, required this.futureCards, required this.futureCardsTablet}) : super(key: key);

  @override
  _OfflineCoursesState createState() => _OfflineCoursesState();
}

class _OfflineCoursesState extends State<OfflineCourses> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(
        builder: (context, screen){
          if(screen.maxWidth < 1200 && screen.maxWidth > 601){
            return Container(
                width: 727,
                child: FutureBuilder<List<Widget?>>(
                  future: widget.futureCardsTablet,
                  builder: (BuildContext context, AsyncSnapshot<List<Widget?>> snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return GridView.builder(
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: 235 / 268,
                            mainAxisSpacing: 12.0,
                            crossAxisSpacing: 12.0,
                          ),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: offlineCoursesTablet.length,
                          itemBuilder: (context, index){
                            return offlineCoursesTablet[index]!;
                          }
                      );
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                )
            );
          }else if(screen.minWidth <= 600){
            return Container(
                width: 1200,
                child: FutureBuilder<List<Widget?>>(
                  future: widget.futureCards,
                  builder: (BuildContext context, AsyncSnapshot<List<Widget?>> snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return GridView.builder(
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: 387 / 442,
                            mainAxisSpacing: 20.0,
                            crossAxisSpacing: 20.0,
                          ),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: offlineCourses.length,
                          itemBuilder: (context, index){
                            return offlineCourses[index]!;
                          }
                      );
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                )
            );
          }else{
            return Container(
                width: 1200,
                child: FutureBuilder<List<Widget?>>(
                  future: widget.futureCards,
                  builder: (BuildContext context, AsyncSnapshot<List<Widget?>> snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return GridView.builder(
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: 387 / 442,
                            mainAxisSpacing: 20.0,
                            crossAxisSpacing: 20.0,
                          ),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: offlineCourses.length,
                          itemBuilder: (context, index){
                            return offlineCourses[index]!;
                          }
                      );
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                )
            );
          }
        }
    );
  }
}