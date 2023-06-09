import 'package:flutter/material.dart';

import '../styles/styles.dart';

class OfferScreen extends StatelessWidget {
  OfferScreen({Key? key}) : super(key: key);

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
                    child: SelectableText('Что мы предлагаем', style: headerTxt(size: 36),),
                  ),
                ),
                SizedBox(height: 46,),
                Center(
                  child: Container(
                    width: 727,
                    child: Row(
                      children: [
                        Container(
                          width: 295,
                          height: 193,
                          child: Image.asset('assets/group.png', fit: BoxFit.contain,),
                        ),
                        Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 35,
                              child: SelectableText('Очное обучение', style: subHeaderTxt(size: 24),scrollPhysics: NeverScrollableScrollPhysics(),),
                            ),
                            SizedBox(height: 12,),
                            Container(
                              width: 358,
                              child: SelectableText('LingvoLand предлагает групповые курсы английского языка для '
                                  'студентов всех уровней подготовки. Наши квалифицированные преподаватели '
                                  'помогут вам научиться речи на английском языке с нуля '
                                  'или улучшить уже имеющиеся навыки.', style: blockTxt(size: 14),),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 46,),
                Center(
                  child: Container(
                    width: 727,
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 35,
                              child: SelectableText('Онлайн обучение', style: subHeaderTxt(size: 24),),
                            ),

                            SizedBox(height: 12,),
                            Container(
                              width: 348,
                              child: SelectableText('Мы предлагаем онлайн-обучение английскому '
                                  'языку, которое позволяет вам изучать язык в любое '
                                  'удобное время и из любой точки мира. Вы получите '
                                  'персональную обратную связь от преподавателя и '
                                  'помощь в решении любых трудностей.', style: blockTxt(size: 14),),
                            )
                          ],
                        ),
                        Spacer(),
                        Container(
                          width: 295,
                          height: 193,
                          child: Image.asset('assets/group2.png', fit: BoxFit.contain,),
                        ),

                      ],
                    ),
                  ),
                ),
              ],
            );
          }else if (screen.minWidth <= 600){
            return Column(
              children: [
                Center(
                  child: Container(
                    width: 288,
                    child: SelectableText('Что мы предлагаем', style: headerTxt(size: 36),),
                  ),
                ),
                SizedBox(height: 46,),
                Center(
                  child: Container(
                    width: 288,
                    height: 410,
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 35,
                              child: SelectableText('Очное обучение', style: subHeaderTxt(size: 24),scrollPhysics: NeverScrollableScrollPhysics(),),
                            ),
                            SizedBox(height: 12,),
                            Container(
                              width: 288,
                              child: SelectableText('LingvoLand предлагает групповые курсы английского языка для '
                                  'студентов всех уровней подготовки. Наши квалифицированные преподаватели '
                                  'помогут вам научиться речи на английском языке с нуля '
                                  'или улучшить уже имеющиеся навыки.', style: blockTxt(size: 14),),
                            )
                          ],
                        ),
                        Spacer(),
                        Container(
                          width: 288,
                          height: 188,
                          child: Image.asset('assets/group.png', fit: BoxFit.contain,),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 46,),
                Center(
                  child: Container(
                    width: 288,
                    height: 410,
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 35,
                              child: SelectableText('Онлайн обучение', style: subHeaderTxt(size: 24),),
                            ),

                            SizedBox(height: 12,),
                            Container(
                              width: 288,
                              child: SelectableText('Мы предлагаем онлайн-обучение английскому '
                                  'языку, которое позволяет вам изучать язык в любое '
                                  'удобное время и из любой точки мира. Вы получите '
                                  'персональную обратную связь от преподавателя и '
                                  'помощь в решении любых трудностей.', style: blockTxt(size: 14),),
                            )
                          ],
                        ),
                        Spacer(),
                        Container(
                          width: 288,
                          height: 188,
                          child: Image.asset('assets/group2.png', fit: BoxFit.contain,),
                        ),

                      ],
                    ),
                  ),
                ),
              ],
            );
          }else{
            return Column(
              children: [
                Center(
                  child: Container(
                    width: 1200,
                    child: SelectableText('Что мы предлагаем', style: headerTxt(),),
                  ),
                ),
                SizedBox(height: 130,),
                Center(
                  child: Container(
                    width: 1200,
                    child: Row(
                      children: [
                        Container(
                          width: 590,
                          height: 385,
                          child: Image.asset('assets/group.png', fit: BoxFit.contain,),
                        ),
                        Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 55,
                              child: SelectableText('Очное обучение', style: subHeaderTxt(),scrollPhysics: NeverScrollableScrollPhysics(),),
                            ),
                            SizedBox(height: 24,),
                            Container(
                              width: 488,
                              child: SelectableText('LingvoLand предлагает групповые курсы английского языка для '
                                  'студентов всех уровней подготовки. Наши квалифицированные преподаватели '
                                  'помогут вам научиться речи на английском языке с нуля '
                                  'или улучшить уже имеющиеся навыки.', style: blockTxt(),),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 130,),
                Center(
                  child: Container(
                    width: 1200,
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 55,
                              child: SelectableText('Онлайн обучение', style: subHeaderTxt(),),
                            ),

                            SizedBox(height: 24,),
                            Container(
                              width: 488,
                              child: SelectableText('Мы предлагаем онлайн-обучение английскому '
                                  'языку, которое позволяет вам изучать язык в любое '
                                  'удобное время и из любой точки мира. Вы получите '
                                  'персональную обратную связь от преподавателя и '
                                  'помощь в решении любых трудностей.', style: blockTxt(),),
                            )
                          ],
                        ),
                        Spacer(),
                        Container(
                          width: 590,
                          height: 385,
                          child: Image.asset('assets/group2.png', fit: BoxFit.contain,),
                        ),

                      ],
                    ),
                  ),
                ),
              ],
            );
          }
        }
    );
  }
}