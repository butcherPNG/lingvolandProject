

import 'package:flutter/material.dart';

import '../styles/styles.dart';

class FeaturesScreen extends StatelessWidget {
  FeaturesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(
        builder: (context, screen){
          if(screen.maxWidth < 1200 && screen.maxWidth > 601){
            return Center(
              child: Container(
                width: 727,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SelectableText('Почему мы', style: headerTxt(size: 36),),
                    SizedBox(height: 46,),
                    Container(
                      width: 727,
                      child: Row(
                        children: [
                          Container(
                            width: 358,
                            height: 314,
                            decoration: boxDecoration,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 15,),
                                Container(
                                    child: Row(
                                      children: [
                                        SizedBox(width: 15,),
                                        Container(
                                          width: 286,
                                          child: SelectableText('Большая база знаний для самостоятельного обучения', style: middleTxt(fontSize: 24.0),),
                                        )

                                      ],
                                    )
                                ),
                                Spacer(),
                                Container(
                                  width: 358,
                                  height: 170,
                                  child: Image.asset('assets/bigBase.png', fit: BoxFit.contain,),
                                )
                              ],
                            ),
                          ),
                          Spacer(),
                          Container(
                            width: 358,
                            height: 314,
                            child: Column(
                              children: [
                                Container(
                                    width: 358,
                                    height: 176,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage('assets/exp10.png'),
                                          fit: BoxFit.cover,
                                        )
                                    ),
                                    child: Column(
                                      children: [
                                        SizedBox(height: 12,),
                                        Row(
                                          children: [
                                            SizedBox(width: 12,),
                                            Container(
                                              width: 284,
                                              child: SelectableText(
                                                'Работаем в сфере обучения более 10 лет', style: middleTxt(fontSize: 20.0),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    )
                                ),
                                Spacer(),
                                Row(
                                  children: [
                                    Container(
                                      width: 173,
                                      height: 126,
                                      decoration: boxDecoration,
                                      child: Column(
                                        children: [
                                          SizedBox(height: 12,),
                                          Row(
                                            children: [
                                              SizedBox(width: 12,),
                                              Container(
                                                width: 100,
                                                child: SelectableText(
                                                  'Выгодная рассрочка', style: middleTxt(fontSize: 16.0),
                                                ),
                                              ),


                                            ],
                                          ),
                                          Spacer(),
                                          Row(
                                            children: [
                                              SizedBox(width: 1,),
                                              Spacer(),
                                              Container(
                                                width: 110,
                                                height: 62,
                                                child: Image.asset('assets/number.png', fit: BoxFit.contain,),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      width: 173,
                                      height: 126,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            color: const Color(0xFFF8F8F8),
                                            width: 1,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: const Color(0xFF2F2F2F).withOpacity(0.06),
                                              offset: Offset(0, 4),
                                              blurRadius: 24,
                                            ),
                                          ],
                                          borderRadius: BorderRadius.circular(8),
                                          image: DecorationImage(
                                            image: AssetImage('assets/teacher.png'),
                                            fit: BoxFit.fill,
                                          )
                                      ),
                                      child: Column(
                                        children: [
                                          SizedBox(height: 12,),
                                          Row(
                                            children: [
                                              SizedBox(width: 12,),
                                              Container(
                                                width: 124,
                                                child: SelectableText(
                                                  'Опытные преподаватели', style: middleTxt(fontSize: 16.0, color: Colors.white),
                                                ),
                                              ),


                                            ],
                                          ),

                                        ],
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }else if(screen.minWidth <= 600){
            return Center(
              child: Container(
                width: 288,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SelectableText('Почему мы', style: headerTxt(size: 36),),
                    SizedBox(height: 46,),
                    Container(
                      width: 288,
                      height: 518,
                      child: Column(
                        children: [
                          Container(
                            width: 288,
                            height: 252,
                            decoration: boxDecoration,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 15,),
                                Container(
                                    child: Row(
                                      children: [
                                        SizedBox(width: 15,),
                                        Container(
                                          width: 251,
                                          child: SelectableText('Большая база знаний для самостоятельного обучения', style: middleTxt(fontSize: 20.0),),
                                        )

                                      ],
                                    )
                                ),
                                Spacer(),
                                Container(
                                  width: 288,
                                  height: 137,
                                  child: Image.asset('assets/bigBase.png', fit: BoxFit.contain,),
                                )
                              ],
                            ),
                          ),
                          Spacer(),
                          Container(
                            width: 288,
                            height: 255,
                            child: Column(
                              children: [
                                Container(
                                    width: 288,
                                    height: 142,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage('assets/exp10.png'),
                                          fit: BoxFit.cover,
                                        )
                                    ),
                                    child: Column(
                                      children: [
                                        SizedBox(height: 12,),
                                        Row(
                                          children: [
                                            SizedBox(width: 12,),
                                            Container(
                                              width: 226,
                                              child: SelectableText(
                                                'Работаем в сфере обучения более 10 лет', style: middleTxt(fontSize: 16.0),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    )
                                ),
                                Spacer(),
                                Row(
                                  children: [
                                    Container(
                                      width: 138,
                                      height: 100,
                                      decoration: boxDecoration,
                                      child: Column(
                                        children: [
                                          SizedBox(height: 12,),
                                          Row(
                                            children: [
                                              SizedBox(width: 12,),
                                              Container(
                                                width: 79,
                                                child: SelectableText(
                                                  'Выгодная рассрочка', style: middleTxt(fontSize: 14.0),
                                                ),
                                              ),


                                            ],
                                          ),
                                          Spacer(),
                                          Row(
                                            children: [
                                              SizedBox(width: 1,),
                                              Spacer(),
                                              Container(
                                                width: 88,
                                                height: 49,
                                                child: Image.asset('assets/number.png', fit: BoxFit.contain,),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      width: 138,
                                      height: 100,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            color: const Color(0xFFF8F8F8),
                                            width: 1,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: const Color(0xFF2F2F2F).withOpacity(0.06),
                                              offset: Offset(0, 4),
                                              blurRadius: 24,
                                            ),
                                          ],
                                          borderRadius: BorderRadius.circular(8),
                                          image: DecorationImage(
                                            image: AssetImage('assets/teacher.png'),
                                            fit: BoxFit.fill,
                                          )
                                      ),
                                      child: Column(
                                        children: [
                                          SizedBox(height: 12,),
                                          Row(
                                            children: [
                                              SizedBox(width: 12,),
                                              Container(
                                                width: 110,
                                                child: SelectableText(
                                                  'Опытные преподаватели', style: middleTxt(fontSize: 14.0, color: Colors.white),
                                                ),
                                              ),


                                            ],
                                          ),

                                        ],
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }else{
            return Center(
              child: Container(
                width: 1200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SelectableText('Почему мы', style: headerTxt(),),
                    SizedBox(height: 130,),
                    Container(
                      width: 1200,
                      child: Row(
                        children: [
                          Container(
                            width: 590,
                            height: 517,
                            decoration: boxDecoration,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 24,),
                                Container(
                                    child: Row(
                                      children: [
                                        SizedBox(width: 24,),
                                        Container(
                                          width: 363,
                                          child: SelectableText('Большая база знаний для самостоятельного обучения', style: middleTxt(fontSize: 32.0),),
                                        )

                                      ],
                                    )
                                ),
                                Spacer(),
                                Container(
                                  width: 590,
                                  height: 280,
                                  child: Image.asset('assets/bigBase.png', fit: BoxFit.contain,),
                                )
                              ],
                            ),
                          ),
                          Spacer(),
                          Container(
                            width: 590,
                            height: 517,
                            child: Column(
                              children: [
                                Container(
                                    width: 590,
                                    height: 290,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage('assets/exp10.png'),
                                          fit: BoxFit.cover,
                                        )
                                    ),
                                    child: Column(
                                      children: [
                                        SizedBox(height: 20,),
                                        Row(
                                          children: [
                                            SizedBox(width: 20,),
                                            Container(
                                              width: 360,
                                              child: SelectableText(
                                                'Работаем в сфере обучения более 10 лет', style: middleTxt(fontSize: 24.0),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    )
                                ),
                                Spacer(),
                                Row(
                                  children: [
                                    Container(
                                      width: 285,
                                      height: 207,
                                      decoration: boxDecoration,
                                      child: Column(
                                        children: [
                                          SizedBox(height: 20,),
                                          Row(
                                            children: [
                                              SizedBox(width: 20,),
                                              Container(
                                                width: 170,
                                                child: SelectableText(
                                                  'Выгодная рассрочка', style: middleTxt(fontSize: 24.0),
                                                ),
                                              ),


                                            ],
                                          ),
                                          Spacer(),
                                          Row(
                                            children: [
                                              SizedBox(width: 1,),
                                              Spacer(),
                                              Container(
                                                width: 181,
                                                height: 102,
                                                child: Image.asset('assets/number.png', fit: BoxFit.contain,),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      width: 285,
                                      height: 207,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            color: const Color(0xFFF8F8F8),
                                            width: 1,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: const Color(0xFF2F2F2F).withOpacity(0.06),
                                              offset: Offset(0, 4),
                                              blurRadius: 24,
                                            ),
                                          ],
                                          borderRadius: BorderRadius.circular(8),
                                          image: DecorationImage(
                                            image: AssetImage('assets/teacher.png'),
                                            fit: BoxFit.fill,
                                          )
                                      ),
                                      child: Column(
                                        children: [
                                          SizedBox(height: 20,),
                                          Row(
                                            children: [
                                              SizedBox(width: 20,),
                                              Container(
                                                width: 190,
                                                child: SelectableText(
                                                  'Опытные преподаватели', style: middleTxt(fontSize: 24.0, color: Colors.white),
                                                ),
                                              ),


                                            ],
                                          ),

                                        ],
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }
        }
    );
  }
}