


import 'package:flutter/material.dart';
import 'package:linguasphere/styles/styles.dart';

class SkillsScreen extends StatelessWidget {
  SkillsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return LayoutBuilder(
        builder: (context, screen){
          if (screen.maxWidth < 1200 && screen.maxWidth > 601){
            return Container(
              width: double.infinity,
              height: 885,
              color: Color(0xff060C1D),
              child: Center(
                  child: Container(
                    width: 727,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 64,),
                        SelectableText('Чему вы научитесь', style: headerTxt(color: Colors.white, size: 36),),
                        SizedBox(height: 46,),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SelectableText('За 1 месяц', style: subHeaderTxt(color: Colors.white, size: 24),),
                                SizedBox(height: 16,),
                                Container(
                                  width: 298,
                                  child: SelectableText('Всего за 1 месяц обучения вы '
                                      'научитесь составлять простые предложения на '
                                      'иностранном языке и понимать их в речи других людей.',
                                    style: blockTxt(color: Colors.white, size: 14),),
                                )
                              ],
                            ),
                            Spacer(),
                            Container(
                              width: 358,
                              height: 111,
                              child: Image.asset('assets/month.png', fit: BoxFit.contain,),
                            ),

                          ],
                        ),
                        SizedBox(height: 46,),
                        Row(
                          children: [
                            Container(
                              width: 358,
                              height: 220,
                              child: Image.asset('assets/half.png', fit: BoxFit.contain,),
                            ),
                            Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SelectableText('За полгода ', style: subHeaderTxt(color: Colors.white, size: 24),),
                                SizedBox(height: 16,),
                                Container(
                                  width: 298,
                                  child: SelectableText('За полгода обучения вы овладеете '
                                      'такими навыками как способность писать простые '
                                      'письма и сообщения на иностранном языке и умение '
                                      'понимать речь на слух.', style: blockTxt(color: Colors.white, size: 14),),
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 46,),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SelectableText('За 1 год', style: subHeaderTxt(color: Colors.white, size: 24),),
                                SizedBox(height: 16,),
                                Container(
                                  width: 298,
                                  child: SelectableText('За год обучения вы можете '
                                      'овладеть базовой грамматикой, словарным запасом от '
                                      'нескольких тысяч слов, улучшить произношение, а '
                                      'также погрузиться в культуру и традиции.', style: blockTxt(color: Colors.white, size: 14),),
                                )
                              ],
                            ),
                            Spacer(),
                            Container(
                              width: 358,
                              height: 220,
                              child: Image.asset('assets/year.png', fit: BoxFit.contain,),
                            ),

                          ],
                        ),
                      ],
                    ),
                  )
              ),
            );
          }else if (screen.minWidth <= 600){
            return Container(
              width: double.infinity,
              height: 1285,
              color: dark,
              child: Center(
                  child: Container(
                    width: 288,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 64,),
                        SelectableText('Чему вы научитесь', style: headerTxt(color: Colors.white, size: 36),),
                        SizedBox(height: 46,),
                        Container(
                          width: 288,
                          height: 244,
                          child: Column(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SelectableText('За 1 месяц', style: subHeaderTxt(color: Colors.white, size: 24),),
                                  SizedBox(height: 16,),
                                  Container(
                                    width: 288,
                                    child: SelectableText('Всего за 1 месяц обучения вы '
                                        'научитесь составлять простые предложения на '
                                        'иностранном языке и понимать их в речи других людей.',
                                      style: blockTxt(color: Colors.white, size: 14),),
                                  )
                                ],
                              ),
                              Spacer(),
                              Container(
                                width: 288,
                                height: 89,
                                child: Image.asset('assets/month.png', fit: BoxFit.contain,),
                              ),

                            ],
                          ),
                        ),
                        SizedBox(height: 46,),
                        Container(
                          width: 288,
                          height: 360,
                          child: Column(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SelectableText('За полгода ', style: subHeaderTxt(color: Colors.white, size: 24),),
                                  SizedBox(height: 16,),
                                  Container(
                                    width: 288,
                                    child: SelectableText('За полгода обучения вы овладеете '
                                        'такими навыками как способность писать простые '
                                        'письма и сообщения на иностранном языке и умение '
                                        'понимать речь на слух.', style: blockTxt(color: Colors.white, size: 14),),
                                  )
                                ],
                              ),
                              Spacer(),
                              Container(
                                width: 288,
                                height: 176,
                                child: Image.asset('assets/half.png', fit: BoxFit.contain,),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 46,),
                        Container(
                          width: 288,
                          height: 353,
                          child: Column(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SelectableText('За 1 год', style: subHeaderTxt(color: Colors.white, size: 24),),
                                  SizedBox(height: 16,),
                                  Container(
                                    width: 288,
                                    child: SelectableText('За год обучения вы можете '
                                        'овладеть базовой грамматикой, словарным запасом от '
                                        'нескольких тысяч слов, улучшить произношение, а '
                                        'также погрузиться в культуру и традиции.', style: blockTxt(color: Colors.white, size: 14),),
                                  )
                                ],
                              ),
                              Spacer(),
                              Container(
                                width: 288,
                                height: 176,
                                child: Image.asset('assets/year.png', fit: BoxFit.contain,),
                              ),

                            ],
                          ),
                        ),
                      ],
                    ),
                  )
              ),
            );
          }else{
            return Container(
              width: double.infinity,
              height: 1580,
              color: dark,
              child: Center(
                  child: Container(
                    width: 1200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 80,),
                        SelectableText('Чему вы научитесь', style: headerTxt(color: Colors.white),),
                        SizedBox(height: 130,),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SelectableText('За 1 месяц', style: subHeaderTxt(color: Colors.white),),
                                SizedBox(height: 24,),
                                Container(
                                  width: 387,
                                  child: SelectableText('Всего за 1 месяц обучения вы '
                                      'научитесь составлять простые предложения на '
                                      'иностранном языке и понимать их в речи других людей.',
                                    style: blockTxt(color: Colors.white),),
                                )
                              ],
                            ),
                            Spacer(),
                            Container(
                              width: 590,
                              height: 150,
                              child: Image.asset('assets/month.png', fit: BoxFit.contain,),
                            ),

                          ],
                        ),
                        SizedBox(height: 130,),
                        Row(
                          children: [
                            Container(
                              width: 590,
                              height: 361,
                              child: Image.asset('assets/half.png', fit: BoxFit.contain,),
                            ),
                            Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SelectableText('За полгода ', style: subHeaderTxt(color: Colors.white),),
                                SizedBox(height: 24,),
                                Container(
                                  width: 387,
                                  child: SelectableText('За полгода обучения вы овладеете '
                                      'такими навыками как способность писать простые '
                                      'письма и сообщения на иностранном языке и умение '
                                      'понимать речь на слух.', style: blockTxt(color: Colors.white),),
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 130,),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SelectableText('За 1 год', style: subHeaderTxt(color: Colors.white),),
                                SizedBox(height: 24,),
                                Container(
                                  width: 387,
                                  child: SelectableText('За год обучения вы можете '
                                      'овладеть базовой грамматикой, словарным запасом от '
                                      'нескольких тысяч слов, улучшить произношение, а '
                                      'также погрузиться в культуру и традиции.', style: blockTxt(color: Colors.white),),
                                )
                              ],
                            ),
                            Spacer(),
                            Container(
                              width: 590,
                              height: 385,
                              child: Image.asset('assets/year.png', fit: BoxFit.contain,),
                            ),

                          ],
                        ),
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