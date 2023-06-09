


import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../styles/styles.dart';
import '../widgets/appBar.dart';
import '../widgets/footer.dart';
import '../widgets/panel.dart';
import '../widgets/process.dart';
import '../widgets/questions.dart';

class DetailPage extends StatefulWidget {

  final String id;
  DetailPage({required this.id});

  @override
  _DetailPageState createState() => _DetailPageState();
}


class _DetailPageState extends State<DetailPage> {
  String? img;
  String? title;
  String? description;
  String? type;
  String? level;
  String? age;
  String? price;

  Completer<void> coursesCompleter = Completer<void>();

  Future<void> loadCourse() async {
    await FirebaseFirestore.instance.collection('courses').doc(widget.id).get().then((course){
      setState(() {
        title = course.data()!['title'];
        img = course.data()!['img'];
        description = course.data()!['description'];
        type = course.data()!['type'] == 'online' ? 'Онлайн': 'Очный';
        level = course.data()!['level'];
        age = course.data()!['age'];
        price = course.data()!['price'];
      });

    });
    coursesCompleter.complete();
  }
  @override
  void initState() {
    loadCourse();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
        future: coursesCompleter.future,
        builder: (context, snap){
          if (snap.connectionState == ConnectionState.done){
            return LayoutBuilder(
                builder: (context, screen){
                  if(screen.maxWidth < 1200 && screen.maxWidth > 601){
                    return Scaffold(
                      appBar: myAppBar(),
                      body: ListView(
                        children: [
                          SizedBox(height: 45,),
                          Center(
                            child: Container(
                              width: 727,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 481,
                                    height: 298,
                                    child: Image.network(img!, fit: BoxFit.cover,),
                                  ),
                                  Spacer(),
                                  Container(
                                    width: 235,
                                    child: Column(
                                      children: [
                                        Container(
                                            width: 235,
                                            height: 47,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFFFDDDD),
                                              borderRadius: BorderRadius.circular(0),
                                              border: Border.all(
                                                width: 0,
                                                color: Colors.transparent,
                                              ),
                                            ),
                                            child: Center(
                                              child: Text(type!, style: GoogleFonts.manrope(
                                                  textStyle: TextStyle(
                                                    fontStyle: FontStyle.normal,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 18,
                                                    height: 1.6,
                                                    color: Color(0xFFB39191),
                                                  )
                                              ),),
                                            )
                                        ),
                                        SizedBox(height: 24,),
                                        Container(
                                            width: 235,
                                            height: 47,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFFFDDDD),
                                              borderRadius: BorderRadius.circular(0),
                                              border: Border.all(
                                                width: 0,
                                                color: Colors.transparent,
                                              ),
                                            ),
                                            child: Center(
                                              child: Text('Уровень ${level!}', style: GoogleFonts.manrope(
                                                  textStyle: TextStyle(
                                                    fontStyle: FontStyle.normal,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 18,
                                                    height: 1.6,
                                                    color: Color(0xFFB39191),
                                                  )
                                              ),),
                                            )
                                        ),
                                        SizedBox(height: 24,),
                                        Container(
                                            width: 235,
                                            height: 47,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFFFDDDD),
                                              borderRadius: BorderRadius.circular(0),
                                              border: Border.all(
                                                width: 0,
                                                color: Colors.transparent,
                                              ),
                                            ),
                                            child: Center(
                                              child: Text(price!, style: GoogleFonts.manrope(
                                                  textStyle: TextStyle(
                                                    fontStyle: FontStyle.normal,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 18,
                                                    height: 1.6,
                                                    color: Color(0xFFB39191),
                                                  )
                                              ),),
                                            )
                                        ),
                                        SizedBox(height: 24,),
                                        Container(
                                            width: 235,
                                            height: 47,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFFFDDDD),
                                              borderRadius: BorderRadius.circular(0),
                                              border: Border.all(
                                                width: 0,
                                                color: Colors.transparent,
                                              ),
                                            ),
                                            child: Center(
                                              child: Text(age!, style: GoogleFonts.manrope(
                                                  textStyle: TextStyle(
                                                    fontStyle: FontStyle.normal,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 18,
                                                    height: 1.6,
                                                    color: Color(0xFFB39191),
                                                  )
                                              ),),
                                            )
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Center(
                              child: Container(
                                width: 727,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 26,),
                                    Container(
                                      width: 481,
                                      child: SelectableText(title!, style: headerTxt(size: 40),),
                                    ),
                                    SizedBox(height: 32,),
                                    Container(
                                      width: 727,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                              width: 727,
                                              decoration: BoxDecoration(
                                                border: const Border(
                                                  top: BorderSide(
                                                    color: Color(0xffD4D9DD),
                                                    width: 2.0,
                                                  ),
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    height: 150,
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        SelectableText('О курсе',
                                                          style: GoogleFonts.manrope(
                                                              textStyle: TextStyle(
                                                                fontStyle: FontStyle
                                                                    .normal,
                                                                fontWeight: FontWeight
                                                                    .w700,
                                                                fontSize: 24.0,
                                                                height: 1.6,
                                                                // line-height in Flutter
                                                                color: Color(
                                                                    0xFF414E61),
                                                              )),

                                                        ),
                                                        if(title! == 'Доступ к базе знаний центра')
                                                          button(onClick: (){}, text: 'Получить доступ', width: 173, height: 45, radius: 4)
                                                        else
                                                          button(onClick: (){}, text: 'Записаться', width: 173, height: 45, radius: 4),
                                                      ],
                                                    ),
                                                  ),
                                                  Spacer(),
                                                  Container(
                                                    width: 481,
                                                    child: SelectableText(description!, style: GoogleFonts.manrope(
                                                        textStyle: TextStyle(
                                                          fontFamily: 'Manrope',
                                                          fontStyle: FontStyle.normal,
                                                          fontWeight: FontWeight.w300,
                                                          fontSize: 20,
                                                          height: 1.6, // line-height as a multiplier of the font size
                                                          color: Color(0xFF646A77),
                                                        )
                                                    ),),
                                                  )
                                                ],
                                              ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                          ),
                          SizedBox(height: 80,),
                          if(title! != 'Доступ к базе знаний центра')
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 452,
                              color: Color(0xffCAE6FF),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 40,),
                                  Center(
                                    child: Container(
                                      width: 727,
                                      child: SelectableText('Почему Вы пройдёте этот курс до конца', style: GoogleFonts.manrope(
                                          textStyle: TextStyle(
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 24.0,
                                            height: 1.6, // line-height in Flutter
                                            color: Color(0xFF414E61),
                                          )
                                      ),),
                                    ),
                                  ),
                                  SizedBox(height: 40,),
                                  Center(
                                    child: Container(
                                      width: 727,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 235,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: 212,
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                        width: 173,
                                                        decoration: BoxDecoration(
                                                            border: Border(
                                                              top: BorderSide(
                                                                color: Color(0xffB4D0E9),
                                                                width: 2.0,
                                                              ),
                                                            )
                                                        ),
                                                        child: Padding(
                                                          padding: EdgeInsets.only(top: 8),
                                                          child: Text('01', style: GoogleFonts.manrope(
                                                              textStyle: TextStyle(
                                                                fontStyle: FontStyle.normal,
                                                                fontWeight: FontWeight.w500,
                                                                fontSize: 18.0,
                                                                height: 1.6,
                                                                color: Color(0xFF646D81),
                                                              )
                                                          ),),
                                                        ),
                                                      ),


                                                      SizedBox(height: 8,),
                                                      Text('Контроль и оценка', style: GoogleFonts.manrope(
                                                          textStyle: TextStyle(
                                                            fontStyle: FontStyle.normal,
                                                            fontWeight: FontWeight.w500,
                                                            fontSize: 18.0,
                                                            height: 1.6,
                                                            color: Color(0xFF646D81),
                                                          )
                                                      ),)
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(height: 32,),
                                                Container(
                                                  width: 235,
                                                  decoration: BoxDecoration(
                                                      border: Border(
                                                        top: BorderSide(
                                                          color: Color(0xffB4D0E9),
                                                          width: 2.0,
                                                        ),
                                                      )
                                                  ),
                                                  child: Padding(
                                                      padding: EdgeInsets.only(top: 8),
                                                      child: Text('Преподаватель контролирует выполнение заданий студентом, проверяет его понимание и знание материала, оценивает результаты обучения и корректирует программу обучения при необходимости.',
                                                        style: GoogleFonts.manrope(
                                                            textStyle: TextStyle(
                                                              fontStyle: FontStyle.normal,
                                                              fontWeight: FontWeight.w300,
                                                              fontSize: 14.0,
                                                              height: 1.6,
                                                              color: Color(0xFF6F788C),
                                                            )
                                                        ),)
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            width: 235,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: 212,

                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                        width: 173,
                                                        decoration: BoxDecoration(
                                                            border: Border(
                                                              top: BorderSide(
                                                                color: Color(0xffB4D0E9),
                                                                width: 2.0,
                                                              ),
                                                            )
                                                        ),
                                                        child: Padding(
                                                          padding: EdgeInsets.only(top: 8),
                                                          child: Text('02', style: GoogleFonts.manrope(
                                                              textStyle: TextStyle(
                                                                fontStyle: FontStyle.normal,
                                                                fontWeight: FontWeight.w500,
                                                                fontSize: 18.0,
                                                                height: 1.6,
                                                                color: Color(0xFF646D81),
                                                              )
                                                          ),),
                                                        ),
                                                      ),


                                                      SizedBox(height: 8,),
                                                      Text('Поддержка и мотивация', style: GoogleFonts.manrope(
                                                          textStyle: TextStyle(
                                                            fontStyle: FontStyle.normal,
                                                            fontWeight: FontWeight.w500,
                                                            fontSize: 18.0,
                                                            height: 1.6,
                                                            color: Color(0xFF646D81),
                                                          )
                                                      ),)
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(height: 32,),
                                                Container(
                                                  width: 235,
                                                  decoration: BoxDecoration(
                                                      border: Border(
                                                        top: BorderSide(
                                                          color: Color(0xffB4D0E9),
                                                          width: 2.0,
                                                        ),
                                                      )
                                                  ),
                                                  child: Padding(
                                                      padding: EdgeInsets.only(top: 8),
                                                      child: Text('Преподаватель поддерживает студента на протяжении всего процесса обучения, мотивирует его на достижение целей и помогает преодолевать трудности.',
                                                        style: GoogleFonts.manrope(
                                                            textStyle: TextStyle(
                                                              fontStyle: FontStyle.normal,
                                                              fontWeight: FontWeight.w300,
                                                              fontSize: 14.0,
                                                              height: 1.6,
                                                              color: Color(0xFF6F788C),
                                                            )
                                                        ),)
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            width: 235,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: 212,

                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                        width: 173,
                                                        decoration: BoxDecoration(
                                                            border: Border(
                                                              top: BorderSide(
                                                                color: Color(0xffB4D0E9),
                                                                width: 2.0,
                                                              ),
                                                            )
                                                        ),
                                                        child: Padding(
                                                          padding: EdgeInsets.only(top: 8),
                                                          child: Text('03', style: GoogleFonts.manrope(
                                                              textStyle: TextStyle(
                                                                fontStyle: FontStyle.normal,
                                                                fontWeight: FontWeight.w500,
                                                                fontSize: 18.0,
                                                                height: 1.6,
                                                                color: Color(0xFF646D81),
                                                              )
                                                          ),),
                                                        ),
                                                      ),


                                                      SizedBox(height: 8,),
                                                      Text('Итоговое тестирование', style: GoogleFonts.manrope(
                                                          textStyle: TextStyle(
                                                            fontStyle: FontStyle.normal,
                                                            fontWeight: FontWeight.w500,
                                                            fontSize: 18.0,
                                                            height: 1.6,
                                                            color: Color(0xFF646D81),
                                                          )
                                                      ),)
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(height: 32,),
                                                Container(
                                                  width: 235,
                                                  decoration: BoxDecoration(
                                                      border: Border(
                                                        top: BorderSide(
                                                          color: Color(0xffB4D0E9),
                                                          width: 2.0,
                                                        ),
                                                      )
                                                  ),
                                                  child: Padding(
                                                      padding: EdgeInsets.only(top: 8),
                                                      child: Text('В конце года проводится тестирование, которое проверяет знания и умения учеников. Результаты тестирования позволяют оценить успехи студента и подготовить план дальнейшего обучения.',
                                                        style: GoogleFonts.manrope(
                                                            textStyle: TextStyle(
                                                              fontStyle: FontStyle.normal,
                                                              fontWeight: FontWeight.w300,
                                                              fontSize: 14.0,
                                                              height: 1.6,
                                                              color: Color(0xFF6F788C),
                                                            )
                                                        ),)
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )

                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          if(title! != 'Доступ к базе знаний центра')
                            Center(
                              child: Container(
                                width: 727,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 40,),
                                    SelectableText('Процесс обучения', style: GoogleFonts.manrope(
                                        textStyle: TextStyle(
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 24.0,
                                          height: 1.6, // line-height in Flutter
                                          color: Color(0xFF414E61),
                                        )
                                    ),),
                                    SizedBox(height: 32,),
                                    SizedBox(
                                      width: 1200,
                                      child: ProcessScreen(header: 'Оценка уровня знаний', content: 'Перед началом обучения студенту необходимо пройти тестирование, чтобы определить его текущий уровень владения языком.',
                                        imgSize: 44, img: 'assets/brain3.png', first: true,

                                      ),
                                    ),
                                    SizedBox(
                                      width: 1200,
                                      child: ProcessScreen(header: 'Установление целей', content: 'На основе результатов тестирования и консультации'
                                          'с преподавателем студент определяет свои цели'
                                          'и приоритеты в обучении.',
                                        imgSize: 49, img: 'assets/aim.svg',

                                      ),
                                    ),
                                    if(title!.contains('Индивидуальное'))
                                      SizedBox(
                                        width: 1200,
                                        child: ProcessScreen(header: 'Разработка индивидуальной программы обучения', content: 'На основе целей и уровня знаний студента преподаватель разрабатывает индивидуальную программу обучения, которая включает в себя задания для самостоятельной работы, аудио и видео материалы, грамматические упражнения, упражнения на понимание и произношение иноязычной речи.',
                                          imgSize: 39, img: 'assets/program.svg',

                                        ),
                                      ),
                                    SizedBox(
                                      width: 1200,
                                      child: ProcessScreen(header: 'Занятия с преподавателем', content: 'На занятиях студент углубляет свои знания, повышает свой уровень владения языком, работает над ошибками, учится общаться на иностранном языке в различных ситуациях.',
                                        imgSize: 42, img: 'assets/teacher.svg',

                                      ),
                                    ),
                                    SizedBox(
                                      width: 1200,
                                      child: ProcessScreen(header: 'Регулярная самостоятельная работа', content: 'Помимо занятий с преподавателем, студент самостоятельно выполняет задания из программы обучения, прослушивает аудио и видео материалы, читает тексты на иностранном языке и выполняет упражнения.',
                                        imgSize: 52, img: 'assets/homework.svg', last: true,

                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ),
                          SizedBox(height: 130,),
                          QuestionsScreen(),
                          Footer()
                        ],
                      ),
                    );
                  }else if(screen.minWidth <= 600){
                    return Scaffold(
                      appBar: myAppBar(),
                      body: ListView(
                        children: [
                          SizedBox(height: 45,),
                          Center(
                            child: Container(
                              width: 288,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 288,
                                    height: 178,
                                    child: Image.network(img!, fit: BoxFit.cover,),
                                  ),
                                  SizedBox(height: 16,),
                                  Container(
                                    width: 288,
                                    child: SelectableText(title!, style: headerTxt(size: 32),),
                                  ),
                                  SizedBox(height: 20,),
                                  Container(
                                    width: 288,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                            width: 138,
                                            height: 47,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFFFDDDD),
                                              borderRadius: BorderRadius.circular(0),
                                              border: Border.all(
                                                width: 0,
                                                color: Colors.transparent,
                                              ),
                                            ),
                                            child: Center(
                                              child: Text(type!, textAlign: TextAlign.center, style: GoogleFonts.manrope(
                                                  textStyle: TextStyle(
                                                    fontStyle: FontStyle.normal,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 12,
                                                    height: 1.6,
                                                    color: Color(0xFFB39191),
                                                  )
                                              ),),
                                            )
                                        ),
                                        Container(
                                            width: 138,
                                            height: 47,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFFFDDDD),
                                              borderRadius: BorderRadius.circular(0),
                                              border: Border.all(
                                                width: 0,
                                                color: Colors.transparent,
                                              ),
                                            ),
                                            child: Center(
                                              child: Text('Уровень ${level!}', textAlign: TextAlign.center, style: GoogleFonts.manrope(
                                                  textStyle: TextStyle(
                                                    fontStyle: FontStyle.normal,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 12,
                                                    height: 1.6,
                                                    color: Color(0xFFB39191),
                                                  )
                                              ),),
                                            )
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 12,),
                                  Container(
                                    width: 288,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                            width: 138,
                                            height: 47,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFFFDDDD),
                                              borderRadius: BorderRadius.circular(0),
                                              border: Border.all(
                                                width: 0,
                                                color: Colors.transparent,
                                              ),
                                            ),
                                            child: Center(
                                              child: Text(price!, textAlign: TextAlign.center, style: GoogleFonts.manrope(
                                                  textStyle: TextStyle(
                                                    fontStyle: FontStyle.normal,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 12,
                                                    height: 1.6,
                                                    color: Color(0xFFB39191),
                                                  )
                                              ),),
                                            )
                                        ),
                                        Container(
                                            width: 138,
                                            height: 47,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFFFDDDD),
                                              borderRadius: BorderRadius.circular(0),
                                              border: Border.all(
                                                width: 0,
                                                color: Colors.transparent,
                                              ),
                                            ),
                                            child: Center(
                                              child: Text(age!, textAlign: TextAlign.center, style: GoogleFonts.manrope(
                                                  textStyle: TextStyle(
                                                    fontStyle: FontStyle.normal,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 12,
                                                    height: 1.6,
                                                    color: Color(0xFFB39191),
                                                  )
                                              ),),
                                            )
                                        ),
                                      ],
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ),
                          Center(
                              child: Container(
                                width: 288,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 32,),
                                    Container(
                                      width: 288,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 288,
                                            decoration: BoxDecoration(
                                              border: const Border(
                                                top: BorderSide(
                                                  color: Color(0xffD4D9DD),
                                                  width: 2.0,
                                                ),
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.only(top: 16),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  SelectableText('О курсе',
                                                    style: GoogleFonts.manrope(
                                                        textStyle: TextStyle(
                                                          fontStyle: FontStyle
                                                              .normal,
                                                          fontWeight: FontWeight
                                                              .w700,
                                                          fontSize: 16.0,
                                                          height: 1.6,
                                                          // line-height in Flutter
                                                          color: Color(
                                                              0xFF414E61),
                                                        )),

                                                  ),
                                                  Spacer(),
                                                  Container(
                                                    width: 190,
                                                    child: SelectableText(description!, style: GoogleFonts.manrope(
                                                        textStyle: TextStyle(
                                                          fontFamily: 'Manrope',
                                                          fontStyle: FontStyle.normal,
                                                          fontWeight: FontWeight.w300,
                                                          fontSize: 14,
                                                          height: 1.6, // line-height as a multiplier of the font size
                                                          color: Color(0xFF646A77),
                                                        )
                                                    ),),
                                                  )
                                                ],
                                              ),
                                            )
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 36,),
                                    if(title! == 'Доступ к базе знаний центра')
                                      button(onClick: (){}, text: 'Получить доступ', width: 288, height: 45, radius: 4)
                                    else
                                      button(onClick: (){}, text: 'Записаться', width: 288, height: 45, radius: 4),
                                  ],

                                ),
                              )
                          ),
                          SizedBox(height: 80,),
                          if(title! != 'Доступ к базе знаний центра')
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 858,
                              color: Color(0xffCAE6FF),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 18,),
                                  Center(
                                    child: Container(
                                      width: 288,
                                      child: SelectableText('Почему Вы пройдёте этот курс до конца', style: GoogleFonts.manrope(
                                          textStyle: TextStyle(
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 20.0,
                                            height: 1.6, // line-height in Flutter
                                            color: Color(0xFF414E61),
                                          )
                                      ),),
                                    ),
                                  ),
                                  SizedBox(height: 20,),
                                  Center(
                                    child: Container(
                                      width: 288,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 288,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: 212,
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                        width: 173,
                                                        decoration: BoxDecoration(
                                                            border: Border(
                                                              top: BorderSide(
                                                                color: Color(0xffB4D0E9),
                                                                width: 2.0,
                                                              ),
                                                            )
                                                        ),
                                                        child: Padding(
                                                          padding: EdgeInsets.only(top: 8),
                                                          child: Text('01', style: GoogleFonts.manrope(
                                                              textStyle: TextStyle(
                                                                fontStyle: FontStyle.normal,
                                                                fontWeight: FontWeight.w500,
                                                                fontSize: 18.0,
                                                                height: 1.6,
                                                                color: Color(0xFF646D81),
                                                              )
                                                          ),),
                                                        ),
                                                      ),

                                                      SizedBox(height: 8,),
                                                      Text('Контроль и оценка', style: GoogleFonts.manrope(
                                                          textStyle: TextStyle(
                                                            fontStyle: FontStyle.normal,
                                                            fontWeight: FontWeight.w500,
                                                            fontSize: 18.0,
                                                            height: 1.6,
                                                            color: Color(0xFF646D81),
                                                          )
                                                      ),)
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(height: 32,),
                                                Container(
                                                  width: 288,
                                                  decoration: BoxDecoration(
                                                      border: Border(
                                                        top: BorderSide(
                                                          color: Color(0xffB4D0E9),
                                                          width: 2.0,
                                                        ),
                                                      )
                                                  ),
                                                  child: Padding(
                                                      padding: EdgeInsets.only(top: 8),
                                                      child: Text('Преподаватель контролирует выполнение заданий студентом, проверяет его понимание и знание материала, оценивает результаты обучения и корректирует программу обучения при необходимости.',
                                                        style: GoogleFonts.manrope(
                                                            textStyle: TextStyle(
                                                              fontStyle: FontStyle.normal,
                                                              fontWeight: FontWeight.w300,
                                                              fontSize: 14.0,
                                                              height: 1.6,
                                                              color: Color(0xFF6F788C),
                                                            )
                                                        ),)
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 36,),
                                          Container(
                                            width: 288,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: 212,

                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                        width: 173,
                                                        decoration: BoxDecoration(
                                                            border: Border(
                                                              top: BorderSide(
                                                                color: Color(0xffB4D0E9),
                                                                width: 2.0,
                                                              ),
                                                            )
                                                        ),
                                                        child: Padding(
                                                          padding: EdgeInsets.only(top: 8),
                                                          child: Text('02', style: GoogleFonts.manrope(
                                                              textStyle: TextStyle(
                                                                fontStyle: FontStyle.normal,
                                                                fontWeight: FontWeight.w500,
                                                                fontSize: 18.0,
                                                                height: 1.6,
                                                                color: Color(0xFF646D81),
                                                              )
                                                          ),),
                                                        ),
                                                      ),


                                                      SizedBox(height: 8,),
                                                      Text('Поддержка и мотивация', style: GoogleFonts.manrope(
                                                          textStyle: TextStyle(
                                                            fontStyle: FontStyle.normal,
                                                            fontWeight: FontWeight.w500,
                                                            fontSize: 18.0,
                                                            height: 1.6,
                                                            color: Color(0xFF646D81),
                                                          )
                                                      ),)
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(height: 32,),
                                                Container(
                                                  width: 288,
                                                  decoration: BoxDecoration(
                                                      border: Border(
                                                        top: BorderSide(
                                                          color: Color(0xffB4D0E9),
                                                          width: 2.0,
                                                        ),
                                                      )
                                                  ),
                                                  child: Padding(
                                                      padding: EdgeInsets.only(top: 8),
                                                      child: Text('Преподаватель поддерживает студента на протяжении всего процесса обучения, мотивирует его на достижение целей и помогает преодолевать трудности.',
                                                        style: GoogleFonts.manrope(
                                                            textStyle: TextStyle(
                                                              fontStyle: FontStyle.normal,
                                                              fontWeight: FontWeight.w300,
                                                              fontSize: 14.0,
                                                              height: 1.6,
                                                              color: Color(0xFF6F788C),
                                                            )
                                                        ),)
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 36,),
                                          Container(
                                            width: 288,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: 212,

                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                        width: 173,
                                                        decoration: BoxDecoration(
                                                            border: Border(
                                                              top: BorderSide(
                                                                color: Color(0xffB4D0E9),
                                                                width: 2.0,
                                                              ),
                                                            )
                                                        ),
                                                        child: Padding(
                                                          padding: EdgeInsets.only(top: 8),
                                                          child: Text('03', style: GoogleFonts.manrope(
                                                              textStyle: TextStyle(
                                                                fontStyle: FontStyle.normal,
                                                                fontWeight: FontWeight.w500,
                                                                fontSize: 18.0,
                                                                height: 1.6,
                                                                color: Color(0xFF646D81),
                                                              )
                                                          ),),
                                                        ),
                                                      ),


                                                      SizedBox(height: 8,),
                                                      Text('Итоговое тестирование', style: GoogleFonts.manrope(
                                                          textStyle: TextStyle(
                                                            fontStyle: FontStyle.normal,
                                                            fontWeight: FontWeight.w500,
                                                            fontSize: 18.0,
                                                            height: 1.6,
                                                            color: Color(0xFF646D81),
                                                          )
                                                      ),)
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(height: 32,),
                                                Container(
                                                  width: 288,
                                                  decoration: BoxDecoration(
                                                      border: Border(
                                                        top: BorderSide(
                                                          color: Color(0xffB4D0E9),
                                                          width: 2.0,
                                                        ),
                                                      )
                                                  ),
                                                  child: Padding(
                                                      padding: EdgeInsets.only(top: 8),
                                                      child: Text('В конце года проводится тестирование, которое проверяет знания и умения учеников. Результаты тестирования позволяют оценить успехи студента и подготовить план дальнейшего обучения.',
                                                        style: GoogleFonts.manrope(
                                                            textStyle: TextStyle(
                                                              fontStyle: FontStyle.normal,
                                                              fontWeight: FontWeight.w300,
                                                              fontSize: 14.0,
                                                              height: 1.6,
                                                              color: Color(0xFF6F788C),
                                                            )
                                                        ),)
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )

                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          if(title! != 'Доступ к базе знаний центра')
                            Center(
                              child: Container(
                                width: 288,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 40,),
                                    SelectableText('Процесс обучения', style: GoogleFonts.manrope(
                                        textStyle: TextStyle(
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 24.0,
                                          height: 1.6, // line-height in Flutter
                                          color: Color(0xFF414E61),
                                        )
                                    ),),
                                    SizedBox(height: 32,),
                                    SizedBox(
                                      width: 1200,
                                      child: ProcessScreen(header: 'Оценка уровня знаний', content: 'Перед началом обучения студенту необходимо пройти тестирование, чтобы определить его текущий уровень владения языком.',
                                        imgSize: 20, img: 'assets/brain3.png', first: true,

                                      ),
                                    ),
                                    SizedBox(
                                      width: 1200,
                                      child: ProcessScreen(header: 'Установление целей', content: 'На основе результатов тестирования и консультации'
                                          'с преподавателем студент определяет свои цели'
                                          'и приоритеты в обучении.',
                                        imgSize: 20, img: 'assets/aim.svg',

                                      ),
                                    ),
                                    if(title!.contains('Индивидуальное'))
                                      SizedBox(
                                        width: 1200,
                                        child: ProcessScreen(header: 'Разработка индивидуальной программы обучения', content: 'На основе целей и уровня знаний студента преподаватель разрабатывает индивидуальную программу обучения, которая включает в себя задания для самостоятельной работы, аудио и видео материалы, грамматические упражнения, упражнения на понимание и произношение иноязычной речи.',
                                          imgSize: 20, img: 'assets/program.svg',

                                        ),
                                      ),
                                    SizedBox(
                                      width: 1200,
                                      child: ProcessScreen(header: 'Занятия с преподавателем', content: 'На занятиях студент углубляет свои знания, повышает свой уровень владения языком, работает над ошибками, учится общаться на иностранном языке в различных ситуациях.',
                                        imgSize: 20, img: 'assets/teacher.svg',

                                      ),
                                    ),
                                    SizedBox(
                                      width: 1200,
                                      child: ProcessScreen(header: 'Регулярная самостоятельная работа', content: 'Помимо занятий с преподавателем, студент самостоятельно выполняет задания из программы обучения, прослушивает аудио и видео материалы, читает тексты на иностранном языке и выполняет упражнения.',
                                        imgSize: 20, img: 'assets/homework.svg', last: true,

                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ),
                          SizedBox(height: 130,),
                          QuestionsScreen(),
                          Footer()
                        ],
                      ),
                    );
                  }else{
                    return Scaffold(
                      appBar: myAppBar(),
                      body: ListView(
                        children: [
                          SizedBox(height: 80,),
                          Center(
                            child: Container(
                              width: 1200,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 488,
                                    height: 303,
                                    child: Image.network(img!, fit: BoxFit.cover,),
                                  ),
                                  Spacer(),
                                  Container(
                                    width: 590,
                                    child: Column(
                                      children: [
                                        Container(
                                          width: 590,
                                          child: SelectableText(title!, style: headerTxt(),),
                                        ),
                                        SizedBox(height: 32,),
                                        Container(
                                          width: 590,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                  width: 285,
                                                  height: 47,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFFFDDDD),
                                                    borderRadius: BorderRadius.circular(0),
                                                    border: Border.all(
                                                      width: 0,
                                                      color: Colors.transparent,
                                                    ),
                                                  ),
                                                  child: Center(
                                                    child: Text(type!, style: GoogleFonts.manrope(
                                                        textStyle: TextStyle(
                                                          fontStyle: FontStyle.normal,
                                                          fontWeight: FontWeight.w600,
                                                          fontSize: 18,
                                                          height: 1.6,
                                                          color: Color(0xFFB39191),
                                                        )
                                                    ),),
                                                  )
                                              ),
                                              Container(
                                                  width: 285,
                                                  height: 47,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFFFDDDD),
                                                    borderRadius: BorderRadius.circular(0),
                                                    border: Border.all(
                                                      width: 0,
                                                      color: Colors.transparent,
                                                    ),
                                                  ),
                                                  child: Center(
                                                    child: Text('Уровень ${level!}', style: GoogleFonts.manrope(
                                                        textStyle: TextStyle(
                                                          fontStyle: FontStyle.normal,
                                                          fontWeight: FontWeight.w600,
                                                          fontSize: 18,
                                                          height: 1.6,
                                                          color: Color(0xFFB39191),
                                                        )
                                                    ),),
                                                  )
                                              ),
                                            ],
                                          )
                                        ),
                                        SizedBox(height: 20,),
                                        Container(
                                            width: 590,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Container(
                                                    width: 285,
                                                    height: 47,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFFFDDDD),
                                                      borderRadius: BorderRadius.circular(0),
                                                      border: Border.all(
                                                        width: 0,
                                                        color: Colors.transparent,
                                                      ),
                                                    ),
                                                    child: Center(
                                                      child: Text(price!, style: GoogleFonts.manrope(
                                                          textStyle: TextStyle(
                                                            fontStyle: FontStyle.normal,
                                                            fontWeight: FontWeight.w600,
                                                            fontSize: 18,
                                                            height: 1.6,
                                                            color: Color(0xFFB39191),
                                                          )
                                                      ),),
                                                    )
                                                ),
                                                Container(
                                                    width: 285,
                                                    height: 47,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFFFDDDD),
                                                      borderRadius: BorderRadius.circular(0),
                                                      border: Border.all(
                                                        width: 0,
                                                        color: Colors.transparent,
                                                      ),
                                                    ),
                                                    child: Center(
                                                      child: Text(age!, style: GoogleFonts.manrope(
                                                          textStyle: TextStyle(
                                                            fontStyle: FontStyle.normal,
                                                            fontWeight: FontWeight.w600,
                                                            fontSize: 18,
                                                            height: 1.6,
                                                            color: Color(0xFFB39191),
                                                          )
                                                      ),),
                                                    )
                                                ),
                                              ],
                                            )
                                        ),



                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Center(
                              child: Container(
                                width: 1200,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    SizedBox(height: 48,),
                                    Container(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          if(title! == 'Доступ к базе знаний центра')
                                            button(onClick: (){}, text: 'Получить доступ')
                                          else
                                            button(onClick: (){}, text: 'Записаться'),
                                          Spacer(),
                                          Container(
                                              width: 590,
                                              decoration: BoxDecoration(
                                                border: const Border(
                                                  top: BorderSide(
                                                    color: Color(0xffD4D9DD),
                                                    width: 2.0,
                                                  ),
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.only(top: 16),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    SelectableText('О курсе', style: GoogleFonts.manrope(
                                                        textStyle: TextStyle(
                                                          fontStyle: FontStyle.normal,
                                                          fontWeight: FontWeight.w700,
                                                          fontSize: 24.0,
                                                          height: 1.6, // line-height in Flutter
                                                          color: Color(0xFF414E61),
                                                        )
                                                    ),
                                                    ),
                                                    Spacer(),
                                                    Container(
                                                      width: 387,
                                                      child: SelectableText(description!, style: GoogleFonts.manrope(
                                                          textStyle: TextStyle(
                                                            fontFamily: 'Manrope',
                                                            fontStyle: FontStyle.normal,
                                                            fontWeight: FontWeight.w300,
                                                            fontSize: 20,
                                                            height: 1.6, // line-height as a multiplier of the font size
                                                            color: Color(0xFF646A77),
                                                          )
                                                      ),),
                                                    )
                                                  ],
                                                ),
                                              )
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                          ),
                          SizedBox(height: 80,),
                          if(title! != 'Доступ к базе знаний центра')
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 452,
                            color: Color(0xffCAE6FF),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 40,),
                                Center(
                                  child: Container(
                                    width: 1200,
                                    child: SelectableText('Почему Вы пройдёте этот курс до конца', style: GoogleFonts.manrope(
                                        textStyle: TextStyle(
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 24.0,
                                          height: 1.6, // line-height in Flutter
                                          color: Color(0xFF414E61),
                                        )
                                    ),),
                                  ),
                                ),
                                SizedBox(height: 40,),
                                Center(
                                  child: Container(
                                    width: 1200,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 386,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: 212,

                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      width: 179,
                                                      decoration: BoxDecoration(
                                                          border: Border(
                                                            top: BorderSide(
                                                              color: Color(0xffB4D0E9),
                                                              width: 2.0,
                                                            ),
                                                          )
                                                      ),
                                                      child: Padding(
                                                        padding: EdgeInsets.only(top: 8),
                                                        child: Text('01', style: GoogleFonts.manrope(
                                                            textStyle: TextStyle(
                                                              fontStyle: FontStyle.normal,
                                                              fontWeight: FontWeight.w500,
                                                              fontSize: 18.0,
                                                              height: 1.6,
                                                              color: Color(0xFF646D81),
                                                            )
                                                        ),),
                                                      ),
                                                    ),


                                                    SizedBox(height: 8,),
                                                    Text('Контроль и оценка', style: GoogleFonts.manrope(
                                                        textStyle: TextStyle(
                                                          fontStyle: FontStyle.normal,
                                                          fontWeight: FontWeight.w500,
                                                          fontSize: 18.0,
                                                          height: 1.6,
                                                          color: Color(0xFF646D81),
                                                        )
                                                    ),)
                                                  ],
                                                ),
                                              ),
                                              SizedBox(height: 32,),
                                              Container(
                                                width: 386,
                                                decoration: BoxDecoration(
                                                    border: Border(
                                                      top: BorderSide(
                                                        color: Color(0xffB4D0E9),
                                                        width: 2.0,
                                                      ),
                                                    )
                                                ),
                                                child: Padding(
                                                    padding: EdgeInsets.only(top: 8),
                                                    child: Text('Преподаватель контролирует выполнение заданий студентом, проверяет его понимание и знание материала, оценивает результаты обучения и корректирует программу обучения при необходимости.',
                                                      style: GoogleFonts.manrope(
                                                          textStyle: TextStyle(
                                                            fontStyle: FontStyle.normal,
                                                            fontWeight: FontWeight.w300,
                                                            fontSize: 18.0,
                                                            height: 1.6,
                                                            color: Color(0xFF6F788C),
                                                          )
                                                      ),)
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: 386,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: 212,

                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      width: 179,
                                                      decoration: BoxDecoration(
                                                          border: Border(
                                                            top: BorderSide(
                                                              color: Color(0xffB4D0E9),
                                                              width: 2.0,
                                                            ),
                                                          )
                                                      ),
                                                      child: Padding(
                                                        padding: EdgeInsets.only(top: 8),
                                                        child: Text('02', style: GoogleFonts.manrope(
                                                            textStyle: TextStyle(
                                                              fontStyle: FontStyle.normal,
                                                              fontWeight: FontWeight.w500,
                                                              fontSize: 18.0,
                                                              height: 1.6,
                                                              color: Color(0xFF646D81),
                                                            )
                                                        ),),
                                                      ),
                                                    ),


                                                    SizedBox(height: 8,),
                                                    Text('Поддержка и мотивация', style: GoogleFonts.manrope(
                                                        textStyle: TextStyle(
                                                          fontStyle: FontStyle.normal,
                                                          fontWeight: FontWeight.w500,
                                                          fontSize: 18.0,
                                                          height: 1.6,
                                                          color: Color(0xFF646D81),
                                                        )
                                                    ),)
                                                  ],
                                                ),
                                              ),
                                              SizedBox(height: 32,),
                                              Container(
                                                width: 386,
                                                decoration: BoxDecoration(
                                                    border: Border(
                                                      top: BorderSide(
                                                        color: Color(0xffB4D0E9),
                                                        width: 2.0,
                                                      ),
                                                    )
                                                ),
                                                child: Padding(
                                                    padding: EdgeInsets.only(top: 8),
                                                    child: Text('Преподаватель поддерживает студента на протяжении всего процесса обучения, мотивирует его на достижение целей и помогает преодолевать трудности.',
                                                      style: GoogleFonts.manrope(
                                                          textStyle: TextStyle(
                                                            fontStyle: FontStyle.normal,
                                                            fontWeight: FontWeight.w300,
                                                            fontSize: 18.0,
                                                            height: 1.6,
                                                            color: Color(0xFF6F788C),
                                                          )
                                                      ),)
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: 386,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: 212,

                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      width: 179,
                                                      decoration: BoxDecoration(
                                                          border: Border(
                                                            top: BorderSide(
                                                              color: Color(0xffB4D0E9),
                                                              width: 2.0,
                                                            ),
                                                          )
                                                      ),
                                                      child: Padding(
                                                        padding: EdgeInsets.only(top: 8),
                                                        child: Text('03', style: GoogleFonts.manrope(
                                                            textStyle: TextStyle(
                                                              fontStyle: FontStyle.normal,
                                                              fontWeight: FontWeight.w500,
                                                              fontSize: 18.0,
                                                              height: 1.6,
                                                              color: Color(0xFF646D81),
                                                            )
                                                        ),),
                                                      ),
                                                    ),


                                                    SizedBox(height: 8,),
                                                    Text('Итоговое тестирование', style: GoogleFonts.manrope(
                                                        textStyle: TextStyle(
                                                          fontStyle: FontStyle.normal,
                                                          fontWeight: FontWeight.w500,
                                                          fontSize: 18.0,
                                                          height: 1.6,
                                                          color: Color(0xFF646D81),
                                                        )
                                                    ),)
                                                  ],
                                                ),
                                              ),
                                              SizedBox(height: 32,),
                                              Container(
                                                width: 386,
                                                decoration: BoxDecoration(
                                                    border: Border(
                                                      top: BorderSide(
                                                        color: Color(0xffB4D0E9),
                                                        width: 2.0,
                                                      ),
                                                    )
                                                ),
                                                child: Padding(
                                                    padding: EdgeInsets.only(top: 8),
                                                    child: Text('В конце года проводится тестирование, которое проверяет знания и умения учеников. Результаты тестирования позволяют оценить успехи студента и подготовить план дальнейшего обучения.',
                                                      style: GoogleFonts.manrope(
                                                          textStyle: TextStyle(
                                                            fontStyle: FontStyle.normal,
                                                            fontWeight: FontWeight.w300,
                                                            fontSize: 18.0,
                                                            height: 1.6,
                                                            color: Color(0xFF6F788C),
                                                          )
                                                      ),)
                                                ),
                                              ),
                                            ],
                                          ),
                                        )

                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          if(title! != 'Доступ к базе знаний центра')
                          Center(
                            child: Container(
                              width: 1200,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 40,),
                                  SelectableText('Процесс обучения', style: GoogleFonts.manrope(
                                      textStyle: TextStyle(
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 24.0,
                                        height: 1.6, // line-height in Flutter
                                        color: Color(0xFF414E61),
                                      )
                                  ),),
                                  SizedBox(height: 32,),
                                  SizedBox(
                                    width: 1200,
                                    child: ProcessScreen(header: 'Оценка уровня знаний', content: 'Перед началом обучения студенту необходимо пройти тестирование, чтобы определить его текущий уровень владения языком.',
                                      imgSize: 44, img: 'assets/brain3.png', first: true,

                                    ),
                                  ),
                                  SizedBox(
                                    width: 1200,
                                    child: ProcessScreen(header: 'Установление целей', content: 'На основе результатов тестирования и консультации'
                                        'с преподавателем студент определяет свои цели'
                                        'и приоритеты в обучении.',
                                      imgSize: 49, img: 'assets/aim.svg',

                                    ),
                                  ),
                                  if(title!.contains('Индивидуальное'))
                                  SizedBox(
                                    width: 1200,
                                    child: ProcessScreen(header: 'Разработка индивидуальной программы обучения', content: 'На основе целей и уровня знаний студента преподаватель разрабатывает индивидуальную программу обучения, которая включает в себя задания для самостоятельной работы, аудио и видео материалы, грамматические упражнения, упражнения на понимание и произношение иноязычной речи.',
                                      imgSize: 39, img: 'assets/program.svg',

                                    ),
                                  ),
                                  SizedBox(
                                    width: 1200,
                                    child: ProcessScreen(header: 'Занятия с преподавателем', content: 'На занятиях студент углубляет свои знания, повышает свой уровень владения языком, работает над ошибками, учится общаться на иностранном языке в различных ситуациях.',
                                      imgSize: 42, img: 'assets/teacher.svg',

                                    ),
                                  ),
                                  SizedBox(
                                    width: 1200,
                                    child: ProcessScreen(header: 'Регулярная самостоятельная работа', content: 'Помимо занятий с преподавателем, студент самостоятельно выполняет задания из программы обучения, прослушивает аудио и видео материалы, читает тексты на иностранном языке и выполняет упражнения.',
                                      imgSize: 52, img: 'assets/homework.svg', last: true,

                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 130,),
                          QuestionsScreen(),
                          Footer()
                        ],
                      ),
                    );
                  }
                }
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