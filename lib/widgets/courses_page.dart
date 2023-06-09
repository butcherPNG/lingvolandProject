import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:linguasphere/styles/styles.dart';
import 'package:linguasphere/widgets/onHoverWidget.dart';

import '../presentation/main_page.dart';
import '../presentation/responsive/main_page_desktop.dart';



class CoursesScreen extends StatefulWidget {
  final ScrollController scrollController;
  final Future<List<Widget?>> futureCards;
  final Future<List<Widget?>> futureCardsTablet;
  final Future<List<Widget?>> futureCardsMobile;

  const CoursesScreen({Key? key, required this.scrollController, required this.futureCards, required this.futureCardsTablet, required this.futureCardsMobile,}) : super(key: key);

  @override
  _CoursesScreenState createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, screen){
          if(screen.maxWidth < 1200 && screen.maxWidth > 601){
            return Column(

              children: [
                Center(
                  child: Container(
                    width: 727,
                    child: SelectableText('Популярные курсы', style: headerTxt(size: 36),),
                  ),
                ),
                SizedBox(height: 46,),
                FutureBuilder<List<Widget?>>(
                  future: widget.futureCardsTablet,
                  builder: (BuildContext context, AsyncSnapshot<List<Widget?>> snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      final cardsTablet = snapshot.data ?? [];
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        height: 268,
                        child: GestureDetector(
                          onHorizontalDragUpdate: (details) {
                            // Вычисляем новую позицию прокрутки
                            final newPosition = widget.scrollController.position.pixels - details.delta.dx;
                            // Прокручиваем содержимое
                            widget.scrollController.jumpTo(newPosition);
                          },
                          child: SingleChildScrollView(
                            controller: widget.scrollController,
                            physics: ClampingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            child: Row(

                              children: [
                                for (var index = 0; index < cardsTablet.length; index++)
                                  Padding(
                                    padding: index == 0 ? EdgeInsets.only(left: (MediaQuery.of(context).size.width - 727) / 2) : EdgeInsets.only(left: 12),
                                    child: cardsTablet[index],
                                  ),
                              ],
                            ),
                          ),
                        ),
                      );
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                ),



                SizedBox(height: 46,),
                Container(
                    width: double.infinity,
                    height: 311,
                    color: const Color(0xFFEFF8FF),
                    child: Center(
                      child: Container(
                        width: 727,
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SelectableText('Какой курс выбрать? ', style: subHeaderTxt(size: 24),),
                                SizedBox(height: 16,),
                                Container(
                                  width: 296,
                                  child: SelectableText('Пройдите бесплатное тестирование и узнайте какой курс подходит именно Вам.',
                                    style: blockTxt(size: 14),),
                                ),
                                SizedBox(height: 26,),
                                button(onClick: (){}, text: 'Пройти тест', width: 173, height: 40, size: 14),
                              ],
                            ),
                            Spacer(),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  width: 358,
                                  height: 257,
                                  child: Image.asset('assets/whichCourse.png', fit: BoxFit.contain,),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                )
              ],
            );
          }else if(screen.minWidth <= 600){
            return Column(

              children: [
                Center(
                  child: Container(
                    width: 288,
                    child: SelectableText('Популярные курсы', style: headerTxt(size: 36),),
                  ),
                ),
                SizedBox(height: 46,),
                FutureBuilder<List<Widget?>>(
                  future: widget.futureCardsMobile,
                  builder: (BuildContext context, AsyncSnapshot<List<Widget?>> snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      final cardsMobile = snapshot.data ?? [];
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        height: 221,
                        child: GestureDetector(
                          onHorizontalDragUpdate: (details) {
                            // Вычисляем новую позицию прокрутки
                            final newPosition = widget.scrollController.position.pixels - details.delta.dx;
                            // Прокручиваем содержимое
                            widget.scrollController.jumpTo(newPosition);
                          },
                          child: SingleChildScrollView(
                            controller: widget.scrollController,
                            physics: ClampingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            child: Row(

                              children: [
                                for (var index = 0; index < cardsMobile.length; index++)
                                  Padding(
                                    padding: index == 0 ? EdgeInsets.only(left: (MediaQuery.of(context).size.width - 288) / 2) : EdgeInsets.only(left: 12),
                                    child: cardsMobile[index],
                                  ),
                              ],
                            ),
                          ),
                        ),
                      );
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                ),



                SizedBox(height: 46,),
                Container(
                    alignment: Alignment.bottomCenter,
                    width: double.infinity,
                    height: 400,
                    color: const Color(0xFFEFF8FF),
                    child: Container(
                      width: 288,
                      height: 375,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SelectableText('Какой курс выбрать? ', style: subHeaderTxt(size: 24),),
                              SizedBox(height: 16,),
                              Container(
                                width: 296,
                                child: SelectableText('Пройдите бесплатное тестирование и узнайте какой курс подходит именно Вам.',
                                  style: blockTxt(size: 14),),
                              ),
                              SizedBox(height: 26,),
                              button(onClick: (){}, text: 'Пройти тест', width: 173, height: 40, size: 14),
                            ],
                          ),
                          Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                width: 288,
                                height: 207,
                                child: Image.asset('assets/whichCourse.png', fit: BoxFit.contain,),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                )
              ],
            );
          }else{
            return Column(

              children: [
                Center(
                  child: Container(
                    width: 1200,
                    child: SelectableText('Популярные курсы', style: headerTxt(),),
                  ),
                ),
                SizedBox(height: 130,),
                OnHoverWidget(
                    builder: (bool hover){
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        height: 442,
                        child: Stack(
                          children: [

                            FutureBuilder<List<Widget?>>(
                              future: widget.futureCards,
                              builder: (BuildContext context, AsyncSnapshot<List<Widget?>> snapshot) {
                                if (snapshot.connectionState == ConnectionState.done) {
                                  final cards = snapshot.data ?? [];
                                  return Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 442,
                                    child: GestureDetector(
                                      onHorizontalDragUpdate: (details) {
                                        // Вычисляем новую позицию прокрутки
                                        final newPosition = widget.scrollController.position.pixels - details.delta.dx;
                                        // Прокручиваем содержимое
                                        widget.scrollController.jumpTo(newPosition);
                                      },
                                      child: SingleChildScrollView(
                                        controller: widget.scrollController,
                                        physics: ClampingScrollPhysics(),
                                        scrollDirection: Axis.horizontal,
                                        child: Row(

                                          children: [
                                            for (var index = 0; index < cards.length; index++)
                                              Padding(
                                                padding: index == 0 ? EdgeInsets.only(left: (MediaQuery.of(context).size.width - 1200) / 2) : EdgeInsets.only(left: 20),
                                                child: cards[index],
                                              ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                } else {
                                  return CircularProgressIndicator();
                                }
                              },
                            ),
                            Center(
                              child: Container(
                                  height: 70,
                                  child: hover ? Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Visibility(
                                        visible: widget.scrollController.position.pixels > 0,
                                        child: InkResponse(
                                          highlightColor: Colors.transparent,
                                          borderRadius: BorderRadius.zero,
                                          onTap: (){
                                            widget.scrollController.animateTo(
                                              widget.scrollController.offset - 300,
                                              duration: Duration(milliseconds: 500),
                                              curve: Curves.easeInOut,
                                            );
                                          },
                                          child: OnHoverWidget(
                                            builder: (bool hover) {
                                              return Container(
                                                width: 64,
                                                height: 64,
                                                decoration: BoxDecoration(
                                                  color: hover? Color.fromRGBO(0, 0, 0, 0.55) : Colors.transparent,
                                                  borderRadius: BorderRadius.circular(50),
                                                  boxShadow: hover ? null : [
                                                    BoxShadow(
                                                      color: Color(0xFF2F2F2F).withOpacity(0.06),
                                                      offset: Offset(0, 4),
                                                      blurRadius: 24,
                                                    ),
                                                  ],

                                                ),
                                                child: Icon(Icons.arrow_back_ios_outlined, color: Colors.white,),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                      Spacer(),

                                      Visibility(
                                          visible: widget.scrollController.position.pixels < widget.scrollController.position.maxScrollExtent,
                                          child: InkResponse(
                                            highlightColor: Colors.transparent,
                                            borderRadius: BorderRadius.zero,
                                            onTap: (){
                                              widget.scrollController.animateTo(
                                                widget.scrollController.offset + 300,
                                                duration: Duration(milliseconds: 500),
                                                curve: Curves.easeInOut,
                                              );
                                            },
                                            child: OnHoverWidget(
                                              builder: (bool hover) {
                                                return Container(
                                                  width: 64,
                                                  height: 64,
                                                  decoration: BoxDecoration(
                                                    color: hover ? Color.fromRGBO(0, 0, 0, 0.55) : Colors.transparent,
                                                    borderRadius: BorderRadius.circular(50),
                                                    boxShadow: hover ? null : [
                                                      BoxShadow(
                                                        color: Color(0xFF2F2F2F).withOpacity(0.06),
                                                        offset: Offset(0, 4),
                                                        blurRadius: 24,
                                                      ),
                                                    ],

                                                  ),
                                                  child: Icon(Icons.arrow_forward_ios_outlined, color: Colors.white,),
                                                );
                                              },
                                            ),
                                          )
                                      )

                                    ],
                                  )
                                      : Container()
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                ),


                SizedBox(height: 130,),
                Container(
                    width: double.infinity,
                    height: 458,
                    color: const Color(0xFFEFF8FF),
                    child: Center(
                      child: Container(
                        width: 1200,
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SelectableText('Какой курс выбрать? ', style: subHeaderTxt(),),
                                SizedBox(height: 24,),
                                Container(
                                  width: 488,
                                  child: SelectableText('Пройдите бесплатное тестирование и узнайте какой курс подходит именно Вам.',
                                    style: blockTxt(),),
                                ),
                                SizedBox(height: 36,),
                                button(onClick: (){}, text: 'Пройти тест'),
                              ],
                            ),
                            Spacer(),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  width: 560,
                                  height: 403,
                                  child: Image.asset('assets/whichCourse.png', fit: BoxFit.contain,),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                )
              ],
            );
          }
        }
    );

  }
}