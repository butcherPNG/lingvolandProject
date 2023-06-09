


import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:linguasphere/classes/Authent.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../styles/styles.dart';
import '../widgets/image_slider.dart';
import '../widgets/onHoverWidget.dart';

class SignUp extends StatefulWidget {



  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isLoading = false;
  register(String email, String password, String username, String imageUrl,) async {
      if(formKey.currentState!.validate() == true){
        setState(() {
          isLoading = true;
        });

        try{
          await Authent().createUserWithEmailAndPassword(
              email,
              password,
              username,
              imageUrl
          ).then((value) async {
            FirebaseAuth.instance.signInWithCredential(EmailAuthProvider.credential(
              email: email.trim(),
              password: password.trim(),
            ));
            setState(() {
              isLoading = false;
            });
            context.goNamed('home');
          });
        } on FirebaseException catch (e) {
          setState(() {
            isLoading = false;
          });
          if (e.code == 'weak-password'){
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(
              content: Text('Пароль слишком простой'),
            ));
          }else if (e.code == 'email-already-in-use'){
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(
              content: Text('Такой E-mail уже используется!'),
            ));
          }
        }
      }else{
        setState(() {

        });
      }
  }

  String? emailError;
  String? nameError;
  String? passwordError;
  int sliderIndex = 0;


  @override
  Widget build(BuildContext context) {
    List<Widget> itemList = [
      ImgSlider(
        width: (MediaQuery.of(context).size.width - 644) - ((MediaQuery.of(context).size.width - 1200) / 2) - 64,
        height: MediaQuery.of(context).size.height,
        img: 'assets/slider1.png',
        text: 'Не можешь выучить английский самостоятельно? - тогда тебе к нам',
        container: 474,
      ),
      ImgSlider(
        width: (MediaQuery.of(context).size.width - 644) - ((MediaQuery.of(context).size.width - 1200) / 2) - 64,
        height: MediaQuery.of(context).size.height,
        img: 'assets/slider3.png',
        text: 'Занятия для детей и взрослых, групповые и индивидуальные - подойдут всем',
        container: 498,
      ),
      ImgSlider(
        width: (MediaQuery.of(context).size.width - 644) - ((MediaQuery.of(context).size.width - 1200) / 2) - 64,
        height: MediaQuery.of(context).size.height,
        img: 'assets/slider2.png',
        text: 'Можно обучаться в любом режиме, онлайн или очно - как будет удобно',
        container: 498,
      ),
      ImgSlider(
        width: (MediaQuery.of(context).size.width - 644) - ((MediaQuery.of(context).size.width - 1200) / 2) - 64,
        height: MediaQuery.of(context).size.height,
        img: 'assets/slider4.png',
        text: 'В конце обучения каждый ученик  проходит внутренний экзамен - и получает сертификат',
        container: 528,
      ),
    ];
    return LayoutBuilder(
        builder: (context, screen){
          if(screen.maxWidth < 1200 && screen.maxWidth > 601){
            return Scaffold(
                body: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height,
                  child: Center(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 644,
                          height: 720,
                          child: Image.asset('assets/SignUpPic.png', fit: BoxFit.contain,),
                        ),
                        Container(
                          width: 386,
                          height: 592,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFFFFF),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFF000000).withOpacity(0.15),
                                blurRadius: 16.0,
                                offset: Offset(6.0, 6.0),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Form(
                            key: formKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    SizedBox(height: 32,),
                                    Center(
                                      child: Container(
                                        width: 319,
                                        child: Text('Добро пожаловать в LingvoLand —',
                                          style: GoogleFonts.manrope(
                                              textStyle: TextStyle(
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w800,
                                                fontSize: 32,
                                                height: 1.4,
                                                color: const Color(0xFF060C1D),
                                              )
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 32,),
                                    Container(
                                      width: 310,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          TextFormField(
                                            controller: _nameController,
                                            validator: (v){
                                              if (v!.isEmpty){
                                                return 'Введите Ваше имя';
                                              }
                                            },
                                            style: blockTxt(),
                                            textAlignVertical: TextAlignVertical.center,
                                            decoration: InputDecoration(
                                              hintText: 'Имя',
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
                                          SizedBox(height: 16,),
                                          TextFormField(
                                            controller: _emailController,
                                            validator: (string){
                                              final RegExp emailRegex = RegExp(
                                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"
                                              );
                                              if (string!.isEmpty) return 'Введите E-mail';
                                              if (emailRegex.hasMatch(string) == false){
                                                return 'Введите корректный E-mail';
                                              }
                                            },
                                            style: blockTxt(),
                                            textAlignVertical: TextAlignVertical.center,
                                            decoration: InputDecoration(
                                              hintText: 'E-mail',
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
                                          SizedBox(height: 16,),
                                          TextFormField(
                                            controller: _passwordController,
                                            validator: (v){
                                              if (v!.isEmpty){
                                                return 'Введите пароль';
                                              }
                                              if (v.length < 6){
                                                return 'Мин. длина пароль 6 символов';
                                              }
                                            },
                                            obscureText: true,
                                            style: blockTxt(),
                                            textAlignVertical: TextAlignVertical.center,
                                            decoration: InputDecoration(
                                              hintText: 'Пароль',
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
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    isLoading == true ? Center(child: CircularProgressIndicator(),) :
                                    button(onClick: (){
                                      register(_emailController.text.trim(), _passwordController.text.trim(), _nameController.text.trim(), '',);
                                    }, text: 'Зарегистрироваться', width: 310, height: 48),
                                    SizedBox(height: 16,),
                                    InkWell(
                                      onTap: (){
                                        context.goNamed('signin');
                                      },
                                      child: OnHoverWidget(
                                        builder: (bool isHovered) {
                                          return Column(
                                            children: [
                                              Text('Уже есть аккаунт', style: navTxt(color: isHovered? Color(0xFF828282) : Color(0xffC3C3C3), fontSize: 14, weight: FontWeight.w600),),
                                              SizedBox(height: 2,),
                                              Container(
                                                width: 118,
                                                height: 1,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    width: 1,
                                                    color: Color(0xFFC3C3C3),
                                                  ),
                                                ),
                                              )
                                            ],
                                          );
                                        },
                                      ),
                                    ),
                                    SizedBox(height: 32,),
                                  ],
                                )

                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
            );
          }else if(screen.minWidth <= 600){
            return Scaffold(
                body: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height,
                  child: Center(
                    child: Container(
                      width: 288,
                      height: 487,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFFFFF),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF000000).withOpacity(0.15),
                            blurRadius: 16.0,
                            offset: Offset(6.0, 6.0),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Form(
                        key: formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                SizedBox(height: 16,),
                                Center(
                                  child: Container(
                                    width: 238,
                                    child: Text('Добро пожаловать в LingvoLand —',
                                      style: GoogleFonts.manrope(
                                          textStyle: TextStyle(
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w800,
                                            fontSize: 20,
                                            height: 1.4,
                                            color: const Color(0xFF060C1D),
                                          )
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 16,),
                                Container(
                                  width: 238,
                                  child: Column(
                                    children: [
                                      TextFormField(
                                        controller: _nameController,
                                        validator: (v){
                                          if (v!.isEmpty){
                                            return 'Введите Ваше имя';
                                          }
                                        },
                                        style: blockTxt(),
                                        textAlignVertical: TextAlignVertical.center,
                                        decoration: InputDecoration(
                                          hintText: 'Имя',
                                          hintStyle: GoogleFonts.manrope(
                                              textStyle: TextStyle(
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 16,
                                                height: 1.7,
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
                                      SizedBox(height: 16,),
                                      TextFormField(
                                        controller: _emailController,
                                        validator: (string){
                                          final RegExp emailRegex = RegExp(
                                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"
                                          );
                                          if (string!.isEmpty) return 'Введите E-mail';
                                          if (emailRegex.hasMatch(string) == false){
                                            return 'Введите корректный E-mail';
                                          }
                                        },
                                        style: blockTxt(),
                                        textAlignVertical: TextAlignVertical.center,
                                        decoration: InputDecoration(
                                          hintText: 'E-mail',
                                          hintStyle: GoogleFonts.manrope(
                                              textStyle: TextStyle(
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 16,
                                                height: 1.7,
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
                                      SizedBox(height: 16,),
                                      TextFormField(
                                        controller: _passwordController,
                                        validator: (v){
                                          if (v!.isEmpty){
                                            return 'Введите пароль';
                                          }
                                          if (v.length < 6){
                                            return 'Мин. длина пароль 6 символов';
                                          }
                                        },
                                        obscureText: true,
                                        style: blockTxt(),
                                        textAlignVertical: TextAlignVertical.center,
                                        decoration: InputDecoration(
                                          hintText: 'Пароль',
                                          hintStyle: GoogleFonts.manrope(
                                              textStyle: TextStyle(
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 16,
                                                height: 1.7,
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
                                    ],
                                  ),
                                ),
                              ],
                            ),

                            Column(
                              children: [
                                isLoading == true ? Center(child: CircularProgressIndicator(),) :
                                button(onClick: (){
                                  register(_emailController.text.trim(), _passwordController.text.trim(), _nameController.text.trim(), '',);
                                }, text: 'Зарегистрироваться', width: 238, height: 45, radius: 4),
                                SizedBox(height: 12,),
                                InkWell(
                                  onTap: (){
                                    context.goNamed('signin');
                                  },
                                  child: OnHoverWidget(
                                    builder: (bool isHovered) {
                                      return Column(
                                        children: [
                                          Text('Уже есть аккаунт', style: navTxt(color: isHovered? Color(0xFF828282) : Color(0xffC3C3C3), fontSize: 14, weight: FontWeight.w600),),
                                          SizedBox(height: 2,),
                                          Container(
                                            width: 118,
                                            height: 1,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                width: 1,
                                                color: Color(0xFFC3C3C3),
                                              ),
                                            ),
                                          )
                                        ],
                                      );
                                    },
                                  ),
                                ),
                                SizedBox(height: 16,),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
            );
          }else{
            return Scaffold(
                body: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height,
                  child: Center(
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: (MediaQuery.of(context).size.width - 1200) / 2),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width: 644,
                                height: 720,
                                child: Image.asset('assets/SignUpPic.png', fit: BoxFit.contain,),
                              ),
                              Container(
                                width: 386,
                                height: 592,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFFFFFFF),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(0xFF000000).withOpacity(0.15),
                                      blurRadius: 16.0,
                                      offset: Offset(6.0, 6.0),
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Form(
                                  key: formKey,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          SizedBox(height: 32,),
                                          Center(
                                            child: Container(
                                              width: 319,
                                              child: Text('Добро пожаловать в LingvoLand —',
                                                style: GoogleFonts.manrope(
                                                    textStyle: TextStyle(
                                                      fontStyle: FontStyle.normal,
                                                      fontWeight: FontWeight.w800,
                                                      fontSize: 32,
                                                      height: 1.4,
                                                      color: const Color(0xFF060C1D),
                                                    )
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 32,),
                                          Container(
                                            width: 310,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                TextFormField(
                                                  controller: _nameController,
                                                  validator: (v){
                                                    if (v!.isEmpty){
                                                      return 'Введите Ваше имя';
                                                    }
                                                  },
                                                  style: blockTxt(),
                                                  textAlignVertical: TextAlignVertical.center,
                                                  decoration: InputDecoration(
                                                    hintText: 'Имя',
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
                                                SizedBox(height: 16,),
                                                TextFormField(
                                                  controller: _emailController,
                                                  validator: (string){
                                                    final RegExp emailRegex = RegExp(
                                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"
                                                    );
                                                    if (string!.isEmpty) return 'Введите E-mail';
                                                    if (emailRegex.hasMatch(string) == false){
                                                      return 'Введите корректный E-mail';
                                                    }
                                                  },
                                                  style: blockTxt(),
                                                  textAlignVertical: TextAlignVertical.center,
                                                  decoration: InputDecoration(
                                                    hintText: 'E-mail',
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
                                                SizedBox(height: 16,),
                                                TextFormField(
                                                  controller: _passwordController,
                                                  validator: (v){
                                                    if (v!.isEmpty){
                                                      return 'Введите пароль';
                                                    }
                                                    if (v.length < 6){
                                                      return 'Мин. длина пароль 6 символов';
                                                    }
                                                  },
                                                  obscureText: true,
                                                  style: blockTxt(),
                                                  textAlignVertical: TextAlignVertical.center,
                                                  decoration: InputDecoration(
                                                    hintText: 'Пароль',
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
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          isLoading == true ? Center(child: CircularProgressIndicator(),) :
                                          button(onClick: (){
                                            register(_emailController.text.trim(), _passwordController.text.trim(), _nameController.text.trim(), '',);
                                          }, text: 'Зарегистрироваться', width: 310, height: 48),
                                          SizedBox(height: 16,),
                                          InkWell(
                                            onTap: (){
                                              context.goNamed('signin');
                                            },
                                            child: OnHoverWidget(
                                              builder: (bool isHovered) {
                                                return Column(
                                                  children: [
                                                    Text('Уже есть аккаунт', style: navTxt(color: isHovered? Color(0xFF828282) : Color(0xffC3C3C3), fontSize: 14, weight: FontWeight.w600),),
                                                    SizedBox(height: 2,),
                                                    Container(
                                                      width: 118,
                                                      height: 1,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                          width: 1,
                                                          color: Color(0xFFC3C3C3),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                );
                                              },
                                            ),
                                          ),
                                          SizedBox(height: 32,),
                                        ],
                                      )

                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(100),
                            bottomLeft: Radius.circular(100),
                          ),
                          child: Stack(
                            children: [
                              // Контейнер с каруселью
                              Container(
                                width: (MediaQuery.of(context).size.width - 644) - ((MediaQuery.of(context).size.width - 1200) / 2) - 64,
                                height: MediaQuery.of(context).size.height,
                                child: CarouselSlider.builder(
                                  itemCount: itemList.length,
                                  itemBuilder: (BuildContext context, int index, int realIndex) {
                                    return itemList[index];
                                  },
                                  options: CarouselOptions(
                                    viewportFraction: 1,
                                    autoPlay: true,
                                    pauseAutoPlayOnTouch: true,
                                    onPageChanged: (index, reason) {
                                      setState(() {
                                        sliderIndex = index;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              // Индикатор
                              Positioned(
                                top: MediaQuery.of(context).size.height - 16 - 58, // задайте желаемое вертикальное положение
                                right: (MediaQuery.of(context).size.width - 1200) / 2,
                                child: AnimatedSmoothIndicator(
                                  activeIndex: sliderIndex,
                                  count:  itemList.length,
                                  effect:  WormEffect(
                                    dotWidth: 16,
                                    dotHeight: 16,
                                    dotColor: Colors.white,
                                    spacing: 20,
                                    activeDotColor: Color(0xffFECD81),
                                  ),
                                ),

                              ),
                            ],
                          ),
                        )

                      ],
                    ),
                  ),
                )
            );
          }
        }
    );
  }


}