import 'package:flutter/material.dart';

import '../styles/styles.dart';




class BannerScreen extends StatelessWidget {
  BannerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(
        builder: (context, screen){
          if(screen.maxWidth < 1200 && screen.maxWidth > 601){
            return Container(
              width: double.infinity,
              height: 304,
              color: const Color(0xFFEFF8FF),
              child: Center(
                  child: Container(
                    width: 727,
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 40,),
                            Container(
                              width: 275,
                              height: 60,
                              child: SelectableText('LingvoLand', style: offerTxt(size: 40),),
                            ),
                            SizedBox(height: 10,),
                            Container(
                              width: 295,
                              child: SelectableText('Мы соединяем языки и культуры, '
                                  'расширяем возможности наших студентов и помогаем '
                                  'им достигать успеха в изучении языков.', style: blockTxt(size: 14),),
                            ),
                            SizedBox(height: 26,),
                            button(onClick: (){}, text: 'Записаться', width: 173, height: 40, size: 14),

                          ],
                        ),
                        Spacer(),
                        Container(
                          width: 296,
                          height: 304,
                          child: Image.asset('assets/banner.png', fit: BoxFit.contain,),
                        )
                      ],
                    ),
                  )
              ),
            );
          }else if(screen.minWidth <= 600){
            return Container(
              width: double.infinity,
              height: 585,
              color: const Color(0xFFEFF8FF),
              child: Center(
                  child: Container(
                    width: 288,
                    height: 548,
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 32,),
                            Container(
                              width: 275,
                              height: 55,
                              child: SelectableText('LingvoLand', style: offerTxt(size: 40),),
                            ),
                            SizedBox(height: 10,),
                            Container(
                              width: 288,
                              child: SelectableText('Мы соединяем языки и культуры, '
                                  'расширяем возможности наших студентов и помогаем '
                                  'им достигать успеха в изучении языков.', style: blockTxt(size: 14),),
                            ),
                            SizedBox(height: 26,),
                            button(onClick: (){}, text: 'Записаться', width: 163, height: 40, size: 14),

                          ],
                        ),
                        Spacer(),
                        Container(
                          width: 288,
                          height: 295,
                          child: Image.asset('assets/banner.png', fit: BoxFit.contain,),
                        )
                      ],
                    ),
                  )
              ),
            );
          }else{
            return Container(
              width: double.infinity,
              height: 605,
              color: const Color(0xFFEFF8FF),
              child: Center(
                  child: Container(
                    width: 1200,
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 110,),
                            Container(
                              width: 490,
                              height: 100,
                              child: SelectableText('LingvoLand', style: offerTxt(),),
                            ),
                            SizedBox(height: 48,),
                            Container(
                              width: 488,
                              child: SelectableText('Мы соединяем языки и культуры, '
                                  'расширяем возможности наших студентов и помогаем '
                                  'им достигать успеха в изучении языков.', style: blockTxt(),),
                            ),
                            SizedBox(height: 32,),
                            button(onClick: (){}, text: 'Записаться'),

                          ],
                        ),
                        Spacer(),
                        Container(
                          width: 602,
                          height: 605,
                          child: Image.asset('assets/banner.png', fit: BoxFit.contain,),
                        )
                      ],
                    ),
                  )
              ),
            );
          }
        }
    );
  }
}