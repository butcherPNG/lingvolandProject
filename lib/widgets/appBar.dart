





import 'dart:html';
import 'dart:typed_data';
import 'dart:ui';
import 'dart:io' as io;
import 'package:universal_html/html.dart' as html;
import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:linguasphere/classes/Authent.dart';
import 'package:linguasphere/presentation/main_page.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import '../presentation/courses_page.dart';
import '../styles/styles.dart';
import 'onHoverWidget.dart';

class myAppBar extends StatefulWidget implements PreferredSizeWidget{


  const myAppBar({
    Key? key,

  }) : super(key: key);

  @override
  _myAppBarState createState() => _myAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(70.0);


}
final FirebaseAuth auth = FirebaseAuth.instance;
String profilePic = '';
String? username;
String? role;
class _myAppBarState extends State<myAppBar> with SingleTickerProviderStateMixin{



  Future<void> getUserInfo() async {
    final doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(auth.currentUser!.uid)
        .get();
    setState(() {
      username = doc.data()!['username'] ?? 'No name';
      profilePic = doc.data()!['imgUrl'];
      role = doc.data()!['role'];
    });
  }

  @override
  void initState() {
    getUserInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(
        builder: (context, screen){
          if(screen.maxWidth >= 1200){
            return Container(
              decoration: BoxDecoration(
                color: light_blue,

              ),
              child: Center(
                child: Container(
                  width: 1200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Container(
                        width: 816,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: (){
                                context.goNamed('home');
                              },
                              child: SvgPicture.network('https://firebasestorage.googleapis.com/v0/b/testcollegde.appspot.com/o/lingvolandLOGO.svg?alt=media&token=a1690ecc-78bd-499b-8b44-39cd57c7d9a3',
                                width: 167, height: 55,
                              ),
                            ),
                            Container(
                              width: 595,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: (){
                                      context.goNamed('home');
                                    },
                                    child: OnHoverWidget(
                                      builder: (bool isHovered) {
                                        return Text(
                                          'Главная',
                                          style: navTxt(
                                              color: GoRouter.of(context)
                                                  .location
                                                  .toString() ==
                                                  '/'
                                                  ? dark
                                                  :
                                              isHovered ? Color(0xFF828282) : dark,
                                              fontSize: 16,
                                              weight: GoRouter.of(context).location.toString() == '/' ? FontWeight.w800 : FontWeight.w400),
                                        );
                                      },
                                    ),
                                  ),
                                  InkWell(
                                    onTap: (){
                                      context.goNamed('courses');
                                      print(GoRouter.of(context)
                                          .location);
                                    },
                                    child: OnHoverWidget(
                                      builder: (bool isHovered) {
                                        return Text(
                                          'Курсы',
                                          style: navTxt(
                                              color: GoRouter.of(context).location.startsWith('/courses')
                                                  ? dark
                                                  :
                                              isHovered ? Color(0xFF828282) : dark,
                                              fontSize: 16,
                                              weight: GoRouter.of(context).location.startsWith('/courses') ? FontWeight.w800 : FontWeight.w400),
                                        );
                                      },
                                    ),
                                  ),

                                  InkWell(
                                    onTap: (){},
                                    child: OnHoverWidget(
                                      builder: (bool isHovered) {
                                        return Text(
                                          'О центре',
                                          style: navTxt(
                                              color: GoRouter.of(context)
                                                  .location
                                                  .toString() ==
                                                  '/about'
                                                  ? dark
                                                  :
                                              isHovered ? Color(0xFF828282) : dark,
                                              fontSize: 16,
                                              weight: GoRouter.of(context).location.toString() == '/about' ? FontWeight.w800 : FontWeight.w400),
                                        );
                                      },
                                    ),
                                  ),
                                  InkWell(
                                    onTap: (){},
                                    child: OnHoverWidget(
                                      builder: (bool isHovered) {
                                        return Text(
                                          'Контакты',
                                          style: navTxt(
                                              color: GoRouter.of(context)
                                                  .location
                                                  .toString() ==
                                                  '/contacts'
                                                  ? dark
                                                  :
                                              isHovered ? Color(0xFF828282) : dark,
                                              fontSize: 16,
                                              weight: GoRouter.of(context).location.toString() == '/contacts' ? FontWeight.w800 : FontWeight.w400),
                                        );
                                      },
                                    ),
                                  ),
                                  InkWell(
                                    onTap: (){
                                      context.goNamed('faq');
                                    },
                                    child: OnHoverWidget(
                                      builder: (bool isHovered) {
                                        return Text(
                                          'Вопрос-ответ',
                                          style: navTxt(
                                              color: GoRouter.of(context)
                                                  .location
                                                  .toString().contains('/faq')
                                                  ? dark
                                                  : isHovered
                                                  ? Color(0xFF828282)
                                                  : dark,
                                              fontSize: 16,
                                              weight: GoRouter.of(context).location.toString() == '/faq' ? FontWeight.w800 : FontWeight.w400),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      FirebaseAuth.instance.currentUser == null ?
                      button(onClick: (){context.goNamed('signup');}, text: 'Войти', height: 32, width: 92, color: red, radius: 4)
                      : DropdownButtonHideUnderline(
                        child: DropdownButton2(
                          customButton: SizedBox(
                            width: 180,
                            child: Center(
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.all(Radius.circular(50)),
                                    child: Container(
                                      width: 40,
                                      height: 40,
                                      color: blue,
                                      child: Center(
                                        child: profilePic == ''
                                            ? Icon(Icons.person, size: 30, color: dark,)
                                            : Image.network(profilePic, fit: BoxFit.cover, width: 40, height: 40,),
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ),
                          items: [
                            ...MenuItems.routeItem.map(
                                  (item) => DropdownMenuItem<MenuItem>(
                                  enabled: role == 'admin' ? true : false,
                                  value: item,
                                  child: Container(
                                    padding: EdgeInsets.only(left: 10),
                                    child: username == null
                                        ? CircularProgressIndicator()
                                        : Text(username ?? '...',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: navTxt(
                                            fontSize: 20,
                                            weight: FontWeight.w600,
                                            color: dark)),

                                  )),
                            ),
                            if(role == 'admin')
                              ...MenuItems.panels.map(
                                      (item) => DropdownMenuItem<MenuItem>(
                                      value: item,
                                      child: MenuItems.buildItem(item)
                                  )
                              ),

                            // const DropdownMenuItem<Divider>(enabled: false, child: Divider()),
                            ...MenuItems.secondItems.map(
                                  (item) => DropdownMenuItem<MenuItem>(
                                value: item,
                                child: MenuItems.buildItem(item),
                              ),
                            ),

                              ...MenuItems.lessons.map(
                                    (item) => DropdownMenuItem<MenuItem>(
                                  value: item,
                                  child: MenuItems.buildItem(item),
                                ),
                              ),
                            ...MenuItems.thirdItems.map(
                                  (item) => DropdownMenuItem<MenuItem>(
                                value: item,
                                child: MenuItems.buildItem(item),
                              ),
                            ),
                          ],
                          buttonStyleData: ButtonStyleData(
                              padding: EdgeInsets.only(right: 60)
                          ),
                          dropdownStyleData: DropdownStyleData(
                            width: 180,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Color(0xFFDFDFDF), width: 1),
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.04),
                                    offset: Offset(0, 4),
                                    blurRadius: 16,
                                  )
                                ]),
                          ),
                          onChanged: (value) {
                            MenuItems.onChanged(context, value as MenuItem, screen.maxWidth);
                          },

                        )
                      )
                    ],
                  ),
                ),
              ),
            );
          }else{
            return Container(
              decoration: BoxDecoration(
                color: light_blue,

              ),
              child: Center(
                child: Container(
                  width: screen.maxWidth <= 600 ? 288 : 727,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      InkWell(
                        onTap: (){
                          context.goNamed('home');
                        },
                        child: SvgPicture.network('https://firebasestorage.googleapis.com/v0/b/testcollegde.appspot.com/o/lingvolandLOGO.svg?alt=media&token=a1690ecc-78bd-499b-8b44-39cd57c7d9a3',
                          width: 111, height: 36,
                        ),
                      ),
                      Container(
                        width: 130,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FirebaseAuth.instance.currentUser == null ?
                            button(onClick: (){context.goNamed('signup');}, text: 'Войти', height: 32, width: screen.maxWidth <= 600 ? 84 : 76, color: red, size: 14, radius: 4)
                            : DropdownButtonHideUnderline(
                                child: DropdownButton2(
                                  customButton: SizedBox(

                                    child: Center(
                                      child: Stack(
                                        children: [
                                          ClipRRect(
                                            borderRadius: const BorderRadius.all(Radius.circular(50)),
                                            child: Container(
                                              width: 40,
                                              height: 40,
                                              color: blue,
                                              child: Center(
                                                child: profilePic == ''
                                                    ? Icon(Icons.person, size: 30, color: dark,)
                                                    : Image.network(profilePic, fit: BoxFit.cover, width: 40, height: 40,),
                                              ),
                                            ),
                                          ),

                                        ],
                                      ),
                                    ),
                                  ),
                                  items: [
                                    ...MenuItems.routeItem.map(
                                          (item) => DropdownMenuItem<MenuItem>(
                                          enabled: role == 'admin' ? true : false,
                                          value: item,
                                          child: Container(
                                            padding: EdgeInsets.only(left: 10),
                                            child: username == null
                                                ? CircularProgressIndicator()
                                                : Text(username ?? '...',
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: navTxt(
                                                    fontSize: 20,
                                                    weight: FontWeight.w600,
                                                    color: dark)),

                                          )),
                                    ),
                                    if(role == 'admin')
                                      ...MenuItems.panels.map(
                                              (item) => DropdownMenuItem<MenuItem>(
                                              value: item,
                                              child: MenuItems.buildItem(item)
                                          )
                                      ),

                                    // const DropdownMenuItem<Divider>(enabled: false, child: Divider()),
                                    ...MenuItems.secondItems.map(
                                          (item) => DropdownMenuItem<MenuItem>(
                                        value: item,
                                        child: MenuItems.buildItem(item),
                                      ),
                                    ),

                                    ...MenuItems.lessons.map(
                                          (item) => DropdownMenuItem<MenuItem>(
                                        value: item,
                                        child: MenuItems.buildItem(item),
                                      ),
                                    ),
                                    ...MenuItems.thirdItems.map(
                                          (item) => DropdownMenuItem<MenuItem>(
                                        value: item,
                                        child: MenuItems.buildItem(item),
                                      ),
                                    ),
                                  ],
                                  buttonStyleData: ButtonStyleData(
                                      padding: EdgeInsets.only(right: 60)
                                  ),
                                  dropdownStyleData: DropdownStyleData(
                                    width: 180,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(color: Color(0xFFDFDFDF), width: 1),
                                        borderRadius: BorderRadius.circular(8),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(0.04),
                                            offset: Offset(0, 4),
                                            blurRadius: 16,
                                          )
                                        ]),
                                  ),
                                  onChanged: (value) {
                                    MenuItems.onChanged(context, value as MenuItem, screen.maxWidth);
                                  },

                                )
                            ),
                            IconButton(
                              icon: Icon(Icons.menu, color: dark,),
                              onPressed: () {
                                Scaffold.of(context).openEndDrawer();
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        }
    );
  }



}


class MenuItem {
  final String text;


  const MenuItem({
    required this.text,

  });


}


class MenuItems {

  static const List<MenuItem> secondItems = [settings, history];
  static const List<MenuItem> lessons = [lesson];
  static const List<MenuItem> thirdItems = [exit];
  static const List<MenuItem> panels = [panel];
  static const List<MenuItem> routeItem = [route];

  static const settings = MenuItem(text: 'Настройки',);
  static const history = MenuItem(text: 'Материалы',);
  static const lesson = MenuItem(text: 'Занятия',);
  static const exit = MenuItem(text: 'Выход',);
  static const panel = MenuItem(text: 'Заявки',);
  static const route = MenuItem(text: 'da',);

  static Widget buildItem(MenuItem item) {
    if(item.text == 'Заявки'){
      return StreamBuilder(
          stream: FirebaseFirestore.instance.collection('users').doc(
              auth.currentUser!.uid).collection('new_requests').snapshots(),
          builder: (ctx, snap){
            if(snap.hasData || !snap.hasData){
              return Row(
                children: [

                  const SizedBox(
                    width: 10,
                  ),

                  Text(
                    item.text,
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  snap.data!.docs.isEmpty
                      ? SizedBox.shrink() : Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(50))
                    ),
                    child: Center(
                      child: Text(snap.data!.docs.length.toString(), style: navTxt(fontSize: 14, weight: FontWeight.w500, color: Colors.white),),
                    ),
                  )
                ],
              );
            }else{
              return Row(
                children: [

                  const SizedBox(
                    width: 10,
                  ),

                  Text(
                    item.text,
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  Container(
                    width: 25,
                    height: 25,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                ],
              );
            }
          }
      );
    }else{
      return Row(
        children: [

          const SizedBox(
            width: 10,
          ),

          Text(
            item.text,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ],
      );
    }
  }
  static onChanged(BuildContext context, MenuItem item, double screen) async {
    switch (item) {

      case MenuItems.settings:
        showUserSettings(context, profilePic, username!, auth.currentUser!.email.toString(), screen);

        break;
      case MenuItems.history:


        break;
      case MenuItems.lesson:
        context.goNamed('lessons');
        break;

      case MenuItems.exit:
        FirebaseAuth.instance.signOut();
        context.goNamed('home');
        break;

      case MenuItems.route:

        break;

      case MenuItems.panel:
        context.goNamed('/dashboard');

        break;
    }
  }
}




final GlobalKey<FormState> formKey = GlobalKey<FormState>();
io.File? pickedImage;
File? selectedImg;
late String imgPath;
Uint8List webImage = Uint8List(8);



class ImagePick extends StatefulWidget {
  final String img;
  final String email;
  final String name;
  final double screen;
  const ImagePick({
    super.key,
    required this.img,
    required this.screen,
    required this.email,
    required this.name,
  });

  @override
  State<ImagePick> createState() => _ImagePickState();
}

class _ImagePickState extends State<ImagePick> {
  TextEditingController _changeUsername = TextEditingController(text: username);
  pickImage() async {
    if (kIsWeb){
      final ImagePicker _picker = ImagePicker();
      XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if(image != null){

        var f = await image.readAsBytes();
        setState(()  {
          webImage =  f;
          pickedImage = io.File('img');
          imgPath = image.path;
        });

      }else{

      }
    }
  }

  saveSettings() async {
    if(formKey.currentState!.validate()){
      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(
      //       backgroundColor: Colors.green,
      //       content: Text(
      //           'Настройки профиля успешно изменены!')),
      // );
      if(pickedImage != null){
        await uploadPfp().then((value){

        });
        String pfp = await getDownload();
        await FirebaseFirestore.instance.collection('users').doc(auth.currentUser!.uid).update({
          'imgUrl': pfp,
          'username': _changeUsername.text
        });
      }else{
        await FirebaseFirestore.instance.collection('users').doc(auth.currentUser!.uid).update({
          'username': _changeUsername.text
        });
      }





    }
  }

  Future uploadPfp() async {


    if (pickedImage != null){

      io.File uploadFile = io.File(imgPath);

      try {
        await firebase_storage.FirebaseStorage.instance
            .ref('uploads/${uploadFile.path}')
            .putData(webImage);
      } catch (e) {
        print(e);
      }
    }



  }

  Future<String> getDownload() async {

    if (pickedImage != null){
      io.File uploadedFile = io.File(imgPath);

      return firebase_storage.FirebaseStorage.instance
          .ref('uploads/${uploadedFile.path}')
          .getDownloadURL();
    }else{
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.screen <= 600){
      return Container(
          width: 238,
          height: 491,
          child: ListView(
            children: [
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(100)),
                      child: Container(
                        width: 110,
                        height: 110,
                        color: blue,
                        child: pickedImage == null ? Center(
                          child: widget.img == ''
                              ? Icon(Icons.person, size: 45, color: dark,)
                              : Image.network(profilePic, fit: BoxFit.cover, width: 110, height: 110,),
                        )
                            : Center(
                          child: Image.memory(webImage, fit: BoxFit.cover, width: 110, height: 110,),
                        ),
                      ),
                    ),
                    SizedBox(height: 8,),
                    TextButton(onPressed: (){pickImage();}, child: Text('Загрузить', style: blockTxt(size: 16, color: Color(0xff1372FF)),)),
                  ],
                ),
              ),
              SizedBox(height: 16,),
              Center(
                child: SizedBox(
                    width: 238,
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 6, bottom: 6),
                            child: Text('Имя', style: subHeaderTxt(size: 20),),
                          ),
                          TextFormField(
                            controller: _changeUsername,
                            validator: (string){
                              if (string!.isEmpty) return 'Поле не может быть пустым';
                            },
                            style: blockTxt(),
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                              hintText: username,
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
                                borderRadius: BorderRadius.circular(4.0),
                                borderSide: BorderSide(
                                  color: Color(0xFFC4C4C4),
                                  width: 1.0,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.0),
                                borderSide: BorderSide(
                                  color: Color(0xFFC4C4C4),
                                  width: 1.0,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.0),
                                borderSide: BorderSide(
                                  color: Color(0xFFC4C4C4),
                                  width: 1.0,
                                ),
                              ),
                              hoverColor: Colors.transparent,
                            ),
                          ),
                          SizedBox(height: 16,),
                          Padding(
                            padding: const EdgeInsets.only(left: 6, bottom: 6),
                            child: Text('Почта', style: subHeaderTxt(size: 20),),
                          ),
                          TextFormField(
                            enabled: false,
                            style: blockTxt(),
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                              hintText: widget.email,
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
                                borderRadius: BorderRadius.circular(4.0),
                                borderSide: BorderSide(
                                  color: Color(0xFFC4C4C4),
                                  width: 1.0,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.0),
                                borderSide: BorderSide(
                                  color: Color(0xFFC4C4C4),
                                  width: 1.0,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.0),
                                borderSide: BorderSide(
                                  color: Color(0xFFC4C4C4),
                                  width: 1.0,
                                ),
                              ),
                              hoverColor: Colors.transparent,
                            ),
                          ),
                          SizedBox(height: 18,),
                          TextButton(onPressed: (){}, child: Text('Сменить пароль', style: blockTxt(size: 16, color: Color(0xff1372FF)),)),
                          SizedBox(height: 28,),
                          button(onClick: () async {
                            await saveSettings();
                            html.window.location.reload();
                            }, text: 'Сохранить изменения', width: 238, height: 45, radius: 4)
                        ],
                      ),
                    )
                ),
              ),

            ],
          )
      );
    }else{
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Настройки профиля', style: subHeaderTxt(size: 28),),
          SizedBox(height: 32,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(100)),
                    child: Container(
                      width: 118,
                      height: 118,
                      color: blue,
                      child: pickedImage == null ? Center(
                        child: widget.img == ''
                            ? Icon(Icons.person, size: 50, color: dark,)
                            : Image.network(profilePic, fit: BoxFit.cover, width: 118, height: 118,),
                      )
                          : Center(
                        child: Image.memory(webImage, fit: BoxFit.cover, width: 118, height: 118,),
                      ),
                    ),
                  ),
                  SizedBox(height: 8,),
                  TextButton(onPressed: (){pickImage();}, child: Text('Загрузить', style: blockTxt(size: 20, color: Color(0xff1372FF)),)),
                ],
              ),
              SizedBox(
                  width: 285,
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 6, bottom: 6),
                          child: Text('Имя', style: subHeaderTxt(size: 24),),
                        ),
                        TextFormField(
                          controller: _changeUsername,
                          validator: (string){
                            if (string!.isEmpty) return 'Поле не может быть пустым';
                          },
                          style: blockTxt(),
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            hintText: username,
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
                        SizedBox(height: 28,),
                        Padding(
                          padding: const EdgeInsets.only(left: 6, bottom: 6),
                          child: Text('Почта', style: subHeaderTxt(size: 24),),
                        ),
                        TextFormField(
                          enabled: false,
                          style: blockTxt(),
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            hintText: widget.email,
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
                        SizedBox(height: 18,),
                        TextButton(onPressed: (){}, child: Text('Сменить пароль', style: blockTxt(size: 20, color: Color(0xff1372FF)),)),
                        SizedBox(height: 36,),
                        button(onClick: () async {
                          await saveSettings();
                          html.window.location.reload();
                        }, text: 'Сохранить изменения', width: 285, height: 45)
                      ],
                    ),
                  )
              )
            ],
          ),
        ],
      );
    }
  }
}


showUserSettings(BuildContext context, String img, String username, String email, double screen){

  showDialog(
      context: context,
      builder: (BuildContext context){
        if(screen <= 600){
          return Dialog(

              child: Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, top: 22, bottom: 22),
                child: ImagePick(img: img, screen: screen, email: email, name: username,)
              )
          );
        }else{
          return Dialog(

              child: Padding(
                padding: EdgeInsets.only(left: 64, right: 64, top: 32, bottom: 60),
                child: Container(
                    width: 463,
                    height: 491,
                    child: ImagePick(img: img, screen: screen, email: email, name: username,)
                ),
              )
          );
        }
      }
  );
}