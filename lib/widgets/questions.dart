


import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import '../styles/styles.dart';
import 'package:http/http.dart' as http;
class QuestionsScreen extends StatefulWidget {

  const QuestionsScreen({Key? key}) : super(key: key);

  @override
  _QuestionsScreenState createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  String username = 'mrrino597@gmail.com';
  String password = 'iggisis.ru1222';
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Future sendEmail() async {
    if(formKey.currentState!.validate()){
      final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json'
        },
        body: json.encode({
          'service_id': 'service_4ysphbs',
          'template_id': 'template_uvllu3f',
          'user_id': 'o-RaYIwKmhVDdx-sG',
          'template_params': {
            'from_name': nameController.text,
            'from_phone': phoneController.text,
          }
        }),
      );
    }
  }
  @override
  void initState() {
    super.initState();
  }
  var phoneController = MaskedTextController(mask: '+7(000) 000-0000');
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(
        builder: (context, screen){
          if (screen.maxWidth < 1200 && screen.maxWidth > 601){
            return Container(
                width: double.infinity,
                height: 324,
                color: const Color(0xFFEFF8FF),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      SizedBox(height: 46,),
                      Center(
                        child: Container(
                          width: 727,
                          child: SelectableText('Остались вопросы?', style: headerTxt(size: 36),),
                        ),
                      ),
                      SizedBox(height: 46,),
                      Center(
                        child: Container(
                          width: 727,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 235,
                                height: 45,
                                child: Center(
                                  child: TextFormField(
                                    controller: nameController,
                                    validator: (string){
                                      if (string!.isEmpty) return 'Поле не может быть пустым';

                                    },
                                    style: blockTxt(size: 16),
                                    textAlignVertical: TextAlignVertical.center,
                                    decoration: InputDecoration(
                                      hintText: 'Ваше имя',
                                      hintStyle: GoogleFonts.manrope(
                                          textStyle: TextStyle(
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16,
                                            height: 1.3,
                                            color: Color(0xFFA6A6A6),
                                          )
                                      ),

                                      filled: true,
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8.0),
                                        borderSide: BorderSide(
                                          color: Color(0xFFC4C4C4),
                                          width: 1.0,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8.0),
                                        borderSide: BorderSide(
                                          color: Color(0xFFC4C4C4),
                                          width: 1.0,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8.0),
                                        borderSide: BorderSide(
                                          color: Color(0xFFC4C4C4),
                                          width: 1.0,
                                        ),
                                      ),
                                      hoverColor: Colors.transparent,
                                    ),
                                  ),
                                ),
                              ),
                              Spacer(),
                              Container(
                                width: 235,
                                height: 45,
                                child: Center(
                                  child: TextFormField(
                                    controller: phoneController,
                                    validator: (string){
                                      if (string!.isEmpty) return 'Поле не может быть пустым';

                                    },
                                    style: blockTxt(size: 16),
                                    textAlignVertical: TextAlignVertical.center,
                                    decoration: InputDecoration(
                                      hintText: 'Номер телефона',
                                      hintStyle: GoogleFonts.manrope(
                                          textStyle: TextStyle(
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16,
                                            height: 1.3,
                                            color: Color(0xFFA6A6A6),
                                          )
                                      ),

                                      filled: true,
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8.0),
                                        borderSide: BorderSide(
                                          color: Color(0xFFC4C4C4),
                                          width: 1.0,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8.0),
                                        borderSide: BorderSide(
                                          color: Color(0xFFC4C4C4),
                                          width: 1.0,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8.0),
                                        borderSide: BorderSide(
                                          color: Color(0xFFC4C4C4),
                                          width: 1.0,
                                        ),
                                      ),
                                      hoverColor: Colors.transparent,
                                    ),
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Column(
                                children: [
                                  button(onClick: (){}, text: 'Отправить заявку', height: 45, width: 173, size: 14),
                                  const SizedBox(height: 16,),
                                  SizedBox(
                                    width: 173,
                                    child: Text('Нажимая на кнопку, Вы соглашаетесь политикой обработки персональных данных',
                                      style: GoogleFonts.manrope(
                                          textStyle: const TextStyle(
                                            color: Color(0xFFA6A6A6),
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            height: 1.6,
                                          )
                                      ),
                                    ),
                                  )
                                ],
                              )

                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                )
            );
          }else if (screen.minWidth <= 600){
            return Container(
                width: double.infinity,
                height: 515,
                color: const Color(0xFFEFF8FF),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      SizedBox(height: 46,),
                      Center(
                        child: Container(
                          width: 288,
                          child: SelectableText('Остались вопросы?', style: headerTxt(size: 36),),
                        ),
                      ),
                      SizedBox(height: 46,),
                      Center(
                        child: Container(
                          width: 288,
                          height: 300,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 288,
                                height: 45,
                                child: Center(
                                  child: TextFormField(
                                    controller: nameController,
                                    validator: (string){
                                      if (string!.isEmpty) return 'Поле не может быть пустым';

                                    },
                                    style: blockTxt(size: 16),
                                    textAlignVertical: TextAlignVertical.center,
                                    decoration: InputDecoration(
                                      hintText: 'Ваше имя',
                                      hintStyle: GoogleFonts.manrope(
                                          textStyle: TextStyle(
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16,
                                            height: 1.3,
                                            color: Color(0xFFA6A6A6),
                                          )
                                      ),

                                      filled: true,
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8.0),
                                        borderSide: BorderSide(
                                          color: Color(0xFFC4C4C4),
                                          width: 1.0,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8.0),
                                        borderSide: BorderSide(
                                          color: Color(0xFFC4C4C4),
                                          width: 1.0,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8.0),
                                        borderSide: BorderSide(
                                          color: Color(0xFFC4C4C4),
                                          width: 1.0,
                                        ),
                                      ),
                                      hoverColor: Colors.transparent,
                                    ),
                                  ),
                                ),
                              ),
                              Spacer(),
                              Container(
                                width: 288,
                                height: 45,
                                child: Center(
                                  child: TextFormField(
                                    controller: phoneController,
                                    validator: (string){
                                      if (string!.isEmpty) return 'Поле не может быть пустым';

                                    },
                                    style: blockTxt(size: 16),
                                    textAlignVertical: TextAlignVertical.center,
                                    decoration: InputDecoration(
                                      hintText: 'Номер телефона',
                                      hintStyle: GoogleFonts.manrope(
                                          textStyle: TextStyle(
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16,
                                            height: 1.3,
                                            color: Color(0xFFA6A6A6),
                                          )
                                      ),

                                      filled: true,
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8.0),
                                        borderSide: BorderSide(
                                          color: Color(0xFFC4C4C4),
                                          width: 1.0,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8.0),
                                        borderSide: BorderSide(
                                          color: Color(0xFFC4C4C4),
                                          width: 1.0,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8.0),
                                        borderSide: BorderSide(
                                          color: Color(0xFFC4C4C4),
                                          width: 1.0,
                                        ),
                                      ),
                                      hoverColor: Colors.transparent,
                                    ),
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  button(onClick: (){}, text: 'Отправить заявку', height: 45, width: 288, size: 14),
                                  const SizedBox(height: 16,),
                                  SizedBox(
                                    width: 213,
                                    child: Text('Нажимая на кнопку, Вы соглашаетесь политикой обработки персональных данных',
                                      style: GoogleFonts.manrope(
                                          textStyle: const TextStyle(
                                            color: Color(0xFFA6A6A6),
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            height: 1.6,
                                          )
                                      ),
                                    ),
                                  )
                                ],
                              )

                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                )
            );
          }else{
            return Container(
                width: double.infinity,
                height: 482,
                color: const Color(0xFFEFF8FF),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      SizedBox(height: 80,),
                      Center(
                        child: Container(
                          width: 1200,
                          child: SelectableText('Остались вопросы?', style: headerTxt(),),
                        ),
                      ),
                      SizedBox(height: 130,),
                      Center(
                        child: Container(
                          width: 1200,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 387,
                                height: 63,
                                child: Center(
                                  child: TextFormField(
                                    controller: nameController,
                                    validator: (string){
                                      if (string!.isEmpty) return 'Поле не может быть пустым';

                                    },
                                    style: blockTxt(),
                                    textAlignVertical: TextAlignVertical.center,
                                    decoration: InputDecoration(
                                      hintText: 'Ваше имя',
                                      hintStyle: GoogleFonts.manrope(
                                          textStyle: TextStyle(
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 20,
                                            height: 1.6,
                                            color: Color(0xFFA6A6A6),
                                          )
                                      ),

                                      filled: true,
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8.0),
                                        borderSide: BorderSide(
                                          color: Color(0xFFC4C4C4),
                                          width: 1.0,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8.0),
                                        borderSide: BorderSide(
                                          color: Color(0xFFC4C4C4),
                                          width: 1.0,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8.0),
                                        borderSide: BorderSide(
                                          color: Color(0xFFC4C4C4),
                                          width: 1.0,
                                        ),
                                      ),
                                      hoverColor: Colors.transparent,
                                    ),
                                  ),
                                ),
                              ),
                              Spacer(),
                              Container(
                                width: 387,
                                height: 63,
                                child: Center(
                                  child: TextFormField(
                                    controller: phoneController,
                                    validator: (string){
                                      if (string!.isEmpty) return 'Поле не может быть пустым';

                                    },
                                    style: blockTxt(),
                                    textAlignVertical: TextAlignVertical.center,
                                    decoration: InputDecoration(
                                      hintText: 'Номер телефона',
                                      hintStyle: GoogleFonts.manrope(
                                          textStyle: TextStyle(
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 20,
                                            height: 1.6,
                                            color: Color(0xFFA6A6A6),
                                          )
                                      ),

                                      filled: true,
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8.0),
                                        borderSide: BorderSide(
                                          color: Color(0xFFC4C4C4),
                                          width: 1.0,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8.0),
                                        borderSide: BorderSide(
                                          color: Color(0xFFC4C4C4),
                                          width: 1.0,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8.0),
                                        borderSide: BorderSide(
                                          color: Color(0xFFC4C4C4),
                                          width: 1.0,
                                        ),
                                      ),
                                      hoverColor: Colors.transparent,
                                    ),
                                  ),
                                ),
                              ),
                              Spacer(),
                              Column(
                                children: [
                                  button(onClick: (){sendEmail();}, text: 'Отправить заявку', height: 63),
                                  SizedBox(height: 20,),
                                  Container(
                                    width: 285,
                                    child: Text('Нажимая на кнопку, Вы соглашаетесь политикой обработки персональных данных',
                                      style: GoogleFonts.manrope(
                                          textStyle: TextStyle(
                                            color: Color(0xFFA6A6A6),
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16,
                                            height: 1.6,
                                          )
                                      ),
                                    ),
                                  )
                                ],
                              )

                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                )
            );
          }
        }
    );
  }
}