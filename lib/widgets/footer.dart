



import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:linguasphere/widgets/footer_panel.dart';

import '../styles/styles.dart';
import 'onHoverWidget.dart';

class Footer extends StatefulWidget {

  const Footer({Key? key}) : super(key: key);

  @override
  _FooterState createState() => _FooterState();
}

class _FooterState extends State<Footer> {

  List<Widget> mobileLocation = [
    Row(
      children: [
        SvgPicture.asset('assets/location.svg', width: 13, height: 16,),
        SizedBox(width: 8,),
        SelectableText('160011, г. Вологда, ул. Герцена, д. 56', style: navTxt(color: Colors.white, fontSize: 14, weight: FontWeight.w400),)
      ],
    ),
    Row(
      children: [
        SvgPicture.asset('assets/mail.svg', width: 13, height: 10,),
        SizedBox(width: 8,),
        SelectableText('vologda@lingvoland.ru', style: navTxt(color: Colors.white, fontSize: 14, weight: FontWeight.w400),)
      ],
    ),
    Row(
      children: [
        SvgPicture.asset('assets/phone.svg', width: 16, height: 16,),
        SizedBox(width: 8,),
        SelectableText('+7 (911) 501-3051', style: navTxt(color: Colors.white, fontSize: 14, weight: FontWeight.w400),)
      ],
    )
  ];
  List<Widget> mobileEducation = [
    InkWell(
      onTap: (){

      },
      child: OnHoverWidget(
        builder: (bool isHovered) {
          return Text('Курсы', style: navTxt(color: isHovered? Color(0xFF828282) : Colors.white, fontSize: 14, weight: FontWeight.w400),);
        },
      ),
    ),
    InkWell(
      onTap: (){},
      child: OnHoverWidget(
        builder: (bool isHovered) {
          return Text('Расписание', style: navTxt(color: isHovered? Color(0xFF828282) : Colors.white, fontSize: 14, weight: FontWeight.w400),);
        },
      ),
    ),
    InkWell(
      onTap: (){},
      child: OnHoverWidget(
        builder: (bool isHovered) {
          return Text('Учебники', style: navTxt(color: isHovered? Color(0xFF828282) : Colors.white, fontSize: 14, weight: FontWeight.w400),);
        },
      ),
    ),
  ];
  List<Widget> mobileAbout = [
    InkWell(
      onTap: (){},
      child: OnHoverWidget(
        builder: (bool isHovered) {
          return Text('О центре', style: navTxt(color: isHovered? Color(0xFF828282) : Colors.white, fontSize: 14, weight: FontWeight.w400),);
        },
      ),
    ),
    InkWell(
      onTap: (){},
      child: OnHoverWidget(
        builder: (bool isHovered) {
          return Text('Блог', style: navTxt(color: isHovered? Color(0xFF828282) : Colors.white, fontSize: 14, weight: FontWeight.w400),);
        },
      ),
    ),
    InkWell(
      onTap: (){},
      child: OnHoverWidget(
        builder: (bool isHovered) {
          return Text('Контакты', style: navTxt(color: isHovered? Color(0xFF828282) : Colors.white, fontSize: 14, weight: FontWeight.w400),);
        },
      ),
    ),
  ];
  List<Widget> mobileSocial = [
    Row(
      children: [
        InkWell(
          onTap: (){},
          child: Image.asset('assets/insta.png', width: 35, height: 35,),
        ),
        SizedBox(width: 20,),
        InkWell(
          onTap: (){},
          child: Image.asset('assets/vk.png', width: 35, height: 35,),
        ),
        SizedBox(width: 20,),
        InkWell(
          onTap: (){},
          child: Image.asset('assets/tg.png', width: 35, height: 35,),
        ),
      ],
    ),
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(
        builder: (context, screen){
          if (screen.maxWidth < 1200 && screen.maxWidth > 601){
            return Container(
                width: double.infinity,
                height: 433,
                color: dark,
                child: Center(
                  child: Container(
                    width: 727,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 85,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SelectableText('Контакты', style: navTxt(color: Colors.white, fontSize: 16, weight: FontWeight.w700),),
                                SizedBox(height: 20,),
                                Row(
                                  children: [
                                    SvgPicture.asset('assets/location.svg', width: 13, height: 16,),
                                    SizedBox(width: 8,),
                                    SelectableText('160011, г. Вологда, ул. Герцена, д. 56', style: navTxt(color: Colors.white, fontSize: 14, weight: FontWeight.w400),)
                                  ],
                                ),
                                SizedBox(height: 16,),
                                Row(
                                  children: [
                                    SvgPicture.asset('assets/mail.svg', width: 13, height: 10,),
                                    SizedBox(width: 8,),
                                    SelectableText('vologda@lingvoland.ru', style: navTxt(color: Colors.white, fontSize: 14, weight: FontWeight.w400),)
                                  ],
                                ),
                                SizedBox(height: 16,),
                                Row(
                                  children: [
                                    SvgPicture.asset('assets/phone.svg', width: 16, height: 16,),
                                    SizedBox(width: 8,),
                                    SelectableText('+7 (911) 501-3051', style: navTxt(color: Colors.white, fontSize: 14, weight: FontWeight.w400),)
                                  ],
                                )
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SelectableText('Образование', style: navTxt(color: Colors.white, fontSize: 16, weight: FontWeight.w700),),
                                SizedBox(height: 20,),
                                InkWell(
                                  onTap: (){
                                    AutoRouter.of(context).pushNamed('/courses');
                                  },
                                  child: OnHoverWidget(
                                    builder: (bool isHovered) {
                                      return Text('Курсы', style: navTxt(color: isHovered? Color(0xFF828282) : Colors.white, fontSize: 14, weight: FontWeight.w400),);
                                    },
                                  ),
                                ),
                                SizedBox(height: 16,),
                                InkWell(
                                  onTap: (){},
                                  child: OnHoverWidget(
                                    builder: (bool isHovered) {
                                      return Text('Расписание', style: navTxt(color: isHovered? Color(0xFF828282) : Colors.white, fontSize: 14, weight: FontWeight.w400),);
                                    },
                                  ),
                                ),
                                SizedBox(height: 16,),
                                InkWell(
                                  onTap: (){},
                                  child: OnHoverWidget(
                                    builder: (bool isHovered) {
                                      return Text('Учебники', style: navTxt(color: isHovered? Color(0xFF828282) : Colors.white, fontSize: 14, weight: FontWeight.w400),);
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SelectableText('О нас', style: navTxt(color: Colors.white, fontSize: 16, weight: FontWeight.w700),),
                                SizedBox(height: 20,),
                                InkWell(
                                  onTap: (){},
                                  child: OnHoverWidget(
                                    builder: (bool isHovered) {
                                      return Text('О центре', style: navTxt(color: isHovered? Color(0xFF828282) : Colors.white, fontSize: 14, weight: FontWeight.w400),);
                                    },
                                  ),
                                ),
                                SizedBox(height: 16,),
                                InkWell(
                                  onTap: (){},
                                  child: OnHoverWidget(
                                    builder: (bool isHovered) {
                                      return Text('Блог', style: navTxt(color: isHovered? Color(0xFF828282) : Colors.white, fontSize: 14, weight: FontWeight.w400),);
                                    },
                                  ),
                                ),
                                SizedBox(height: 16,),
                                InkWell(
                                  onTap: (){},
                                  child: OnHoverWidget(
                                    builder: (bool isHovered) {
                                      return Text('Контакты', style: navTxt(color: isHovered? Color(0xFF828282) : Colors.white, fontSize: 14, weight: FontWeight.w400),);
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SelectableText('Социальные сети', style: navTxt(color: Colors.white, fontSize: 16, weight: FontWeight.w700),),
                                SizedBox(height: 20,),
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: (){},
                                      child: Image.asset('assets/insta.png', width: 35, height: 35,),
                                    ),
                                    SizedBox(width: 20,),
                                    InkWell(
                                      onTap: (){},
                                      child: Image.asset('assets/vk.png', width: 35, height: 35,),
                                    ),
                                    SizedBox(width: 20,),
                                    InkWell(
                                      onTap: (){},
                                      child: Image.asset('assets/tg.png', width: 35, height: 35,),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 100),
                        SelectableText('Copyright © 2023 LingvoLand. Все права защищены.', style: navTxt(color: Color(0xff80838C), fontSize: 14, weight: FontWeight.w400),),
                      ],
                    ),
                  ),
                )
            );
          }else if (screen.minWidth <= 600){
            return Container(
                width: double.infinity,

                color: dark,
                child: Center(
                  child: Container(
                    width: 288,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 44,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FooterPanel(header: 'Контакты', content: mobileLocation),
                            SizedBox(height: 16,),
                            FooterPanel(header: 'Образование', content: mobileEducation),
                            SizedBox(height: 16,),
                            FooterPanel(header: 'О нас', content: mobileAbout),
                            SizedBox(height: 16,),
                            FooterPanel(header: 'Социальные сети', content: mobileSocial),

                          ],
                        ),

                        Padding(
                            padding: EdgeInsets.only(top: 100, bottom: 46),
                            child: SelectableText('Copyright © 2023 LingvoLand. Все права защищены.', style: navTxt(color: Color(0xff80838C), fontSize: 14, weight: FontWeight.w400,),),
                        )
                      ],
                    ),
                  ),
                )
            );
          }else{
            return Container(
                width: double.infinity,
                height: 433,
                color: dark,
                child: Center(
                  child: Container(
                    width: 1200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 85,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SelectableText('Контакты', style: navTxt(color: Colors.white, fontSize: 20, weight: FontWeight.w700),),
                                SizedBox(height: 20,),
                                Row(
                                  children: [
                                    SvgPicture.asset('assets/location.svg', width: 16, height: 20,),
                                    SizedBox(width: 16,),
                                    SelectableText('160011, г. Вологда, ул. Герцена, д. 56', style: navTxt(color: Colors.white, fontSize: 16, weight: FontWeight.w400),)
                                  ],
                                ),
                                SizedBox(height: 16,),
                                Row(
                                  children: [
                                    SvgPicture.asset('assets/mail.svg', width: 16, height: 12,),
                                    SizedBox(width: 16,),
                                    SelectableText('vologda@lingvoland.ru', style: navTxt(color: Colors.white, fontSize: 16, weight: FontWeight.w400),)
                                  ],
                                ),
                                SizedBox(height: 16,),
                                Row(
                                  children: [
                                    SvgPicture.asset('assets/phone.svg', width: 16, height: 16,),
                                    SizedBox(width: 16,),
                                    SelectableText('+7 (911) 501-3051', style: navTxt(color: Colors.white, fontSize: 16, weight: FontWeight.w400),)
                                  ],
                                )
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SelectableText('Образование', style: navTxt(color: Colors.white, fontSize: 20, weight: FontWeight.w700),),
                                SizedBox(height: 20,),
                                InkWell(
                                  onTap: (){
                                    AutoRouter.of(context).pushNamed('/courses');
                                  },
                                  child: OnHoverWidget(
                                    builder: (bool isHovered) {
                                      return Text('Курсы', style: navTxt(color: isHovered? Color(0xFF828282) : Colors.white, fontSize: 16, weight: FontWeight.w400),);
                                    },
                                  ),
                                ),
                                SizedBox(height: 16,),
                                InkWell(
                                  onTap: (){},
                                  child: OnHoverWidget(
                                    builder: (bool isHovered) {
                                      return Text('Расписание', style: navTxt(color: isHovered? Color(0xFF828282) : Colors.white, fontSize: 16, weight: FontWeight.w400),);
                                    },
                                  ),
                                ),
                                SizedBox(height: 16,),
                                InkWell(
                                  onTap: (){},
                                  child: OnHoverWidget(
                                    builder: (bool isHovered) {
                                      return Text('Учебники', style: navTxt(color: isHovered? Color(0xFF828282) : Colors.white, fontSize: 16, weight: FontWeight.w400),);
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SelectableText('О нас', style: navTxt(color: Colors.white, fontSize: 20, weight: FontWeight.w700),),
                                SizedBox(height: 20,),
                                InkWell(
                                  onTap: (){},
                                  child: OnHoverWidget(
                                    builder: (bool isHovered) {
                                      return Text('О центре', style: navTxt(color: isHovered? Color(0xFF828282) : Colors.white, fontSize: 16, weight: FontWeight.w400),);
                                    },
                                  ),
                                ),
                                SizedBox(height: 16,),
                                InkWell(
                                  onTap: (){},
                                  child: OnHoverWidget(
                                    builder: (bool isHovered) {
                                      return Text('Блог', style: navTxt(color: isHovered? Color(0xFF828282) : Colors.white, fontSize: 16, weight: FontWeight.w400),);
                                    },
                                  ),
                                ),
                                SizedBox(height: 16,),
                                InkWell(
                                  onTap: (){},
                                  child: OnHoverWidget(
                                    builder: (bool isHovered) {
                                      return Text('Контакты', style: navTxt(color: isHovered? Color(0xFF828282) : Colors.white, fontSize: 16, weight: FontWeight.w400),);
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SelectableText('Социальные сети', style: navTxt(color: Colors.white, fontSize: 20, weight: FontWeight.w700),),
                                SizedBox(height: 20,),
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: (){},
                                      child: Image.asset('assets/insta.png', width: 45, height: 45,),
                                    ),
                                    SizedBox(width: 20,),
                                    InkWell(
                                      onTap: (){},
                                      child: Image.asset('assets/vk.png', width: 45, height: 45,),
                                    ),
                                    SizedBox(width: 20,),
                                    InkWell(
                                      onTap: (){},
                                      child: Image.asset('assets/tg.png', width: 45, height: 45,),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 100),
                        SelectableText('Copyright © 2023 LingvoLand. Все права защищены.', style: navTxt(color: Color(0xff80838C), fontSize: 16, weight: FontWeight.w400),),
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



class FooterTablet extends StatefulWidget {

  const FooterTablet({Key? key}) : super(key: key);

  @override
  _FooterTabletState createState() => _FooterTabletState();
}

class _FooterTabletState extends State<FooterTablet> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
        width: double.infinity,
        height: 433,
        color: dark,
        child: Center(
          child: Container(
            width: 727,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 85,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SelectableText('Контакты', style: navTxt(color: Colors.white, fontSize: 16, weight: FontWeight.w700),),
                        SizedBox(height: 20,),
                        Row(
                          children: [
                            SvgPicture.asset('assets/location.svg', width: 13, height: 16,),
                            SizedBox(width: 8,),
                            SelectableText('ул. Герцена, д. 56', style: navTxt(color: Colors.white, fontSize: 14, weight: FontWeight.w400),)
                          ],
                        ),
                        SizedBox(height: 16,),
                        Row(
                          children: [
                            SvgPicture.asset('assets/mail.svg', width: 13, height: 10,),
                            SizedBox(width: 8,),
                            SelectableText('vologda@lingvoland.ru', style: navTxt(color: Colors.white, fontSize: 14, weight: FontWeight.w400),)
                          ],
                        ),
                        SizedBox(height: 16,),
                        Row(
                          children: [
                            SvgPicture.asset('assets/phone.svg', width: 16, height: 16,),
                            SizedBox(width: 8,),
                            SelectableText('+7(815) 221-4512', style: navTxt(color: Colors.white, fontSize: 14, weight: FontWeight.w400),)
                          ],
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SelectableText('Образование', style: navTxt(color: Colors.white, fontSize: 16, weight: FontWeight.w700),),
                        SizedBox(height: 20,),
                        InkWell(
                          onTap: (){
                            AutoRouter.of(context).pushNamed('/courses');
                          },
                          child: OnHoverWidget(
                            builder: (bool isHovered) {
                              return Text('Курсы', style: navTxt(color: isHovered? Color(0xFF828282) : Colors.white, fontSize: 14, weight: FontWeight.w400),);
                            },
                          ),
                        ),
                        SizedBox(height: 16,),
                        InkWell(
                          onTap: (){},
                          child: OnHoverWidget(
                            builder: (bool isHovered) {
                              return Text('Расписание', style: navTxt(color: isHovered? Color(0xFF828282) : Colors.white, fontSize: 14, weight: FontWeight.w400),);
                            },
                          ),
                        ),
                        SizedBox(height: 16,),
                        InkWell(
                          onTap: (){},
                          child: OnHoverWidget(
                            builder: (bool isHovered) {
                              return Text('Учебники', style: navTxt(color: isHovered? Color(0xFF828282) : Colors.white, fontSize: 14, weight: FontWeight.w400),);
                            },
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SelectableText('О нас', style: navTxt(color: Colors.white, fontSize: 16, weight: FontWeight.w700),),
                        SizedBox(height: 20,),
                        InkWell(
                          onTap: (){},
                          child: OnHoverWidget(
                            builder: (bool isHovered) {
                              return Text('О центре', style: navTxt(color: isHovered? Color(0xFF828282) : Colors.white, fontSize: 14, weight: FontWeight.w400),);
                            },
                          ),
                        ),
                        SizedBox(height: 16,),
                        InkWell(
                          onTap: (){},
                          child: OnHoverWidget(
                            builder: (bool isHovered) {
                              return Text('Блог', style: navTxt(color: isHovered? Color(0xFF828282) : Colors.white, fontSize: 14, weight: FontWeight.w400),);
                            },
                          ),
                        ),
                        SizedBox(height: 16,),
                        InkWell(
                          onTap: (){},
                          child: OnHoverWidget(
                            builder: (bool isHovered) {
                              return Text('Контакты', style: navTxt(color: isHovered? Color(0xFF828282) : Colors.white, fontSize: 14, weight: FontWeight.w400),);
                            },
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SelectableText('Социальные сети', style: navTxt(color: Colors.white, fontSize: 16, weight: FontWeight.w700),),
                        SizedBox(height: 20,),
                        Row(
                          children: [
                            InkWell(
                              onTap: (){},
                              child: Image.asset('assets/insta.png', width: 35, height: 35,),
                            ),
                            SizedBox(width: 20,),
                            InkWell(
                              onTap: (){},
                              child: Image.asset('assets/vk.png', width: 35, height: 35,),
                            ),
                            SizedBox(width: 20,),
                            InkWell(
                              onTap: (){},
                              child: Image.asset('assets/tg.png', width: 35, height: 35,),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 100),
                SelectableText('Copyright © 2023 LingvoLand. Все права защищены.', style: navTxt(color: Color(0xff80838C), fontSize: 14, weight: FontWeight.w400),),
              ],
            ),
          ),
        )
    );
  }
}